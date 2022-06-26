using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace GO_IT
{
    public partial class Changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* string id = Session["id"].ToString();
             ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Your session id is " + id + "\");", true); */

            HttpCookie _ID = Request.Cookies["myuser"];

            string User = _ID != null ? _ID.Value.Split('=')[1] : "undefined";

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
        }

        protected void confirmation_Click(object sender, EventArgs e)
        {
            if (password.Value==null||password.Value=="")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Password musn't be less than 6 characters...\");", true);
            }

            else if (confirm.Value!=password.Value)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Confirm password must be same as password\");", true);
            }

            else
            {
                string id = Session["id"].ToString();
                string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                con.Open();

                string select = "SELECT * FROM Users WHERE Email='" + id + "'";
                SqlCommand cmd = new SqlCommand(select, con);
                SqlDataReader read = cmd.ExecuteReader();

                if (read.HasRows)
                {
                    read.Close();

                    string update = "UPDATE Users SET Password='" + password.Value + "' WHERE Email='" + id + "' ";
                    SqlCommand ucmd = new SqlCommand(update, con);
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.UpdateCommand = ucmd;
                    sda.UpdateCommand.ExecuteNonQuery();

                    read = cmd.ExecuteReader();

                    con.Close();

                    Response.Redirect("Register.aspx");
                }

                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Email not found in session please return to login and try again\");", true);
                }
            }
        }
    }
}