using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace GO_IT
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie _ID = Request.Cookies["myuser"];

            string User = _ID != null ? _ID.Value.Split('=')[1] : "undefined";

            string id = Request.QueryString["id"];
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select1 = "SELECT * FROM Users WHERE Email='" + User + "'";
            SqlCommand cmd1 = new SqlCommand(select1, con);
            SqlDataReader read = cmd1.ExecuteReader();

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

            read.Close();

            string select = "SELECT * FROM Cart WHERE ClientID='" + id + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            //SqlDataReader read = cmd.ExecuteReader();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            total.Value = dt.Compute("SUM(TotalAmount)", string.Empty).ToString();
        }

        protected void pay_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Cart WHERE ClientID='" + id + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                read.Close();

                if (firstname.Value != null || firstname.Value != "")
                {
                    errorFname.Visible = false;
                   // errorFname.Text = "*This field cannot be empty";
                }

                if (lastname.Value != null || lastname.Value != "")
                {
                    errorLname.Visible = false;
                    //errorLname.Text = "*This field cannot be empty";
                }

                if (cardname.Value != null || cardname.Value != "")
                {
                    errorCardName.Visible = false;
                    //errorCardName.Text = "*This field cannot be empty";
                }

                if (cardnumber.Value != null || cardnumber.Value != "")
                {
                    errorCardNo.Visible = false;
                    //errorCardNo.Text = "*This field cannot be empty";
                }

                if (date.Value != null || date.Value != "")
                {
                    errorDate.Visible = false;
                    //errorDate.Text = "*This field cannot be empty";
                } 

                //VALIDATION

                if (firstname.Value==null||firstname.Value=="")
                {
                    errorFname.Visible = true;
                    errorFname.Text = "*This field cannot be empty";
                }

                else if (lastname.Value==null||lastname.Value=="")
                {
                    errorLname.Visible = true;
                    errorLname.Text = "*This field cannot be empty";
                }

                else if (cardname.Value == null || cardname.Value == "")
                {
                    errorCardName.Visible = true;
                    errorCardName.Text = "*This field cannot be empty";
                }

                else if (cardnumber.Value == null || cardnumber.Value == "")
                {
                    errorCardNo.Visible = true;
                    errorCardNo.Text = "*This field cannot be empty";
                }

                else if (date.Value == null || date.Value == "")
                {
                    errorDate.Visible = true;
                    errorDate.Text = "*This field cannot be empty";
                }

                else
                {
                    string insert = "INSERT INTO Orders(ServiceID, ServiceName, ServiceAmount, ProjectName, Description, Features, ClientID, OrderID, DateOrdered, Attachment1, Attachment2, Attachment3, image, DateExpected, Quantity, TotalAmount, OrderType) SELECT ServiceID, ServiceName, ServiceAmount, ProjectName, Description, Features, ClientID, OrderID, DateOrdered, Attachment1, Attachment2, Attachment3, image, DateExpected, Quantity, TotalAmount, 'Open' FROM Cart WHERE ClientID='" + id + "'";
                    SqlCommand icmd = new SqlCommand(insert, con);
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.InsertCommand = icmd;
                    sda.InsertCommand.ExecuteNonQuery();

                    string insert2 = "INSERT INTO OrderExtra(Name, Description, ID, OrderID, Price, ClientID) SELECT Name, Description, ID, OrderID, Price, ClientID FROM CartExtra WHERE ClientID='" + id + "' ";
                    SqlCommand icmd2 = new SqlCommand(insert2, con);
                    SqlDataAdapter sda2 = new SqlDataAdapter();
                    sda2.InsertCommand = icmd2;
                    sda2.InsertCommand.ExecuteNonQuery();

                    string delete = "DELETE FROM Cart WHERE ClientID='" + id + "'";
                    string delete2 = "DELETE FROM CartExtra WHERE ClientID='" + id + "'";
                    SqlCommand dcmd = new SqlCommand(delete, con);
                    SqlCommand dcmd2 = new SqlCommand(delete2, con);

                    SqlDataAdapter dsda = new SqlDataAdapter();
                    SqlDataAdapter dsda2 = new SqlDataAdapter();

                    dsda.DeleteCommand = dcmd;
                    dsda.DeleteCommand.ExecuteNonQuery();

                    dsda2.DeleteCommand = dcmd2;
                    dsda2.DeleteCommand.ExecuteNonQuery();

                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Item inserted successfully\");", true);

                    read = cmd.ExecuteReader();

                    //successful.Visible = true;

                    Response.Redirect("Checkout.aspx");
                } 
            }

            con.Close();

            //Response.Redirect("Checkout.aspx");
        }
    }
}