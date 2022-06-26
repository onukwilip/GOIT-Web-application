using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using MailKit;
using MailKit.Net.Smtp;
using MimeKit;
using MailKit.Security;

namespace GO_IT
{
    public partial class Word_processing : System.Web.UI.Page
    {
        string id = "004";
        int alltotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie _ID = Request.Cookies["myuser"];

            string User = _ID != null ? _ID.Value.Split('=')[1] : "undefined";

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select1 = "SELECT * FROM Users WHERE Email='" + User + "'";
            SqlCommand cmd1 = new SqlCommand(select1, con);

            string select = "SELECT * FROM Service WHERE ID='" + id + "'";
            SqlCommand cmd = new SqlCommand(select, con);

            SqlDataReader read1 = cmd1.ExecuteReader();

            if (read1.HasRows)
            {
                if (read1.Read() == true)
                {
                    string uname = read1.GetValue(1).ToString();
                    string code = read1.GetValue(0).ToString();
                    login.Visible = false;
                    user.Visible = true;
                    name1.InnerHtml = String.Concat("<i class=\"fa-solid fa-user-check\"></i>", " ", " Hey!..." + uname.Split(' ')[0] + "");
                    name1.HRef = "Dashboard.aspx?id=" + code + "";
                    login2.Visible = false;
                    user2.Visible = true;
                    name2.InnerHtml = String.Concat("<i class=\"fa-solid fa-user-check\"></i>", " ", " Hey!..." + uname.Split(' ')[0] + "");
                    name2.HRef = "Dashboard.aspx?id=" + code + "";
                    cart.HRef = "cart.aspx?id=" + code + "";
                    cart2.HRef = "cart.aspx?id=" + code + "";
                }
            }

            else
            {
                login.Visible = true;
                user.Visible = false;
                login2.Visible = true;
                user2.Visible = false;
                cart.HRef = "Register.aspx";
                cart2.HRef = "Register.aspx";
            }

            read1.Close();

            SqlDataReader read = cmd.ExecuteReader();

            while (read.Read())
            {
                price.InnerHtml = read.GetValue(2).ToString();
                alltotal = Convert.ToInt32(read.GetValue(2));
                s_name1.InnerHtml = read.GetValue(1).ToString();
                s_name2.InnerHtml = read.GetValue(1).ToString();
            }

            read.Close();

            con.Close();
        }

        protected void Submit(object sender, EventArgs e)
        {
            HttpCookie _ID = Request.Cookies["myuser"];

            string id = "004", client = _ID != null ? _ID.Value.Split('=')[1] : "undefined", orderid = new GeneralClass()._random().ToString(), Mydesc = description.Value, Myfeatures = features.Value;
            DateTime _date = DateTime.Now.AddDays(7);

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            int _allTotal = Convert.ToInt32(tryTotal.Value);
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"TOTAL: '" + _allTotal + "'\");", true);
            string allFeatures = string.Concat(features.Value, "; ", "Number of pages:", pages.Value, "; ");

            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"FEATURES: '" + allFeatures + "'\");", true);

            string _select = "SELECT * FROM Users WHERE Email='" + client + "'";
            SqlCommand _cmd1 = new SqlCommand(_select, con);

            string select = "SELECT * FROM Service WHERE ID='" + id + "'";
            SqlCommand cmd1 = new SqlCommand(select, con);

            SqlDataReader _read = _cmd1.ExecuteReader();

            if (_read.HasRows)
            {
                if (_read.Read() == true)
                {
                    string clientID = _read.GetValue(0).ToString();

                    _read.Close();

                    SqlDataReader read = cmd1.ExecuteReader();

                    if (read.Read() == true)
                    {
                        string sName = read.GetValue(1).ToString();
                        read.Close();

                        if (name.Value != null || name.Value != "")
                        {
                            errorName.Visible = false;
                            //errorName.Text = "*Project name must not be less than 6 characters...";
                        }

                        if (Convert.ToInt32(pages.Value) > 1 || Convert.ToInt32(pages.Value) < 10)
                        {
                            errorPages.Visible = false;
                            //errorPages.Text = "*Number of pages name must not be less than 1 nor greater than 10...";
                        }

                        if (date.Value != null || date.Value != "")
                        {
                            errorDate.Visible = false;
                            //errorDate.Text = "*Please specify a date...";
                        }

                        if (description.Value != null || Mydesc.Length > 50)
                        {
                            errorDesc.Visible = false;
                            //errorDesc.Text = "*Description must not be less than 50 characters...";
                        }

                        if (features.Value != null || Myfeatures.Length > 50)
                        {
                            errorFeatures.Visible = false;
                            //errorFeatures.Text = "*Features must not be less than 50 characters...";
                        }

                        //VALIDATION

                        if (name.Value == null || name.Value == "")
                        {
                            errorName.Visible = true;
                            errorName.Text = "*Project name must not be less than 6 characters...";
                        }

                        else if (Convert.ToInt32(pages.Value) < 1 || Convert.ToInt32(pages.Value) > 10)
                        {
                            errorPages.Visible = true;
                            errorPages.Text = "*Number of pages name must not be less than 1 nor greater than 10...";
                        }

                        else if (date.Value == null || date.Value == "")
                        {
                            errorDate.Visible = true;
                            errorDate.Text = "*Please specify a date...";
                        }

                        else if (Convert.ToDateTime(date.Value) < DateTime.Now)
                        {
                            errorDate.Visible = true;
                            errorDate.Text = "*Date must be greater than today...";
                        }

                        else if ((Convert.ToDateTime(date.Value) - DateTime.Now).TotalDays < 7)
                        {
                            errorDate.Visible = true;
                            errorDate.Text = "*Date must be greater than or equal to 7 days...";
                            //Response.Write("<script>alert('" + (Convert.ToDateTime(date.Value) - DateTime.Now).TotalDays + "')</script>");
                        }

                        else if (description.Value == null || Mydesc.Length < 50)
                        {
                            errorDesc.Visible = true;
                            errorDesc.Text = "*Description must not be less than 50 characters...";
                        }

                        else if (features.Value == null || Myfeatures.Length < 50)
                        {
                            errorFeatures.Visible = true;
                            errorFeatures.Text = "*Features must not be less than 50 characters...";
                        }

                        else
                        {
                            byte[] a1, a2, a3;
                            using (BinaryReader br1 = new BinaryReader(attach1.PostedFile.InputStream))
                            {
                                a1 = br1.ReadBytes(attach1.PostedFile.ContentLength);
                            }

                            using (BinaryReader br2 = new BinaryReader(attach2.PostedFile.InputStream))
                            {
                                a2 = br2.ReadBytes(attach2.PostedFile.ContentLength);
                            }

                            using (BinaryReader br3 = new BinaryReader(attach3.PostedFile.InputStream))
                            {
                                a3 = br3.ReadBytes(attach3.PostedFile.ContentLength);
                            }

                            string insert = "INSERT INTO Cart(ServiceID, ServiceName, ServiceAmount, ProjectName, Description, Features, ClientID, OrderID, DateOrdered, Attachment1, Attachment2, Attachment3, DateExpected, Quantity, TotalAmount, image) VALUES('" + id + "', '" + sName + "', " + _allTotal + ", '" + name.Value + "','" + description.Value + "', '" + allFeatures + "', '" + clientID + "', '" + orderid + "', '" + DateTime.Now.Date + "', @attach1, @attach2, @attach3, '" + date.Value + "', '1', " + _allTotal + ", '" + image.Src + "')";

                            SqlCommand cmd = new SqlCommand(insert, con);

                            cmd.Parameters.AddWithValue("@attach1", a1);
                            cmd.Parameters.AddWithValue("@attach2", a2);
                            cmd.Parameters.AddWithValue("@attach3", a3);

                            SqlDataAdapter sda2 = new SqlDataAdapter();
                            sda2.InsertCommand = cmd;
                            sda2.InsertCommand.ExecuteNonQuery();

                            if (extrapage.Checked == true)
                            {
                                string extra_insert = "INSERT INTO CartExtra(Name, ID, OrderID, Price, ClientID) VALUES('" + extrapage.Value + ": " + pageqty.Value + "', '" + new GeneralClass()._random().ToString() + "', '" + orderid + "', " + Convert.ToInt32(page_price.InnerHtml) + ", '" + clientID + "')";
                                SqlCommand extra_cmd = new SqlCommand(extra_insert, con);
                                SqlDataAdapter extra_sda = new SqlDataAdapter();
                                extra_sda.InsertCommand = extra_cmd;
                                extra_sda.InsertCommand.ExecuteNonQuery();
                            }

                            else { }
                            
                            //Confirmation
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Your request has been successfully recieved, go to your cart to view your request :)...\");", true);

                            //Total & initial
                            tryTotal.Value = price.InnerHtml;
                            initial.Value = price.InnerHtml;
                            //Project
                            name.Value = "";
                            date.Value = "";
                            description.Value = "";
                            features.Value = "";
                            //checkboxes and values
                            pageqty.Value = "";
                            extrapage.Checked = false;
                            //errors
                            errorDate.Visible = false;
                            errorDesc.Visible = false;
                            errorFeatures.Visible = false;
                            errorName.Visible = false;
                            errorPages.Visible = false;

                            Response.Redirect("Word processing.aspx");
                        }

                        read = cmd1.ExecuteReader();
                    }

                    read.Close();

                    _read = _cmd1.ExecuteReader();
                }
            }

            else
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"You are not logged in '" + client + "'\");", true);
                Response.Redirect("Register.aspx");
            }

            _read.Close();

            con.Close();
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            HttpCookie _ID = Request.Cookies["myuser"];
            string _User = _ID != null ? _ID.Value.Split('=')[1] : "undefined";

            if (_name.Value == "" || _name.Value == null)
            {
                _errorName.Visible = true;
                _errorName.Text = "*This field cannot be empty...";
            }

            else if (_phone.Value == "" || _phone.Value == null)
            {
                _errorPhone.Visible = true;
                _errorPhone.Text = "*This field cannot be empty...";
            }

            else if (_subject.Value == "" || _subject.Value == null)
            {
                _errorSubject.Visible = true;
                _errorSubject.Text = "*This field cannot be empty...";
            }

            else if (_message.Value == "" || _message.Value == null)
            {
                _errorMessage.Visible = true;
                _errorMessage.Text = "*This field cannot be empty...";
            }

            else
            {
                try
                {
                    var message = new MimeMessage();
                    message.From.Add(new MailboxAddress(_name.Value, _User));
                    message.To.Add(new MailboxAddress("GO-IT", "onukwilip@gmail.com"));
                    message.Subject = _subject.Value;

                    message.Body = new TextPart("html")
                    {
                        Text = _message.Value
                    };

                    using (var client = new SmtpClient())
                    {
                        // For demo-purposes, accept all SSL certificates (in case the server supports STARTTLS)
                        client.ServerCertificateValidationCallback = (s, c, h, t) => true;

                        client.Connect("smtp.gmail.com", 587, false);

                        // Note: only needed if the SMTP server requires authentication
                        client.Authenticate("onukwilip@gmail.com", "onukwilip2006+_");

                        client.Send(message);
                        client.Disconnect(true);
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Message sent successfully\");", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"" + ex.Message + "\");", true);
                }
            }
        }

        protected void reset_Click(object sender, EventArgs e)
        {
            _name.Value = null;
            _phone.Value = null;
            _subject.Value = null;
            _message.Value = null;
            //Errors
            _errorName.Visible = false;
            _errorPhone.Visible = false;
            _errorSubject.Visible = false;
            _errorMessage.Visible = false;
        }
    }
}