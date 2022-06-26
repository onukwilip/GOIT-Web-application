using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MailKit.Net.Smtp;
using System.Data.SqlClient;
using System.Configuration;
using MimeKit;
using System.IO;

namespace GO_IT
{
    public class GeneralClass
    {
        public void Mail(int code, string email, string fName, string lName, string Body, string subject)
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
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"" + ex.Message + "\");", true);
            }
        }

        public string MyGuid()
        {
            Guid guid = Guid.NewGuid();
            string unique = guid.ToString();
            return unique;
        }

        public int _random()
        {
            int num = new Random().Next(100000, 9999999);
            return num;
        }

        public void generic()
        {
            //string id = Request.QueryString["id"];

            string constring = @"Data Source=DESKTOP-22TB9CF\SQLEXPRESS; Initial Catalog=Prince; Integrated Security=True;";
            SqlConnection con = new SqlConnection(constring);
            string query = "SELECT Data FROM tblFiles WHERE id=@ProductiD";

            SqlCommand com = new SqlCommand(query, con);
            //com.Parameters.Add("@ProductiD", SqlDbType.Int).Value = Int32.Parse(id);

            con.Open();
            SqlDataReader r = com.ExecuteReader();

            if (r.Read())
            {
                byte[] imgData = (byte[])r["Data"];
                //Response.BinaryWrite(imgData);
            }

            con.Close();
        }
    }
}