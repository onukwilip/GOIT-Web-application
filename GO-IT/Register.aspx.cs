using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MailKit.Security;
using MailKit.Net.Smtp;
using System.Data.SqlClient;
using System.Configuration;
using MimeKit;

namespace GO_IT
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie _ID = Request.Cookies["myuser"];

            string User = _ID != null ? _ID.Value.Split('=')[1] : "undefined", code2 = String.Empty;

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Users WHERE Email='" + User + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                if (read.Read() == true)
                {
                    string uname = read.GetValue(1).ToString();
                    string code = read.GetValue(0).ToString();
                    code2 = read.GetValue(0).ToString();
                    login1.Visible = false;
                    user.Visible = true;
                    name.InnerHtml = String.Concat("<i class=\"fa-solid fa-user-check\"></i>", " ", " Hey!..." + uname.Split(' ')[0] + "");
                    name.HRef = "Dashboard.aspx?id=" + code + "";
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
                login1.Visible = true;
                user.Visible = false;
                login2.Visible = true;
                user2.Visible = false;
                cart.HRef = "#";
                cart2.HRef = "Register.aspx";
            }

            con.Close();
            
            GeneralClass general = new GeneralClass();
            general.SubBadge("Cart", cart_badge, code2);
            general.SubBadge("Cart", cart_badge2, code2);
        }

        protected void Mail(int code, string email, string fName, string lName, string Body, string subject)
        {
            try
            {
                var message = new MimeMessage();
                message.From.Add(new MailboxAddress("Go-IT", "onukwilip@gmail.com"));
                message.To.Add(new MailboxAddress(string.Concat(fName, " ", lName), email));
                message.Subject = subject;

                message.Body = new TextPart("html")
                {
                    Text = Body
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
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"" + ex.Message + "\");", true);
            }
        }

        protected string MyGuid()
        {
            Guid guid = Guid.NewGuid();
            string unique = guid.ToString();
            return unique;
        }

        protected int _random()
        {
            int num = new Random().Next(100000, 9999999);
            return num;
        }

        protected void SignUp(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            int _rno = _random();
            string Email = Request.Form["Email"];
            string FName = Request.Form["Firstname"];
            string LName = Request.Form["Lastname"];
            string PWord = Request.Form["password"];

            if (Email == null || Email == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Email field can't be empty\");", true);
            }

            else if (FName == null || FName == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Firstname field can't be empty\");", true);
            }

            else if (LName == null || LName == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Lastname field can't be empty\");", true);
            }

            else if (PWord == null || PWord == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"password field can't be empty\");", true);
            }

            else
            {
                string select = "SELECT * FROM Users WHERE Email='" + Email + "'";
                SqlCommand cmd = new SqlCommand(select, con);
                SqlDataReader read = cmd.ExecuteReader();

                if (read.HasRows)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Email already exist\");", true);
                    //Response.Redirect("Index.aspx");
                }

                else
                {
                    read.Close();

                    string insert = "INSERT INTO Users(UserId, Username, Password, Email, status, authenticated, CreatedDate, ConfirmCode, imgid) VALUES('" + MyGuid() + "','" + string.Concat(FName, " ", LName) + "', '" + PWord + "', '" + Email + "', 'false', 'false', '" + DateTime.Now + "', '" + _rno + "', "+_random()+")";
                    SqlCommand icmd = new SqlCommand(insert, con);
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.InsertCommand = icmd;
                    sda.InsertCommand.ExecuteNonQuery();

                    string htmlbody = "<h4 style=\"background-color:blue; padding:20px;\">Welcome to GOIT</h4><br/><h3 style=\"align:center;\">Please confirm this email by copying the code and inputing it in our confirmation page<br/></h3> <h1>" + _rno + "</h1> <h4 style=\"background-color:blue; padding:20px;\" >Copyright@ GOIT...</h4>";

                    try
                    {
                        var message = new MimeMessage();
                        message.From.Add(new MailboxAddress("Go-IT", "onukwilip@gmail.com"));
                        message.To.Add(new MailboxAddress(FName, Email.Trim()));
                        message.Subject = "Confirmation";

                        message.Body = new TextPart("html")
                        {
                            Text = " <h4 style =\"background-color:blue; padding:20px;\">Welcome to GOIT</h4><br/><h3 style=\"align:center;\">Please confirm this email by copying the code and inputing it in our confirmation page<br/></h3> <h1>" + _rno + "</h1> <h4 style=\"background-color:blue; padding:20px;\" >Copyright@ GOIT...</h4>"
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
                    }
                    catch (Exception)
                    {

                    }
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Hurray you've been registered in...\");", true);

                    con.Close();

                    Session["id"] = Email;
                    Session["password"] = "null";

                    Response.Redirect("Confirm.aspx");
                }
            }
        }

        protected void mytry()
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Hurray you've been registered in...\");", true);
        }

        protected void forgot_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Users WHERE Email='" + Username.Value + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                if (read.Read()==true)
                {
                    int _rno = _random();
                    string FName = read.GetValue(1).ToString().Split(' ')[0], LName = read.GetValue(1).ToString().Split(' ')[1], Body = "<h4 style=\"background-color:blue; padding:20px;\">Welcome to GOIT</h4><br/><h3 style=\"align:center;\">Please confirm this email by copying the code and inputing it in our confirmation page<br/></h3> <h1>" + _rno + "</h1> <h4 style=\"background-color:blue; padding:20px;\" >Copyright@ GOIT...</h4>";
                    read.Close();

                    string update = "UPDATE Users SET ConfirmCode=" + _rno + " WHERE Email='" + Username.Value + "' ";
                    SqlCommand ucmd = new SqlCommand(update, con);
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.UpdateCommand = ucmd;
                    sda.UpdateCommand.ExecuteNonQuery();

                    Mail(_rno, Username.Value, FName, LName, Body, "Confirmation");

                    con.Close();

                    Session["id"] = Username.Value;
                    Session["password"] = "password";

                    Response.Redirect("Confirm.aspx");
                }
            }

            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Account with username " + Username.Value + " doesn't exist\");", true);
            }
        }

        protected void signin_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Users WHERE Email='" + Username.Value + "' AND Password='" + pword.Value + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                if (read.Read() == true)
                {
                    int _rno = _random();
                    string authenticate = read.GetValue(7).ToString(), FName = read.GetValue(1).ToString().Split(' ')[0], LName = read.GetValue(1).ToString().Split(' ')[1], Body = "<h4 style=\"background-color:blue; padding:20px;\">Welcome to GOIT</h4><br/><h3 style=\"align:center;\">Please confirm this email by copying the code and inputing it in our confirmation page<br/></h3> <h1>" + _rno + "</h1> <h4 style=\"background-color:blue; padding:20px;\" >Copyright@ GOIT...</h4>";
                    read.Close();

                    if (authenticate == "false")
                    {
                        string update = "UPDATE Users SET ConfirmCode=" + _rno + " WHERE Email='" + Username.Value + "' ";
                        SqlCommand ucmd = new SqlCommand(update, con);
                        SqlDataAdapter sda = new SqlDataAdapter();
                        sda.UpdateCommand = ucmd;
                        sda.UpdateCommand.ExecuteNonQuery();

                        Mail(_rno, Username.Value, FName, LName, Body, "Confirmation");

                        con.Close();

                        Session["id"] = Username.Value;
                        Session["password"] = "null";

                        Response.Redirect("Confirm.aspx");
                    }

                    else if (authenticate == "true")
                    {
                        string update2 = "UPDATE Users SET status='true', ConfirmCode=" + 0 + ", LoginDate='" + DateTime.Now + "' WHERE Email='" + Username.Value + "' ";
                        SqlCommand ucmd2 = new SqlCommand(update2, con);
                        ucmd2.CommandTimeout = 3600;
                        SqlDataAdapter sda2 = new SqlDataAdapter();
                        sda2.UpdateCommand = ucmd2;
                        sda2.UpdateCommand.ExecuteNonQuery();
                        
                        HttpCookie id = new HttpCookie("myuser") { Secure = true };
                        id.Values["myuser"] = Username.Value;
                        Response.Cookies.Add(id);

                        con.Close();

                        Response.Redirect("index.aspx");

                    }
                    read = cmd.ExecuteReader();
                }
            }

            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Invalid username or password\");", true);
            }
        }
    }
}