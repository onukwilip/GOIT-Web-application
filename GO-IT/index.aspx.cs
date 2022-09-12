using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using MailKit;
using MailKit.Net.Smtp;
using MimeKit;
using MailKit.Security;

namespace GO_IT
{
    public partial class index : System.Web.UI.Page
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
                    code2= read.GetValue(0).ToString(); 
                    login.Visible = false;
                    user.Visible = true;
                    name.InnerHtml = String.Concat("<i class=\"fa-solid fa-user-check\"></i>", " ", " Hey!..." + uname.Split(' ')[0] + "");
                    name.HRef = "Dashboard.aspx?id=" + code + "";
                    login2.Visible = false;
                    user2.Visible = true;
                    name2.InnerHtml = String.Concat("<i class=\"fa-solid fa-user-check\"></i>", " ", " Hey!..." + uname.Split(' ')[0] + "");
                    name2.HRef = "Dashboard.aspx?id=" + code + "";
                    cart.HRef = "cart.aspx?id=" + code + "";
                    cart2.HRef= "cart.aspx?id=" + code + "";
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

            con.Close();

            GeneralClass general = new GeneralClass();
            general.SubBadge("Cart", cart_badge, code2);
            general.SubBadge("Cart", cart_badge2, code2);
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");
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
                        client.Authenticate("onukwilip@gmail.com", "pivwvtojhaqeibge");

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
