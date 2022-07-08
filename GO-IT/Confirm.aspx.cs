using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace GO_IT
{
    public partial class Confirm : System.Web.UI.Page
    {
        HttpCookie _ID = new HttpCookie("myuser") { Secure = true };
        GeneralClass general = new GeneralClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            /* string id = Session["id"].ToString();
             ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Your session id is "+id+"\");", true); */

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
                    login.Visible = false;
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

        protected void confirmation_Click(object sender, EventArgs e)
        {
            string id = Session["id"].ToString(), pword = Session["password"].ToString();

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            if (pword=="null")
            {
                string select = "SELECT * FROM Users WHERE Email='" + id + "'";
                SqlCommand cmd = new SqlCommand(select, con);
                SqlDataReader read = cmd.ExecuteReader();

                if (read.HasRows)
                {
                    if (read.Read() == true)
                    {
                        int code = Convert.ToInt32(read.GetValue(9));
                        read.Close();

                        if (confirmcode.Value == code.ToString())
                        {
                            string update = "UPDATE Users SET status='true', authenticated='true', ConfirmCode=" + 0 + ", LoginDate='" + DateTime.Now + "' WHERE Email='" + id + "' ";
                            SqlCommand ucmd = new SqlCommand(update, con);
                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.UpdateCommand = ucmd;
                            sda.UpdateCommand.ExecuteNonQuery();

                            con.Close();

                            _ID.Values["myuser"] = id;
                            Response.Cookies.Add(_ID);
                            Response.Redirect("index.aspx");
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Your code is invalid\");", true);
                        }
                        read = cmd.ExecuteReader();
                    }
                }

                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Email not found please go and login again\");", true);
                }
            }

            else if (pword== "password")
            {
                string select = "SELECT * FROM Users WHERE Email='" + id + "'";
                SqlCommand cmd = new SqlCommand(select, con);
                SqlDataReader read = cmd.ExecuteReader();

                if (read.HasRows)
                {
                    if (read.Read() == true)
                    {
                        int code = Convert.ToInt32(read.GetValue(9));
                        read.Close();

                        if (confirmcode.Value == code.ToString())
                        {
                            string update = "UPDATE Users SET ConfirmCode=" + 0 + " WHERE Email='" + id + "' ";
                            SqlCommand ucmd = new SqlCommand(update, con);
                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.UpdateCommand = ucmd;
                            sda.UpdateCommand.ExecuteNonQuery();

                            con.Close();

                            Session["id"] = id;
                            Response.Redirect("Changepassword.aspx");
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Your code is invalid\");", true);
                        }
                        read = cmd.ExecuteReader();
                    }
                }

                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Email not found please go and login again\");", true);
                }
            }

           
        }

        protected void resend_Click(object sender, EventArgs e)
        {
            int _rno = general._random();
            string id = Session["id"].ToString(), Body = "<h4 style=\"background-color:blue; padding:20px;\">Welcome to GOIT</h4><br/><h3 style=\"align:center;\">Please confirm this email by copying the code and inputing it in our confirmation page<br/></h3> <h1>" + _rno + "</h1> <h4 style=\"background-color:blue; padding:20px;\" >Copyright@ GOIT...</h4>";

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string update = "UPDATE Users SET ConfirmCode=" + _rno + " WHERE Email='" + id + "' ";
            SqlCommand ucmd = new SqlCommand(update, con);
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.UpdateCommand = ucmd;
            sda.UpdateCommand.ExecuteNonQuery();

            con.Close();

            general.Mail(_rno, id, "", "", Body, "Confirmation");
        }
    }
}