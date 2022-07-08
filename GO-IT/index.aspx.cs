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

    }
}
