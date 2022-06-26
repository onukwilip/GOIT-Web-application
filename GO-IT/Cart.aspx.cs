using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace GO_IT
{
    public partial class Cart : System.Web.UI.Page
    {
       // string _oid = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    next.HRef = "Checkout.aspx?id=" + code + "";
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

            if (!IsPostBack)
            {
                Bind(); 
            }

            BindTotal();

        }

        protected void BindTotal()
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string id = Request.QueryString["id"];

            string select2 = "SELECT * FROM Cart WHERE ClientID='" + id + "'";
            SqlCommand cmd2 = new SqlCommand(select2, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd2);
            //DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            //sda.Fill(ds);
            sda.Fill(dt);
            SqlDataReader read = cmd2.ExecuteReader();
            if (read.HasRows)
            {
                subtotal.InnerHtml = Convert.ToInt32(dt.Compute("SUM(TotalAmount)", string.Empty)).ToString();
                allTotal.InnerHtml = (Convert.ToInt32(subtotal.InnerHtml) + 100).ToString();
            }
            else
            {
                subtotal.InnerHtml = "0";
                allTotal.InnerHtml = "0";
            }
           
            con.Close();
        }

        protected void Bind()
        {
            string id = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Cart WHERE ClientID='" + id + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            cartlist.DataSource = ds;
            cartlist.DataBind();
            
            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                empty.Visible = false;
            }

            else
            {
                empty.Visible = true;
            }

            con.Close();
        }

        protected void BindExtra(string id)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM CartExtra WHERE OrderID='" + id + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            extralist.DataSource = ds;
            extralist.DataBind();

            con.Close();
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            DataListItem dlstchild = (sender as LinkButton).NamingContainer as DataListItem;
            DataList dl1 = dlstchild.Parent as DataList;
            Label label = ((Label)dlstchild.FindControl("id"));
            string _oid = label.Text.Split(' ')[1];
            overlay.Visible = true;
            EditModal.Visible = true;
            ID.Value = _oid;

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Cart WHERE OrderID='" + _oid + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();
            while (read.Read())
            {
                projectName.Value = read.GetValue(3).ToString();
                date.Value = read.GetValue(13).ToString();
                description.Value = read.GetValue(4).ToString();
                features.Value = read.GetValue(5).ToString();
            }
            con.Close();

            BindExtra(_oid);
            /* ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"order id is '" + _oid.Split(' ')[1] + "'\");", true);*/
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            DataListItem dlstchild = (sender as LinkButton).NamingContainer as DataListItem;
            DataList dl1 = dlstchild.Parent as DataList;
            Label label = ((Label)dlstchild.FindControl("id"));
            string _oid = label.Text;
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"order id is '" + _oid.Split(' ')[1] + "'\");", true);
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string delete = "DELETE FROM Cart WHERE OrderID='" + _oid.Split(' ')[1] + "'";
            string delete2 = "DELETE FROM CartExtra WHERE OrderID='" + _oid.Split(' ')[1] + "'";
            SqlCommand cmd = new SqlCommand(delete, con);
            SqlCommand cmd2 = new SqlCommand(delete2, con);

            SqlDataAdapter sda = new SqlDataAdapter();
            SqlDataAdapter sda2 = new SqlDataAdapter();

            sda.DeleteCommand = cmd;
            sda.DeleteCommand.ExecuteNonQuery();

            sda2.DeleteCommand = cmd2;
            sda2.DeleteCommand.ExecuteNonQuery();

            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Item deleted successfully\");", true);

            Bind();
            con.Close();

            BindTotal();
        }

        protected void cancel(object sender, EventArgs e)
        {
            overlay.Visible = false;
            EditModal.Visible = false;
        }

        protected void save(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string update2 = "UPDATE Cart SET ProjectName='" + projectName.Value + "', DateOrdered='" + date.Value + "', Description='" + description.Value + "', Features='" + features.Value + "'  WHERE OrderID='" + ID.Value + "' ";
            SqlCommand ucmd2 = new SqlCommand(update2, con);
            SqlDataAdapter sda2 = new SqlDataAdapter();
            sda2.UpdateCommand = ucmd2;
            sda2.UpdateCommand.ExecuteNonQuery();

            con.Close();

            overlay.Visible = false;
            EditModal.Visible = false;

            Bind();
        }

        protected void qtychange(object sender, EventArgs e)
        {
            DataListItem dlstchild = (sender as TextBox).NamingContainer as DataListItem;
            DataList dl1 = dlstchild.Parent as DataList;
            Label price = ((Label)dlstchild.FindControl("price"));
            TextBox qty = ((TextBox)dlstchild.FindControl("qty"));
            Label total = ((Label)dlstchild.FindControl("Total"));
            Label label = ((Label)dlstchild.FindControl("id"));
            string _oid = label.Text.Split(' ')[1];
            string q = qty.Text;
            
            if (q == null || q == "")
            {
                qty.Text = "1";
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Quantity is '" + qty.Text + "'\");", true);
            }

            else
            {
                int _price = Convert.ToInt32(price.Text);
                int _qty = Convert.ToInt32(qty.Text);

                total.Text = (_price * _qty).ToString();

                string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                con.Open();

                string update2 = "UPDATE Cart SET Quantity=" + _qty + ", TotalAmount=" + Convert.ToInt32(total.Text) + " WHERE OrderID='" + _oid + "' ";
                SqlCommand ucmd2 = new SqlCommand(update2, con);
                SqlDataAdapter sda2 = new SqlDataAdapter();
                sda2.UpdateCommand = ucmd2;
                sda2.UpdateCommand.ExecuteNonQuery();

                con.Close();

                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Quantity is '" + qty.Text + "'\");", true);

                BindTotal();
            }
            
            /*   

               else
               {
                   int _price = Convert.ToInt32(price.Text);
                   int _qty = Convert.ToInt32(qty.Text);

                   total.Text = (_price * _qty).ToString();

                   string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                   SqlConnection con = new SqlConnection(constring);
                   con.Open();

                   string update2 = "UPDATE Cart SET Quantity="+_qty+", TotalAmount=" + total.Text + " WHERE OrderID='" + _oid + "' ";
                   SqlCommand ucmd2 = new SqlCommand(update2, con);
                   SqlDataAdapter sda2 = new SqlDataAdapter();
                   sda2.UpdateCommand = ucmd2;
                   sda2.UpdateCommand.ExecuteNonQuery();

                   con.Close();

                   ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Quantity is '"+_qty+"'\");", true);

                   Bind();
                   BindTotal();
               } */
        }

        protected void funcsave_Click(object sender, EventArgs e)
        {
            DataListItem dlstchild = (sender as LinkButton).NamingContainer as DataListItem;
            DataList dl1 = dlstchild.Parent as DataList;
            TextBox desc = ((TextBox)dlstchild.FindControl("funcDescribe"));
            Label id = ((Label)dlstchild.FindControl("funcID"));
            Label _error = ((Label)dlstchild.FindControl("error"));
            string _desc = desc.Text;

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            if (_desc.Length>=50)
            {
                _error.Visible = false;
            }

            if (_desc.Length<50)
            {
                _error.Visible = true;
                _error.Text = "*Description must NOT be less than 50 characters...";
            }

            else
            {
                string update2 = "UPDATE CartExtra SET Description='" + desc.Text + "' WHERE ID='" + id.Text + "' ";
                SqlCommand ucmd2 = new SqlCommand(update2, con);
                SqlDataAdapter sda2 = new SqlDataAdapter();
                sda2.UpdateCommand = ucmd2;
                sda2.UpdateCommand.ExecuteNonQuery();

                con.Close();

                BindExtra(ID.Value);
            }
        }

        protected void funcdelete_Click(object sender, EventArgs e)
        {
            DataListItem dlstchild = (sender as LinkButton).NamingContainer as DataListItem;
            DataList dl1 = dlstchild.Parent as DataList;
            Label id = ((Label)dlstchild.FindControl("funcID"));

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Cart WHERE OrderID='" + ID.Value + "'";
            SqlCommand cmd = new SqlCommand(select, con);

            string select2 = "SELECT * FROM CartExtra WHERE ID='" + id.Text + "'";
            SqlCommand cmd2 = new SqlCommand(select2, con);

            SqlDataReader read = cmd.ExecuteReader();

            if(read.Read()==true)
            {
                int initialPrice = Convert.ToInt32(read.GetValue(2));
                int initialTotal = Convert.ToInt32(read.GetValue(15));

                read.Close();

                SqlDataReader read2 = cmd2.ExecuteReader();

                if (read2.Read())
                {
                    int extraPrice = Convert.ToInt32(read2.GetValue(4));
                    int TotalP = initialPrice - extraPrice;
                    int TotalT = initialTotal - extraPrice;

                    read2.Close();

                    string update2 = "UPDATE Cart SET ServiceAmount=" + TotalP + ", TotalAmount=" + TotalT + " WHERE OrderID='" + ID.Value + "' ";
                    SqlCommand ucmd2 = new SqlCommand(update2, con);
                    SqlDataAdapter sda2 = new SqlDataAdapter();
                    sda2.UpdateCommand = ucmd2;
                    sda2.UpdateCommand.ExecuteNonQuery();

                    string delete = "DELETE FROM CartExtra WHERE ID='" + id.Text + "'";
                    SqlCommand cmd3 = new SqlCommand(delete, con);
                    SqlDataAdapter sda3 = new SqlDataAdapter();
                    sda3.DeleteCommand = cmd3;
                    sda3.DeleteCommand.ExecuteNonQuery();
                }
            }

            con.Close();

            BindExtra(ID.Value);
            Bind();
        }
    }
}