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
using System.Drawing;

namespace GO_IT
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie id = Request.Cookies["myuser"];
            string MyUser = id != null ? id.Value.Split('=')[1] : "undefined", code2 = String.Empty;
            string _user = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Users WHERE UserId='" + _user + "'";
            SqlCommand cmd = new SqlCommand(select, con);

            string select0 = "SELECT * FROM Users WHERE Email='" + MyUser + "'";
            SqlCommand cmd0 = new SqlCommand(select0, con);
            SqlDataReader read0 = cmd0.ExecuteReader();
            
            if (read0.HasRows)
            {
                if (read0.Read() == true)
                {
                    string uname = read0.GetValue(1).ToString();
                    string code = read0.GetValue(0).ToString();
                    code2 = read0.GetValue(0).ToString();
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
                    //Response.Write("<script>alert(\"My name is '"+ uname.Split(' ')[0] + "'\")</script>");
                    //next.HRef = "Checkout.aspx?id=" + code + "";
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
                Response.Redirect("Register.aspx");
            }

            read0.Close();

            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                if (read.Read()==true)
                {
                    string _fname = read.GetValue(1).ToString().Split(' ')[0], _lname = read.GetValue(1).ToString().Split(' ')[1];
                    firstname.Value = _fname;
                    lastname.Value = _lname;
                    phone.Value = read.GetValue(10).ToString();
                    email.Value = read.GetValue(3).ToString();
                    profile.Src = "GetImage.aspx?id=" + Convert.ToInt32(read.GetValue(12)) + "";
                }
            }

            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"id is empty\");", true);
            }

            read.Close();
            
            con.Close();

            if (!IsPostBack)
            {
                Bind();
                BindFinish();
                BindCancel();
                BindCancelExtra();
                BindGeneral("Revisions", revisionOrderList, revision_null, r_searchnull1, Trevisions1);
                BindGeneral("RevisionExtra", revisionFunctionList, revision_null2, r_searchnull2, Trevisions2);
                BindGeneral("Transactions", transactionsList, transaction_null, t_searchnull, Ttransactions);
                BindGeneral("Refunds", refundsList, refunds_null, refunds_searchnull, Trefunds);
                BindGeneral("Notifications", notificationsList, notifications_null, n_searchnull, Tnotify);
                //New Badges
                //Menu
                OrderBadge("Orders", "Open", new_order);
                OrderBadge("Orders", "closed", new_finish);
                MainBadge("DeletedOrders", "DeletedExtras", new_cancel);
                MainBadge("Revisions", "RevisionExtra", new_revision);
                MainBadge("Transactions", "Refunds", new_transaction);
                SubBadge("Notifications", new_notify);
                //SubMenu
                OrderBadge("Orders", "Open", open_order_badge);
                OrderBadge("Orders", "closed", closed_order_badge);
                MainBadge("DeletedOrders", "DeletedExtras", deleted_order_badge);
                MainBadge("Revisions", "RevisionExtra", revision_badge);
                MainBadge("Transactions", "Refunds", transaction_badge);
                SubBadge("Notifications", notify_badge);
                //Tabs
                SubBadge("DeletedOrders", new_del_order);
                SubBadge("DeletedExtras", new_del_function);
                SubBadge("Revisions", new_rev_order);
                SubBadge("RevisionExtra", new_rev_function);
                SubBadge("Transactions", new_transactions2);
                SubBadge("Refunds", new_refunds);
            }

            if (this.IsPostBack)
            {
                if (change.Value=="order")
                {
                    orders.Style["display"] = "block";
                    dashboard.Style["display"] = "none";
                    finish.Style["display"] = "none";
                    cancelled.Style["display"] = "none";
                    notifications.Style["display"] = "none";
                    details.Style["display"] = "none";
                    transactions.Style["display"] = "none";
                    revisions.Style["display"] = "none";
                    // Response.Write("<script>alert(\"" + change.Value + "\")</script>");
                }

                else if (change.Value == "dashboard")
                {
                    orders.Style["display"] = "none";
                    dashboard.Style["display"] = "block";
                    finish.Style["display"] = "none";
                    cancelled.Style["display"] = "none";
                    notifications.Style["display"] = "none";
                    details.Style["display"] = "none";
                    transactions.Style["display"] = "none";
                    revisions.Style["display"] = "none";
                    // Response.Write("<script>alert(\"" + change.Value + "\")</script>");
                }

                else if (change.Value == "closed")
                {
                    orders.Style["display"] = "none";
                    dashboard.Style["display"] = "none";
                    finish.Style["display"] = "block";
                    cancelled.Style["display"] = "none";
                    notifications.Style["display"] = "none";
                    details.Style["display"] = "none";
                    transactions.Style["display"] = "none";
                    revisions.Style["display"] = "none";
                    // Response.Write("<script>alert(\"" + change.Value + "\")</script>");
                }

                else if (change.Value == "cancel")
                {
                    orders.Style["display"] = "none";
                    dashboard.Style["display"] = "none";
                    finish.Style["display"] = "none";
                    cancelled.Style["display"] = "block";
                    notifications.Style["display"] = "none";
                    details.Style["display"] = "none";
                    transactions.Style["display"] = "none";
                    revisions.Style["display"] = "none";
                    // Response.Write("<script>alert(\"" + change.Value + "\")</script>");
                }

                else if (change.Value == "notify")
                {
                    orders.Style["display"] = "none";
                    dashboard.Style["display"] = "none";
                    finish.Style["display"] = "none";
                    cancelled.Style["display"] = "none";
                    notifications.Style["display"] = "block";
                    details.Style["display"] = "none";
                    transactions.Style["display"] = "none";
                    revisions.Style["display"] = "none";
                    // Response.Write("<script>alert(\"" + change.Value + "\")</script>");
                }

                else if (change.Value == "details")
                {
                    orders.Style["display"] = "none";
                    dashboard.Style["display"] = "none";
                    finish.Style["display"] = "none";
                    cancelled.Style["display"] = "none";
                    notifications.Style["display"] = "none";
                    details.Style["display"] = "block";
                    transactions.Style["display"] = "none";
                    revisions.Style["display"] = "none";
                    // Response.Write("<script>alert(\"" + change.Value + "\")</script>");
                }

                else if (change.Value == "revisions")
                {
                    orders.Style["display"] = "none";
                    dashboard.Style["display"] = "none";
                    finish.Style["display"] = "none";
                    cancelled.Style["display"] = "none";
                    notifications.Style["display"] = "none";
                    details.Style["display"] = "none";
                    revisions.Style["display"] = "block";
                    transactions.Style["display"] = "none";
                    // Response.Write("<script>alert(\"" + change.Value + "\")</script>");
                }

                else if (change.Value == "transactions")
                {
                    orders.Style["display"] = "none";
                    dashboard.Style["display"] = "none";
                    finish.Style["display"] = "none";
                    cancelled.Style["display"] = "none";
                    notifications.Style["display"] = "none";
                    details.Style["display"] = "none";
                    revisions.Style["display"] = "none";
                    transactions.Style["display"] = "block";
                    // Response.Write("<script>alert(\"" + change.Value + "\")</script>");
                }

                Bind();
                BindFinish();
                BindCancel();
                BindCancelExtra();
                BindGeneral("Revisions", revisionOrderList, revision_null, r_searchnull1, Trevisions1);
                BindGeneral("RevisionExtra", revisionFunctionList, revision_null2, r_searchnull2, Trevisions2);
                BindGeneral("Transactions", transactionsList, transaction_null, t_searchnull, Ttransactions);
                BindGeneral("Refunds", refundsList, refunds_null, refunds_searchnull, Trefunds);
                BindGeneral("Notifications", notificationsList, notifications_null, n_searchnull, Tnotify);
                //New Badges
                //Menu
                OrderBadge("Orders", "Open", new_order);
                OrderBadge("Orders", "closed", new_finish);
                MainBadge("DeletedOrders", "DeletedExtras", new_cancel);
                MainBadge("Revisions", "RevisionExtra", new_revision);
                MainBadge("Transactions", "Refunds", new_transaction);
                SubBadge("Notifications", new_notify);
                //SubMenu
                OrderBadge("Orders", "Open", open_order_badge);
                OrderBadge("Orders", "closed", closed_order_badge);
                MainBadge("DeletedOrders", "DeletedExtras", deleted_order_badge);
                MainBadge("Revisions", "RevisionExtra", revision_badge);
                MainBadge("Transactions", "Refunds", transaction_badge);
                SubBadge("Notifications", notify_badge);
                //Tabs
                SubBadge("DeletedOrders", new_del_order);
                SubBadge("DeletedExtras", new_del_function);
                SubBadge("Revisions", new_rev_order);
                SubBadge("RevisionExtra", new_rev_function);
                SubBadge("Transactions", new_transactions2);
                SubBadge("Refunds", new_refunds);
            }

            GeneralClass general = new GeneralClass();
            general.SubBadge("Cart", cart_badge, code2);
            general.SubBadge("Cart", cart_badge2, code2);
        }

        protected void OrderBadge(string table, string condition, Label num)
        {
            string id = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = " SELECT * FROM " + table + " WHERE OrderType='" + condition + "' AND Badge='New' AND ClientID='" + id + "' ";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                read.Close();
                num.Visible = true;
                num.Text = ds.Tables[0].Rows.Count.ToString();
            }

            else
            {
                num.Visible = false;
            }   
        }

        protected void SubBadge(string table, Label num)
        {
            string id = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = " SELECT * FROM " + table + " WHERE Badge='New' AND ClientID='" + id + "' ";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                read.Close();
                num.Visible = true;
                num.Text = ds.Tables[0].Rows.Count.ToString();
            }

            else
            {
                num.Visible = false;
            }
        }

        protected void MainBadge(string table1, string table2, Label num)
        {
            string id = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select1 = " SELECT * FROM " + table1 + " WHERE ClientID='" + id + "' AND Badge='New' ";
            string select2 = " SELECT * FROM " + table2 + " WHERE ClientID='" + id + "' AND Badge='New' ";

            SqlCommand cmd = new SqlCommand(select1, con), cmd2 = new SqlCommand(select2, con);
            SqlDataAdapter sda1 = new SqlDataAdapter(cmd), sda2 = new SqlDataAdapter(cmd2);
            DataSet ds1 = new DataSet(), ds2 = new DataSet();
            sda1.Fill(ds1);
            sda2.Fill(ds2);

            SqlDataReader r1 = cmd.ExecuteReader(), r2;
            string r1_check = String.Empty, r2_check = String.Empty;

            if (!r1.HasRows)
            {
                r1_check = "false";
            }

            else
            {
                r1_check = "true";
            }

            r1.Close();
            r2 = cmd2.ExecuteReader();

            if (!r2.HasRows)
            {
                r2_check = "false";
            }

            else
            {
                r2_check = "true";
            }

            if (r1_check=="false" && r2_check== "false")
            {
                num.Visible = false;
            }
            
            else
            {
                int total = Convert.ToInt32(ds1.Tables[0].Rows.Count) + Convert.ToInt32(ds2.Tables[0].Rows.Count);
                num.Visible = true;
                num.Text = total.ToString();
            }            
        }

        protected void update_badge(string table, string column, string _id)
        {
            string id = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string update = " UPDATE " + table + " SET Badge='' WHERE " + column + "='" + _id + "' AND ClientID='" + id + "' ";
            SqlCommand cmd = new SqlCommand(update, con);
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.UpdateCommand = cmd;
            sda.UpdateCommand.ExecuteNonQuery();
        }

        public void Bind()
        {
            string id = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Orders WHERE ClientID='" + id + "' AND OrderType='Open' ORDER BY DateOrdered ";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            Topen.InnerHtml = ds.Tables[0].Rows.Count.ToString();
            TotalOpen.Text= ds.Tables[0].Rows.Count.ToString(); 

            orderlist.DataSource = ds;
            orderlist.DataBind();

            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                ordernull.Visible = false;
                searchnull.Visible = false;
            }

            else
            {
                ordernull.Visible = true;
                searchnull.Visible = false;
            }

            con.Close();
        }

        public void BindFinish()
        {
            string id = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Orders WHERE ClientID='" + id + "' AND OrderType='closed' ORDER BY DateOrdered ";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            TFinished.InnerHtml = ds.Tables[0].Rows.Count.ToString();
            TotalClosed.Text= ds.Tables[0].Rows.Count.ToString();

            finishlist.DataSource = ds;
            finishlist.DataBind();

            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                finishnull.Visible = false;
                f_searchnull.Visible = false;
            }

            else
            {
                finishnull.Visible = true;
                f_searchnull.Visible = false;
            }

            con.Close();
        }

        public void BindCancel()
        {
            string id = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM DeletedOrders WHERE ClientID='" + id + "' ORDER BY DateDeleted ";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            TCanclled.InnerHtml = ds.Tables[0].Rows.Count.ToString();
            TotalCancelled.Text= ds.Tables[0].Rows.Count.ToString();

            cancelledlist.DataSource = ds;
            cancelledlist.DataBind();

            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                cancelnull.Visible = false;
                c_searchnull.Visible = false;
            }

            else
            {
                cancelnull.Visible = true;
                c_searchnull.Visible = false;
            }

            con.Close();
        }

        public void BindCancelExtra()
        {
            string id = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM DeletedExtras WHERE ClientID='" + id + "' ";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            TCancelled2.InnerHtml = ds.Tables[0].Rows.Count.ToString();

            cancelledlist2.DataSource = ds;
            cancelledlist2.DataBind();

            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                cancelnull2.Visible = false;
                c_searchnull2.Visible = false;
            }

            else
            {
                cancelnull2.Visible = true;
                c_searchnull2.Visible = false;
            }

            con.Close();
        }

        public void BindTransaction()
        {
            string id = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Transactions WHERE ClientID='" + id + "' ";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            Ttransactions.Text = ds.Tables[0].Rows.Count.ToString();

            transactionsList.DataSource = ds;
            transactionsList.DataBind();

            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                transaction_null.Visible = false;
                t_searchnull.Visible = false;
            }

            else
            {
                transaction_null.Visible = true;
                t_searchnull.Visible = false;
            }

            con.Close();
        }

        public void BindGeneral(string table, DataList dlst, Panel _null, Panel _searchnull, Label num)
        {
            string id = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM " + table + " WHERE ClientID='" + id + "' ";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            num.Text = ds.Tables[0].Rows.Count.ToString();

            dlst.DataSource = ds;
            dlst.DataBind();

            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                _null.Visible = false;
                _searchnull.Visible = false;
            }

            else
            {
                _null.Visible = true;
                _searchnull.Visible = false;
            }

            con.Close();
        }

        protected void BindExtraGeneral(string table, string id, DataList dlst, string param)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM " + table + " WHERE " + param + "='" + id + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            dlst.DataSource = ds;
            dlst.DataBind();

            con.Close();
        }

        protected void logout_Click(object sender, EventArgs e)
        {
             HttpCookie id = Request.Cookies["myuser"];
             
             string _user = Request.QueryString["id"];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string update = "UPDATE Users SET status='false', LogoutDate='" + DateTime.Now + "' WHERE Email='" + _user + "' ";
            SqlCommand ucmd = new SqlCommand(update, con);
            ucmd.CommandTimeout = 3600;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.UpdateCommand = ucmd;
            sda.UpdateCommand.ExecuteNonQuery();

            con.Close();

            id.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(id);
            Response.Redirect("index.aspx");
        }

        protected void saved_Click(object sender, EventArgs e)
        {
            /*  HttpCookie id = Request.Cookies["userid"];
              string _User = id != null ? id.Value.Split('=')[1] : "undefined";*/
            string _user = Request.QueryString["id"];

            byte[] bytes;
            using (BinaryReader br = new BinaryReader(fileupload.PostedFile.InputStream))
            {
                bytes = br.ReadBytes(fileupload.PostedFile.ContentLength);
            }

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();
            var file = new FileInfo(fileupload.PostedFile.ToString());


            string filepath = fileupload.PostedFile.FileName;
            string filename1 = Path.GetFileName(filepath);
            string ext = Path.GetExtension(filename1);

            if (ext != "")
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"I have file which is " + fileupload.PostedFile.FileName + " + " + ext + "\");", true);
                string update = "UPDATE Users SET Username='" + fname.Value + " " + lname.Value + "', phone='" + tel.Value + "', image = @data WHERE UserId='" + _user + "' ";
                SqlCommand ucmd = new SqlCommand(update, con);
                ucmd.CommandTimeout = 3600;

                ucmd.Parameters.AddWithValue("@data", bytes);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.UpdateCommand = ucmd;
                sda.UpdateCommand.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"File name is " + fileupload.PostedFile.FileName + "\");", true);
            }

            else if (ext == "")
            {
                string update1 = "UPDATE Users SET Username='" + fname.Value + " " + lname.Value + "', phone='" + tel.Value + "' WHERE UserId='" + _user + "' ";
                SqlCommand ucmd1 = new SqlCommand(update1, con);
                ucmd1.CommandTimeout = 3600;

                SqlDataAdapter sda1 = new SqlDataAdapter();
                sda1.UpdateCommand = ucmd1;
                sda1.UpdateCommand.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"I don't have file which is " + fileupload.PostedFile.FileName + " + " + ext + "\");", true);
            }
                   
            con.Close();
        }

        protected void savepword_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string _user = Request.QueryString["id"];
            string select = "SELECT * FROM Users WHERE UserId='" + _user + "'";
            SqlCommand scmd = new SqlCommand(select, con);
            SqlDataReader read = scmd.ExecuteReader();
            if (read.HasRows)
            {
                if (read.Read()==true)
                {
                    string _opword = read.GetValue(2).ToString();
                    if (old.Value==_opword && confirm.Value==mynew.Value)
                    {
                        string update = "UPDATE Users SET Password='" + mynew.Value + "' WHERE UserId='" + _user + "'";
                        SqlCommand ucmd = new SqlCommand(update, con);
                        ucmd.CommandTimeout = 3600;
                        read.Close();
                        SqlDataAdapter sda = new SqlDataAdapter();
                        sda.UpdateCommand = ucmd;
                        sda.UpdateCommand.ExecuteNonQuery();

                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Password updated successfully\");", true);
                    }

                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"old password is incorrect OR confirm password doesn't match new password\");", true);
                    }
                }
            }

            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"id is empty\");", true);
            }

            con.Close();
        }

        protected void view_Click(object sender, EventArgs e)
        {
            DataListItem dlstchild = (sender as LinkButton).NamingContainer as DataListItem;
            Label _ID = ((Label)dlstchild.FindControl("id"));
            string _oid = _ID.Text.Split(' ')[1];
            ID.Value = _oid;

            overlay2.Visible = true;
            EditModal.Visible = true;

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Orders WHERE OrderID='" + _oid + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();
            while (read.Read())
            {
                warning.Style["background-color"] = "rgba(182, 255, 0, .7)";
                warning.Style["color"] = "darkgreen";
                warnText.InnerHtml = "N.B All changes made to this order will be recieved as revisions, which will have to be approved before being commited...";

                projectName.Value = read.GetValue(3).ToString();
                date.Text = read.GetValue(13).ToString();
                description.Value = read.GetValue(4).ToString();
                features.Value = read.GetValue(5).ToString();
                o_Date.Text = Convert.ToDateTime(read.GetValue(8).ToString()).ToString();
                A1.Text= read.GetValue(17).ToString();
                A2.Text = read.GetValue(18).ToString();
                A3.Text = read.GetValue(19).ToString();
            }

            con.Close();
            BindExtra(_oid);

            update_badge("Orders", "OrderID", _oid);
        }

        protected void BindExtra(string id)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM OrderExtra WHERE OrderID='" + id + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            extralist.DataSource = ds;
            extralist.DataBind();

            con.Close();
        }

        protected void F_BindExtra(string id)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM OrderExtra WHERE OrderID='" + id + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            f_extralist.DataSource = ds;
            f_extralist.DataBind();

            con.Close();
        }

        protected void C_BindExtra(string id)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM DeletedExtras WHERE OrderID='" + id + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            f_extralist.DataSource = ds;
            f_extralist.DataBind();

            con.Close();
        }

        protected void cancel(object sender, EventArgs e)
        {
            overlay2.Visible = false;
            EditModal.Visible = false;
            warning.Style["background-color"] = "rgba(182, 255, 0, .7)";
            warning.Style["color"] = "darkgreen";
            warnText.InnerHtml = "N.B All changes made to this order will be recieved as revisions, which will have to be approved before being commited...";
            errorName.Visible = false;
            errorDate.Visible = false;
            errorDesc.Visible = false;
            errorFeature.Visible = false;
            A1Error.Visible = false;
            A2Error.Visible = false;
            A3Error.Visible = false;
            zipError.Visible = false;
        }

        protected void cancel2(object sender, EventArgs e)
        {
            overlay3.Visible = false;
            editmodal3.Visible = false;
            errorReason.Visible = false;
            errorPword.Visible = false;
            pword_del.Value = null;
            reason.Text = null;
        }

        protected void cancel3(object sender, EventArgs e)
        {
            g_overlay.Visible = false;
            g_editmodal.Visible = false;
            restore_container.Style["display"] = "none";
            revision_order_container.Style["display"] = "none";
            revision_delete_order_container.Style["display"] = "none";
            rev_func_container.Style["display"] = "none";
            rev_func_success_container.Style["display"] = "none";
            rev_func_del_container.Style["display"] = "none";
            rev_func_success.Visible = false;

            //Errors

            //Restore function
            func_error_reason.Visible = false;
            func_error_pword.Visible = false;
            //Revision orders(edit)
            rev_o_ProjectNameError.Visible = false;
            rev_o_DateExpectedError.Visible = false;
            rev_o_DescriptionError.Visible = false;
            rev_o_FeaturesError.Visible = false;
            //Revision orders(delete)
            rev_o_del_pwordError.Visible = false;
            rev_o_del_reasonError.Visible = false;
            //Revision function(edit)
            rev_func_describe_error.Visible = false;
            //Revision function(delete)
            rev_func_del_reasonError.Visible = false;
            rev_func_del_pwordError.Visible = false;

            //Textboxes

            //Restore function
            func_pword.Value = null;
            func_reason.Text = null;
            //Revision orders(edit)
            rev_o_DateExpected.Text = null;
            rev_o_DateOrdered.Text = null;
            rev_o_Description.Value = null;
            rev_o_Features.Value = null;
            rev_o_ID.Value = null;
            rev_o_ProjectName.Value = null;
            //Revision orders(delete)
            rev_o_del_ID.Text = null;
            rev_o_del_pword.Value = null;
            rev_o_del_reason.Text = null;
            //Revision function(delete)
            rev_func_del_reason.Text = null;
            rev_func_del_pword.Value = null;

            //Banners
            func_exist.InnerHtml = "Please verify your password before restoring this function, to confirm it is you";
            func_info.Style["background-color"] = "rgba(182, 255, 0, .7)";
            func_exist.Style["color"] = "darkgreen";
        }

        protected void g_cancel()
        {
            g_overlay.Visible = false;
            g_editmodal.Visible = false;
            restore_container.Style["display"] = "none";
            revision_order_container.Style["display"] = "none";
            revision_delete_order_container.Style["display"] = "none";
            rev_func_container.Style["display"] = "none";
            rev_func_success_container.Style["display"] = "none";
            rev_func_del_container.Style["display"] = "none";
            rev_func_success.Visible = false;

            //Errors

            //Restore function
            func_error_reason.Visible = false;
            func_error_pword.Visible = false;
            //Revision orders(edit)
            rev_o_ProjectNameError.Visible = false;
            rev_o_DateExpectedError.Visible = false;
            rev_o_DescriptionError.Visible = false;
            rev_o_FeaturesError.Visible = false;
            rev_o_A1Error.Visible = false;
            rev_o_A2Error.Visible = false;
            rev_o_A3Error.Visible = false;
            rev_o_zipError.Visible = false;
            //Revision orders(delete)
            rev_o_del_pwordError.Visible = false;
            rev_o_del_reasonError.Visible = false;
            //Revision function(edit)
            rev_func_describe_error.Visible = false;
            //Revision function(delete)
            rev_func_del_reasonError.Visible = false;
            rev_func_del_pwordError.Visible = false;

            //Textboxes

            //Restore function
            func_pword.Value = null;
            func_reason.Text = null;
            //Revision orders(edit)
            rev_o_DateExpected.Text = null;
            rev_o_DateOrdered.Text = null;
            rev_o_Description.Value = null;
            rev_o_Features.Value = null;
            rev_o_ID.Value = null;
            rev_o_ProjectName.Value = null;
            //Revision orders(delete)
            rev_o_del_ID.Text = null;
            rev_o_del_pword.Value = null;
            rev_o_del_reason.Text = null;
            //Revision function(delete)
            rev_func_del_reason.Text = null;
            rev_func_del_pword.Value = null;

            //Banners
            func_exist.InnerHtml = "Please verify your password before restoring this function, to confirm it is you";
            func_info.Style["background-color"] = "rgba(182, 255, 0, .7)";
            func_exist.Style["color"] = "darkgreen";
        }
        /* protected void saveRevision_Click(object sender, EventArgs e)
         {
             string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
             SqlConnection con = new SqlConnection(constring);
             con.Open();

             string uid = Request.QueryString["id"];

             string select = "SELECT * FROM Revisions WHERE OrderID='" + ID.Value + "'";
             SqlCommand cmd = new SqlCommand(select, con);
             SqlDataReader read = cmd.ExecuteReader();

             if (read.HasRows)
             {
                 read.Close();

                 //VALIDATION

                 string Desc = description.Value, Feat = features.Value;

                 if (projectName.Value==null|| projectName.Value == "")
                 {
                     errorName.Visible = true;
                     errorName.Text = "*This field can not be empty";
                 }

                 else if (Desc.Length < 50 || description.Value == "")
                 {
                     errorDesc.Visible = true;
                     errorDesc.Text = "*This field must be more than 50 characters";
                 }

                 else if (Feat.Length < 50 || features.Value == "")
                 {
                     errorFeature.Visible = true;
                     errorFeature.Text = "*This field must be more than 50 characters";
                 }

                 else if (date.Text==""||date.Text==null)
                 {
                     errorDate.Visible = true;
                     errorDate.Text = "*This field can not be empty";
                 }

                 else if ((Convert.ToDateTime(date.Text) - Convert.ToDateTime(o_Date.Text)).TotalDays < 7)
                 {
                     errorDate.Visible = true;
                     errorDate.Text = "*Date must not be less than & days from order date";
                 }

                 else if (Convert.ToDateTime(date.Text) < DateTime.Now)
                 {
                     errorDate.Visible = true;
                     errorDate.Text = "*Date must not be less than today's date";
                 }

                 else
                 {
                     string update = "UPDATE Revisions SET ProjectName='" + projectName.Value + "', DateExpected='" + date.Text + "', Description='" + description.Value + "', Features='" + features.Value + "' WHERE OrderID='" + ID.Value + "' ";
                     SqlCommand ucmd = new SqlCommand(update, con);
                     SqlDataAdapter sda = new SqlDataAdapter();
                     sda.UpdateCommand = ucmd;
                     sda.UpdateCommand.ExecuteNonQuery();

                     string A1Path, A2Path, A3Path, A1Name, A2Name, A3Name, ext1, ext2, ext3;

                     A1Path = A1Upload.PostedFile.FileName;
                     A2Path = A2Upload.PostedFile.FileName;
                     A3Path = A3Upload.PostedFile.FileName;

                     A1Name = Path.GetFileName(A1Path);
                     A2Name = Path.GetFileName(A2Path);
                     A3Name = Path.GetFileName(A3Path);

                     ext1 = Path.GetExtension(A1Name);
                     ext2 = Path.GetExtension(A2Name);
                     ext3 = Path.GetExtension(A3Name);

                     if (ext1 != "")
                     {
                         byte[] A1Byte;
                         using (BinaryReader A1br = new BinaryReader(A1Upload.PostedFile.InputStream))
                         {
                             A1Byte = A1br.ReadBytes(A1Upload.PostedFile.ContentLength);
                         }

                         string _update = "UPDATE Revisions SET Attachment1=@A1, Apath1=@A1path WHERE OrderID='" + ID.Value + "' ";
                         SqlCommand _ucmd = new SqlCommand(_update, con);
                         _ucmd.Parameters.AddWithValue("@A1", A1Byte);
                         _ucmd.Parameters.AddWithValue("@A1path", A1Upload.PostedFile.FileName.ToString());
                         SqlDataAdapter _sda = new SqlDataAdapter();
                         _sda.UpdateCommand = _ucmd;
                         _sda.UpdateCommand.ExecuteNonQuery();
                     }

                     if (ext2 != "")
                     {
                         byte[] A2Byte;
                         using (BinaryReader A2br = new BinaryReader(A2Upload.PostedFile.InputStream))
                         {
                             A2Byte = A2br.ReadBytes(A2Upload.PostedFile.ContentLength);
                         }

                         string _update = "UPDATE Revisions SET Attachment2=@A2, Apath2=@A2path WHERE OrderID='" + ID.Value + "' ";
                         SqlCommand _ucmd = new SqlCommand(_update, con);
                         _ucmd.Parameters.AddWithValue("@A2", A2Byte);
                         _ucmd.Parameters.AddWithValue("@A2path", A2Upload.PostedFile.FileName.ToString());
                         SqlDataAdapter _sda = new SqlDataAdapter();
                         _sda.UpdateCommand = _ucmd;
                         _sda.UpdateCommand.ExecuteNonQuery();
                     }

                     if (ext3 != "")
                     {
                         byte[] A3Byte;
                         using (BinaryReader A3br = new BinaryReader(A3Upload.PostedFile.InputStream))
                         {
                             A3Byte = A3br.ReadBytes(A3Upload.PostedFile.ContentLength);
                         }

                         string _update = "UPDATE Revisions SET Attachment3=@A3, Apath3=@A3path WHERE OrderID='" + ID.Value + "' ";
                         SqlCommand _ucmd = new SqlCommand(_update, con);
                         _ucmd.Parameters.AddWithValue("@A3", A3Byte);
                         _ucmd.Parameters.AddWithValue("@A3path", A3Upload.PostedFile.FileName.ToString());
                         SqlDataAdapter _sda = new SqlDataAdapter();
                         _sda.UpdateCommand = _ucmd;
                         _sda.UpdateCommand.ExecuteNonQuery();
                     }

                     con.Close();
                     Response.Redirect("Dashboard.aspx?id=" + uid + "");
                 }
             }

             else
             {
                 read.Close();

                 //VALIDATION

                 string Desc = description.Value, Feat = features.Value;

                 if (projectName.Value == null || projectName.Value == "")
                 {
                     errorName.Visible = true;
                     errorName.Text = "*This field can not be empty";
                 }

                 else if (Desc.Length < 50 || description.Value == "")
                 {
                     errorDesc.Visible = true;
                     errorDesc.Text = "*This field must be more than 50 characters";
                 }

                 else if (Feat.Length < 50 || features.Value == "")
                 {
                     errorFeature.Visible = true;
                     errorFeature.Text = "*This field must be more than 50 characters";
                 }

                 else if (date.Text == "" || date.Text == null)
                 {
                     errorDate.Visible = true;
                     errorDate.Text = "*This field can not be empty";
                 }

                 else if ((Convert.ToDateTime(date.Text) - Convert.ToDateTime(o_Date.Text)).TotalDays < 7)
                 {
                     errorDate.Visible = true;
                     errorDate.Text = "*Date must not be less than & days from order date";
                 }

                 else if (Convert.ToDateTime(date.Text) < DateTime.Now)
                 {
                     errorDate.Visible = true;
                     errorDate.Text = "*Date must not be less than today's date";
                 }

                 else
                 {
                     GeneralClass general = new GeneralClass();

                     int _rdm = general._random();
                     string insert = " INSERT INTO Revisions(ServiceID, ServiceName, ServiceAmount, ProjectName, Description, Features, ClientID, OrderID, DateOrdered, Attachment1, Attachment2, Attachment3, image, DateExpected, Quantity, TotalAmount, OrderType, Apath1, Apath2, Apath3, RevisionID) SELECT ServiceID, ServiceName, ServiceAmount, '" + projectName.Value + "', '" + description.Value + "', '" + features.Value + "', ClientID, '" + ID.Value + "', DateOrdered, Attachment1, Attachment2, Attachment3, image, '" + date.Text + "', Quantity, TotalAmount, OrderType, Apath1, Apath2, Apath3, '" + _rdm.ToString() + "' FROM Orders WHERE OrderID='" + ID.Value + "' ";
                     SqlCommand _cmd = new SqlCommand(insert, con);
                     SqlDataAdapter sda = new SqlDataAdapter();
                     sda.InsertCommand = _cmd;
                     sda.InsertCommand.ExecuteNonQuery();

                     string A1Path, A2Path, A3Path, A1Name, A2Name, A3Name, ext1, ext2, ext3;

                     A1Path = A1Upload.PostedFile.FileName;
                     A2Path = A2Upload.PostedFile.FileName;
                     A3Path = A3Upload.PostedFile.FileName;

                     A1Name = Path.GetFileName(A1Path);
                     A2Name = Path.GetFileName(A2Path);
                     A3Name = Path.GetFileName(A3Path);

                     ext1 = Path.GetExtension(A1Name);
                     ext2 = Path.GetExtension(A2Name);
                     ext3 = Path.GetExtension(A3Name);

                     if (ext1 != "")
                     {
                         byte[] A1Byte;
                         using (BinaryReader A1br = new BinaryReader(A1Upload.PostedFile.InputStream))
                         {
                             A1Byte = A1br.ReadBytes(A1Upload.PostedFile.ContentLength);
                         }

                         string _update = "UPDATE Revisions SET Attachment1=@A1, Apath1=@A1path WHERE OrderID='" + ID.Value + "' ";
                         SqlCommand _ucmd = new SqlCommand(_update, con);
                         _ucmd.Parameters.AddWithValue("@A1", A1Byte);
                         _ucmd.Parameters.AddWithValue("@A1path", A1Upload.PostedFile.FileName.ToString());
                         SqlDataAdapter _sda = new SqlDataAdapter();
                         _sda.UpdateCommand = _ucmd;
                         _sda.UpdateCommand.ExecuteNonQuery();
                     }

                     if (ext2 != "")
                     {
                         byte[] A2Byte;
                         using (BinaryReader A2br = new BinaryReader(A2Upload.PostedFile.InputStream))
                         {
                             A2Byte = A2br.ReadBytes(A2Upload.PostedFile.ContentLength);
                         }

                         string _update = "UPDATE Revisions SET Attachment2=@A2, Apath2=@A2path WHERE OrderID='" + ID.Value + "' ";
                         SqlCommand _ucmd = new SqlCommand(_update, con);
                         _ucmd.Parameters.AddWithValue("@A2", A2Byte);
                         _ucmd.Parameters.AddWithValue("@A2path", A2Upload.PostedFile.FileName.ToString());
                         SqlDataAdapter _sda = new SqlDataAdapter();
                         _sda.UpdateCommand = _ucmd;
                         _sda.UpdateCommand.ExecuteNonQuery();
                     }

                     if (ext3 != "")
                     {
                         byte[] A3Byte;
                         using (BinaryReader A3br = new BinaryReader(A3Upload.PostedFile.InputStream))
                         {
                             A3Byte = A3br.ReadBytes(A3Upload.PostedFile.ContentLength);
                         }

                         string _update = "UPDATE Revisions SET Attachment3=@A3, Apath3=@A3path WHERE OrderID='" + ID.Value + "' ";
                         SqlCommand _ucmd = new SqlCommand(_update, con);
                         _ucmd.Parameters.AddWithValue("@A3", A3Byte);
                         _ucmd.Parameters.AddWithValue("@A3path", A3Upload.PostedFile.FileName.ToString());
                         SqlDataAdapter _sda = new SqlDataAdapter();
                         _sda.UpdateCommand = _ucmd;
                         _sda.UpdateCommand.ExecuteNonQuery();
                     }

                     con.Close();
                     Response.Redirect("Dashboard.aspx?id=" + uid + "");
                 }
             }
         } */

        protected void saveRevision2(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string uid = Request.QueryString["id"];
            string Desc = description.Value, Feat = features.Value, ext = Path.GetExtension(zipUpload.PostedFile.FileName);
            decimal a1size = Math.Round(((decimal)A1Upload.PostedFile.ContentLength / (decimal)1024), 2);
            decimal a2size = Math.Round(((decimal)A2Upload.PostedFile.ContentLength / (decimal)1024), 2);
            decimal a3size = Math.Round(((decimal)A3Upload.PostedFile.ContentLength / (decimal)1024), 2);
            decimal zipsize = Math.Round(((decimal)zipUpload.PostedFile.ContentLength / (decimal)1024), 2);

            if (projectName.Value != null || projectName.Value != "")
            {
                errorName.Visible = false;
                //errorName.Text = "*This field can not be empty";
            }

            if (Desc.Length > 50 || description.Value != "")
            {
                errorDesc.Visible = false;
                //errorDesc.Text = "*This field must be more than 50 characters";
            }

            if (Feat.Length > 50 || features.Value != "")
            {
                errorFeature.Visible = false;
               // errorFeature.Text = "*This field must be more than 50 characters";
            }

            if (date.Text != "" || date.Text != null)
            {
                errorDate.Visible = false;
                //errorDate.Text = "*This field can not be empty";
            }

            if (A1Upload.HasFile && a1size < 5200)
            {
                A1Error.Visible = false;
                A1Error.Text = "*File must not be greater than 5MB";
            }

            if (A2Upload.HasFile && a2size < 5200)
            {
                A2Error.Visible = false;
                A2Error.Text = "*File must not be greater than 5MB";
            }

            if (A3Upload.HasFile && a3size < 5200)
            {
                A3Error.Visible = false;
                A3Error.Text = "*File must not be greater than 5MB";
            }

            if (zipUpload.HasFile && zipsize < 52000)
            {
                zipError.Visible = false;
                zipError.Text = "*File must not be greater than 50MB";
            }

            if (zipUpload.HasFile && ext == ".zip")
            {
                zipError.Visible = false;
                zipError.Text = "*File must be a zip file";
            }

            string select = "SELECT * FROM Revisions WHERE OrderID='" + ID.Value + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            if (read.HasRows)
            {
                warning.Style["background-color"] = "orangered";
                warning.Style["color"] = "white";
                warnText.InnerHtml = "Item with order id " + ID.Value + " already exists in revision, to edit existing go to revisions and select this order ";
            }

            else
            {

                read.Close();

                //VALIDATION
                               
                if (projectName.Value == null || projectName.Value == "")
                {
                    errorName.Visible = true;
                    errorName.Text = "*This field can not be empty";
                }

                else if (Desc.Length < 50 || description.Value == "")
                {
                    errorDesc.Visible = true;
                    errorDesc.Text = "*This field must be more than 50 characters";
                }

                else if (Feat.Length < 50 || features.Value == "")
                {
                    errorFeature.Visible = true;
                    errorFeature.Text = "*This field must be more than 50 characters";
                }

                else if (date.Text == "" || date.Text == null)
                {
                    errorDate.Visible = true;
                    errorDate.Text = "*This field can not be empty";
                }

                else if ((Convert.ToDateTime(date.Text) - Convert.ToDateTime(o_Date.Text)).TotalDays < 7)
                {
                    errorDate.Visible = true;
                    errorDate.Text = "*Date must not be less than & days from order date";
                }

                else if (Convert.ToDateTime(date.Text) < DateTime.Now)
                {
                    errorDate.Visible = true;
                    errorDate.Text = "*Date must not be less than today's date";
                }

                else if (A1Upload.HasFile && a1size > 5200)
                {
                    A1Error.Visible = true;
                    A1Error.Text = "*File must not be greater than 5MB";
                }

                else if (A2Upload.HasFile && a2size > 5200)
                {
                    A2Error.Visible = true;
                    A2Error.Text = "*File must not be greater than 5MB";
                }

                else if (A3Upload.HasFile && a3size > 5200)
                {
                    A3Error.Visible = true;
                    A3Error.Text = "*File must not be greater than 5MB";
                }

                else if (zipUpload.HasFile && zipsize > 52000)
                {
                    zipError.Visible = true;
                    zipError.Text = "*File must not be greater than 50MB";
                }

                else if (zipUpload.HasFile && ext != ".zip")
                {
                    zipError.Visible = true;
                    zipError.Text = "*File must be a zip file";
                }

                else
                {
                    GeneralClass general = new GeneralClass();

                    int _rdm = general._random();

                    byte[] A1Byte;
                    using (BinaryReader A1br = new BinaryReader(A1Upload.PostedFile.InputStream))
                    {
                        A1Byte = A1br.ReadBytes(A1Upload.PostedFile.ContentLength);
                    }

                    byte[] A2Byte;
                    using (BinaryReader A2br = new BinaryReader(A2Upload.PostedFile.InputStream))
                    {
                        A2Byte = A2br.ReadBytes(A2Upload.PostedFile.ContentLength);
                    }

                    byte[] A3Byte;
                    using (BinaryReader A3br = new BinaryReader(A3Upload.PostedFile.InputStream))
                    {
                        A3Byte = A3br.ReadBytes(A3Upload.PostedFile.ContentLength);
                    }

                    byte[] zipbyte;
                    using (BinaryReader zipbr = new BinaryReader(zipUpload.PostedFile.InputStream))
                    {
                        zipbyte = zipbr.ReadBytes(zipUpload.PostedFile.ContentLength);
                    }

                    string insert = " INSERT INTO Revisions(ServiceID, ServiceName, ServiceAmount, ProjectName, Description, Features, ClientID, OrderID, DateOrdered, Attachment1, Attachment2, Attachment3, image, DateExpected, Quantity, TotalAmount, OrderType, Apath1, Apath2, Apath3, RevisionID, Badge, ZipFileName, ZipFilePath) SELECT ServiceID, ServiceName, ServiceAmount, '" + projectName.Value + "', '" + description.Value + "', '" + features.Value + "', ClientID, '" + ID.Value + "', DateOrdered, @A1, @A2, @A3, image, '" + date.Text + "', Quantity, TotalAmount, OrderType, @A1path, @A2path, @A2path, '" + _rdm.ToString() + "', 'New', @zipname, @zippath FROM Orders WHERE OrderID='" + ID.Value + "' ";

                    SqlCommand _cmd = new SqlCommand(insert, con);
                    _cmd.Parameters.AddWithValue("@A1", A1Byte);
                    _cmd.Parameters.AddWithValue("@A2", A2Byte);
                    _cmd.Parameters.AddWithValue("@A3", A3Byte);
                    _cmd.Parameters.AddWithValue("@zippath", zipbyte); 
                    _cmd.Parameters.AddWithValue("@A1path", A1Upload.PostedFile.FileName);
                    _cmd.Parameters.AddWithValue("@A2path", A2Upload.PostedFile.FileName);
                    _cmd.Parameters.AddWithValue("@A3path", A3Upload.PostedFile.FileName);
                    _cmd.Parameters.AddWithValue("@zipname", zipUpload.PostedFile.FileName);

                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.InsertCommand = _cmd;
                    sda.InsertCommand.ExecuteNonQuery();

                    con.Close();
                    Response.Redirect("Dashboard.aspx?id=" + uid + "");
                }
            }
        }

        protected void funcsave_Click(object sender, EventArgs e)
        {
            DataListItem dlstchild = (sender as LinkButton).NamingContainer as DataListItem;
            Label funcid = ((Label)dlstchild.FindControl("funcID"));
            Label funcWarn = ((Label)dlstchild.FindControl("funcWarn"));
            Label funcName = ((Label)dlstchild.FindControl("funcName"));
            TextBox funcDescribe = ((TextBox)dlstchild.FindControl("funcDescribe"));
            Label error = ((Label)dlstchild.FindControl("error"));

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string Desc = funcDescribe.Text;
            if (Desc.Length > 50)
            {
                error.Visible = false;
            }

            string select = "SELECT * FROM RevisionExtra WHERE ID='" + funcid.Text + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();
                        
            if (read.HasRows)
            {
                funcWarn.Style["color"] = "orangered";
                funcWarn.Text = "<li>Item with function id " + funcid.Text + " already exists in revision, to edit existing go to revisions and select this function</li> ";
            }

            else
            {
                read.Close();

                //VALIDATION
                                
                if (Desc.Length<50)
                {
                    error.Visible = true;
                    error.Text = "*This field must not be less than 50 characters";
                }

                else
                {
                    string insert = " INSERT INTO RevisionExtra(Name, Description, ID, OrderID, Price, ClientID, Badge) SELECT Name, '" + funcDescribe.Text + "', ID, OrderID, Price, ClientID, 'New' FROM OrderExtra WHERE ID='" + funcid.Text + "' ";
                    SqlCommand icmd = new SqlCommand(insert, con);
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.InsertCommand = icmd;
                    sda.InsertCommand.ExecuteNonQuery();

                    funcWarn.Style["color"] = "blue";
                    funcWarn.Text = "<li>Revision for function " + funcid.Text + " successfully added, to view go to revision and select item with orderID " + ID.Value + "</li> ";
                }
            }
            con.Close();
        }

        protected void funcdelete_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            DataListItem dlstchild = (sender as LinkButton).NamingContainer as DataListItem;
            Label funcID = ((Label)dlstchild.FindControl("funcID"));

            string select = "SELECT * FROM DeletedExtras WHERE ID='" + funcID.Text + "'";
            SqlCommand scmd = new SqlCommand(select, con);
            SqlDataReader read = scmd.ExecuteReader();

            if (read.HasRows)
            {
                //Catch the reinsertion
            }

            else
            {
                read.Close();

                string insert = " INSERT INTO DeletedExtras(Name, Description, ID, OrderID, Price, ClientID, Badge) SELECT Name, Description, ID, OrderID, Price, ClientID, 'New' from OrderExtra WHERE ID='" + funcID.Text + "' ";
                string delete1 = " DELETE FROM OrderExtra WHERE ID='" + funcID.Text + "' ";
                string delete2 = " DELETE FROM RevisionExtra WHERE ID='" + funcID.Text + "' ";

                SqlCommand icmd, dcmd1, dcmd2;
                icmd = new SqlCommand(insert, con);
                dcmd1 = new SqlCommand(delete1, con);
                dcmd2 = new SqlCommand(delete2, con);

                SqlDataAdapter sda, sda2, sda3;
                sda  = new SqlDataAdapter();
                sda2 = new SqlDataAdapter();
                sda3 = new SqlDataAdapter();

                sda.InsertCommand = icmd;
                sda2.InsertCommand = dcmd1;
                sda3.InsertCommand = dcmd2;

                sda.InsertCommand.ExecuteNonQuery();
                sda2.InsertCommand.ExecuteNonQuery();
                sda3.InsertCommand.ExecuteNonQuery();

                Response.Write("<script>alert('Item deleted successfully')</script>");
            }

            con.Close();
            Bind();
            BindExtra(ID.Value);
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            DataListItem dlstchild = (sender as LinkButton).NamingContainer as DataListItem;
            Label id = ((Label)dlstchild.FindControl("id"));

            overlay3.Visible = true;
            editmodal3.Visible = true;

            DelID.Text = id.Text.ToString().Split(' ')[1];

            update_badge("Orders", "OrderID", id.Text.ToString().Split(' ')[1]);
        }

        protected void confirm_delete_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string _user = Request.QueryString["id"];
            GeneralClass gen = new GeneralClass();
            int _rdm = gen._random();

            string select3 = "SELECT * FROM DeletedOrders WHERE OrderID='" + DelID.Text + "'";
            SqlCommand scmd = new SqlCommand(select3, con);
            SqlDataReader read3 = scmd.ExecuteReader();

            if (read3.HasRows)
            {
                overlay3.Visible = false;
                editmodal3.Visible = false;
                errorReason.Visible = false;
                errorPword.Visible = false;
                pword_del.Value = null;
                reason.Text = null;
            }

            else
            {
                read3.Close();

                string select = "SELECT * FROM Users WHERE UserId='" + _user + "'";
                SqlCommand cmd = new SqlCommand(select, con);
                SqlDataReader read = cmd.ExecuteReader();

                if (read.Read() == true)
                {
                    string pword = read.GetValue(2).ToString(), _reason = reason.Text;

                    if (_reason.Length > 20)
                    {
                        errorReason.Visible = false;
                        //errorReason.Text = "*This field musn't be less than 20 characters...";
                    }

                    if (pword_del.Value == pword)
                    {
                        errorPword.Visible = false;
                        //errorPword.Text = "*Password is incorrect...";
                    }

                    //VALIDATION             

                    if (_reason.Length < 20)
                    {
                        errorReason.Visible = true;
                        errorReason.Text = "*This field musn't be less than 20 characters...";
                    }

                    else if (pword_del.Value != pword)
                    {
                        errorPword.Visible = true;
                        errorPword.Text = "*Password is incorrect...";
                    }

                    else
                    {
                        read.Close();

                        string insert1, insert2, insert3, delete1, delete2, delete3, delete4, percent = String.Empty;
                        int amount = 0, o_amount = 0;

                        string select2 = "SELECT * FROM Orders WHERE OrderID='" + DelID.Text + "'";
                        SqlCommand cmd2 = new SqlCommand(select2, con);
                        SqlDataReader read2 = cmd2.ExecuteReader();

                        if (read2.Read())
                        {
                            DateTime oDate = Convert.ToDateTime(read2.GetValue(8));
                            o_amount = Convert.ToInt32(read2.GetValue(15));

                            if ((oDate - DateTime.Now).TotalDays <= 7)
                            {
                                amount = (100 / 100) * o_amount;
                                percent = "100%";
                            }

                            else if ((oDate - DateTime.Now).TotalDays > 7 && (oDate - DateTime.Now).TotalDays <= 14)
                            {
                                amount = (80 / 100) * o_amount;
                                percent = "80%";
                            }

                            else if ((oDate - DateTime.Now).TotalDays > 14 && (oDate - DateTime.Now).TotalDays <= 21)
                            {
                                amount = (70 / 100) * o_amount;
                                percent = "70%";
                            }

                            else if ((oDate - DateTime.Now).TotalDays > 21 && (oDate - DateTime.Now).TotalDays <= 30)
                            {
                                amount = (60 / 100) * o_amount;
                                percent = "60%";
                            }

                            else if ((oDate - DateTime.Now).TotalDays > 30)
                            {
                                amount = (50 / 100) * o_amount;
                                percent = "50%";
                            }
                        }

                        read2.Close();

                        insert1 = " INSERT INTO DeletedOrders(ServiceID, ServiceName, ServiceAmount, ProjectName, Description, Features, ClientID, OrderID, DateOrdered, Attachment1, Attachment2, Attachment3, DateExpected, Quantity, TotalAmount, image, Apath1, Apath2, Apath3, DateDeleted, Badge) SELECT ServiceID, ServiceName, ServiceAmount, ProjectName, Description, Features, ClientID, OrderID, DateOrdered, Attachment1, Attachment2, Attachment3, DateExpected, Quantity, TotalAmount, image, Apath1, Apath2, Apath3, '" + DateTime.Now + "', 'New' FROM Orders WHERE OrderID='" + DelID.Text + "' ";
                        insert2 = " INSERT INTO Refunds (OrderID, Amount, DateRequested, ClientID, Original, Percentage, ID, status, Badge) VALUES('" + DelID.Text + "', " + amount + ", '" + DateTime.Now.Date + "', '" + _user + "', " + o_amount + ", '" + percent + "', '" + _rdm + "', 'pending', 'New') ";
                        insert3 = " INSERT INTO DeletedExtras(Name, Description, ID, OrderID, Price, ClientID, Badge) SELECT Name, Description, ID, OrderID, Price, ClientID, 'New' from OrderExtra WHERE OrderID='" + DelID.Text + "' ";
                        delete1 = " DELETE FROM Orders WHERE OrderID='" + DelID.Text + "' ";
                        delete2 = " DELETE FROM Revisions WHERE OrderID='" + DelID.Text + "' ";
                        delete3 = " DELETE FROM OrderExtra WHERE OrderID='" + DelID.Text + "' ";
                        delete4 = " DELETE FROM RevisionExtra WHERE OrderID='" + DelID.Text + "' ";

                        SqlCommand icmd1, icmd2, icmd3, dcmd1, dcmd2, dcmd3, dcmd4;
                        icmd1 = new SqlCommand(insert1, con);
                        icmd2 = new SqlCommand(insert2, con);
                        icmd3 = new SqlCommand(insert3, con);
                        dcmd1 = new SqlCommand(delete1, con);
                        dcmd2 = new SqlCommand(delete2, con);
                        dcmd3 = new SqlCommand(delete3, con);
                        dcmd4 = new SqlCommand(delete4, con);

                        SqlDataAdapter sda1, sda2, sda3, sda4, sda5, sda6, sda7;
                        sda1 = new SqlDataAdapter();
                        sda2 = new SqlDataAdapter();
                        sda3 = new SqlDataAdapter();
                        sda4 = new SqlDataAdapter();
                        sda5 = new SqlDataAdapter();
                        sda6 = new SqlDataAdapter();
                        sda7 = new SqlDataAdapter();

                        sda1.InsertCommand = icmd1;
                        sda2.InsertCommand = icmd2;
                        sda5.InsertCommand = icmd3;
                        sda3.DeleteCommand = dcmd1;
                        sda4.DeleteCommand = dcmd2;
                        sda6.DeleteCommand = dcmd3;
                        sda7.DeleteCommand = dcmd4;

                        sda1.InsertCommand.ExecuteNonQuery();
                        sda2.InsertCommand.ExecuteNonQuery();
                        sda5.InsertCommand.ExecuteNonQuery();
                        sda3.DeleteCommand.ExecuteNonQuery();
                        sda4.DeleteCommand.ExecuteNonQuery();
                        sda6.DeleteCommand.ExecuteNonQuery();
                        sda7.DeleteCommand.ExecuteNonQuery();

                        Response.Write("<script>alert('Item deleted successfully')</script>");
                        overlay3.Visible = false;
                        editmodal3.Visible = false;
                        errorReason.Visible = false;
                        errorPword.Visible = false;
                        pword_del.Value = null;
                        reason.Text = null;

                       /* con.Close();
                        Bind();
                        Response.Redirect("Dashboard.aspx?id=" + _user + ""); */
                    }
                }
            }
            Bind();
            BindCancel();
            con.Close();          
        }

        protected void _search()
        {
            if (search.Text==null||search.Text=="")
            {
                ordernull.Visible = false;
                orderyes.Visible = true;
                searchnull.Visible = false;
                Bind();
            }

            else
            {
                string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                con.Open();

                string id = Request.QueryString["id"], select = String.Empty;// " SELECT * FROM Orders WHERE ClientID='" + id + "' AND OrderType='Open' AND ServiceName LIKE '%" + search.Text + "%' OR ProjectName LIKE '%" + search.Text + "%' OR OrderID LIKE '%" + search.Text + "%' ";

                if (o_searchby.Value == "orderid")
                {
                    select = "  SELECT * FROM Orders WHERE ClientID='" + id + "' AND OrderType='Open' AND OrderID LIKE '%" + search.Text + "%' ";
                }

                else if (o_searchby.Value == "servicename")
                {
                    select = "  SELECT * FROM Orders WHERE ClientID='" + id + "' AND OrderType='Open' AND ServiceName LIKE '%" + search.Text + "%' ";
                }

                else if (o_searchby.Value == "projectname")
                {
                    select = "  SELECT * FROM Orders WHERE ClientID='" + id + "' AND OrderType='Open' AND ProjectName LIKE '%" + search.Text + "%' ";
                }
                
                SqlCommand cmd = new SqlCommand(select, con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                orderlist.DataSource = ds;
                orderlist.DataBind();

                SqlDataReader read = cmd.ExecuteReader();

                if (read.HasRows)
                {
                    ordernull.Visible = false;
                    searchnull.Visible = false;
                    orderyes.Visible = true;
                    //read.Close();                    
                }

                else
                {
                    ordernull.Visible = false;
                    searchnull.Visible = true;
                    searchtext.InnerHtml = "Sorry, but the item '" + search.Text + "' was not found amongst your orders";
                    orderyes.Visible = false;
                }

                con.Close();
            }
        }

        protected void _search2()
        {
            if (f_search.Text == null || f_search.Text == "")
            {
                finishnull.Visible = false;
                finishyes.Visible = true;
                f_searchnull.Visible = false;
                BindFinish();
            }

            else
            {
                string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                con.Open();

                string id = Request.QueryString["id"], select = String.Empty; 

                if (f_searchby.Value == "orderid")
                {
                    select = "  SELECT * FROM Orders WHERE ClientID='" + id + "' AND OrderType='closed' AND OrderID LIKE '%" + f_search.Text + "%' ";
                }

                else if (f_searchby.Value == "servicename")
                {
                    select = "  SELECT * FROM Orders WHERE ClientID='" + id + "' AND OrderType='closed' AND ServiceName LIKE '%" + f_search.Text + "%' ";
                }

                else if (f_searchby.Value == "projectname")
                {
                    select = "  SELECT * FROM Orders WHERE ClientID='" + id + "' AND OrderType='closed' AND ProjectName LIKE '%" + f_search.Text + "%' ";
                }

                SqlCommand cmd = new SqlCommand(select, con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                finishlist.DataSource = ds;
                finishlist.DataBind();

                SqlDataReader read = cmd.ExecuteReader();

                if (read.HasRows)
                {
                    finishnull.Visible = false;
                    f_searchnull.Visible = false;
                    finishyes.Visible = true;
                    //read.Close();                    
                }

                else
                {
                    finishnull.Visible = false;
                    f_searchnull.Visible = true;
                    f_searchtext.InnerHtml = "Sorry, but the item '" + f_search.Text + "' was not found amongst your orders";
                    finishyes.Visible = false;
                }

                con.Close();
            } 
        }
           
        protected void finishedView(object sender, EventArgs e)
        {
            f_overlay.Visible = true;
            f_viewModal.Visible = true;

            DataListItem dlst = (sender as LinkButton).NamingContainer as DataListItem;
            Label id = ((Label)dlst.FindControl("id"));
            string _id = id.Text.Split(' ')[1];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Orders WHERE OrderID='" + _id + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            while (read.Read())
            {
                f_ID.Text = _id;
                f_serviceName.Text = read.GetValue(1).ToString();
                f_quantity.Text = read.GetValue(14).ToString();
                f_totalAmount.Text = read.GetValue(15).ToString();
                f_ProjectName.Text = read.GetValue(3).ToString();
                f_dateOrdered.Text = Convert.ToDateTime(read.GetValue(8)).ToString();
                f_dateExpected.Text = Convert.ToDateTime(read.GetValue(13)).ToString();
                f_dateCompleted.Text = read.GetValue(20).ToString();
                delete_complete.InnerHtml = "Date completed";
                f_description.Text = read.GetValue(4).ToString();
                f_features.Text = read.GetValue(5).ToString();
                f_A1.Text = read.GetValue(17).ToString();
                f_A2.Text = read.GetValue(18).ToString();
                f_A3.Text = read.GetValue(19).ToString();
            }
            con.Close();
            F_BindExtra(_id);

            update_badge("Orders", "OrderID", _id);
        }

        protected void finishedDelete(object sender, EventArgs e)
        {

        }

        protected void f_searched(object sender, EventArgs e)
        {
            _search2();
        }

        protected void f_go_Click(object sender, EventArgs e)
        {
            _search2();
        }

        protected void f_cancel(object sender, EventArgs e)
        {
            f_overlay.Visible = false;
            f_viewModal.Visible = false;
        }

        protected void o_searched(object sender, EventArgs e)
        {
            _search();
        }

        protected void go_Click(object sender, EventArgs e)
        {
            _search();
        }

        protected void cancelview(object sender, EventArgs e)
        {
            f_overlay.Visible = true;
            f_viewModal.Visible = true;

            DataListItem dlst = (sender as LinkButton).NamingContainer as DataListItem;
            Label id = ((Label)dlst.FindControl("id"));
            string _id = id.Text.Split(' ')[1];

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM DeletedOrders WHERE OrderID='" + _id + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            while (read.Read())
            {
                f_ID.Text = _id;
                f_serviceName.Text= read.GetValue(1).ToString();
                f_quantity.Text = read.GetValue(13).ToString();
                f_totalAmount.Text = read.GetValue(14).ToString();
                f_ProjectName.Text = read.GetValue(3).ToString();
                f_dateOrdered.Text = Convert.ToDateTime(read.GetValue(8)).ToString();
                f_dateExpected.Text = Convert.ToDateTime(read.GetValue(12)).ToString();
                f_dateCompleted.Text = Convert.ToDateTime(read.GetValue(19)).ToString();
                delete_complete.InnerHtml = "Date deleted";
                f_description.Text = read.GetValue(4).ToString();
                f_features.Text = read.GetValue(5).ToString();
                f_A1.Text = read.GetValue(16).ToString();
                f_A2.Text = read.GetValue(17).ToString();
                f_A3.Text = read.GetValue(18).ToString();
            }
            con.Close();
            C_BindExtra(_id);

            update_badge("DeletedOrders", "OrderID", _id);
        }

        protected void restore_function_Click(object sender, EventArgs e)
        {
            g_overlay.Visible = true;
            g_editmodal.Visible = true;
            restore_container.Style["display"] = "block";
            revision_order_container.Style["display"] = "none";
            revision_delete_order_container.Style["display"] = "none";

            DataListItem dlst = (sender as LinkButton).NamingContainer as DataListItem;
            Label funcID = ((Label)dlst.FindControl("funcID"));

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM DeletedExtras WHERE ID='" + funcID.Text + "'", o_ID = String.Empty;
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            if (read.Read())
            {
                o_ID = read.GetValue(3).ToString();
                func_ID.Text = read.GetValue(2).ToString();
                func_order_ID.Text= read.GetValue(3).ToString();
            }

            read.Close();

            string select2 = "SELECT * FROM Orders WHERE OrderID='" + o_ID + "' AND OrderType='Open'";
            SqlCommand cmd2 = new SqlCommand(select2, con);
            SqlDataReader read2 = cmd2.ExecuteReader();

            if (read2.HasRows)
            {
                restore_good.Style["display"] = "block";
                restore_bad.Style["display"] = "none";
            }

            else
            {
                restore_good.Style["display"] = "none";
                restore_bad.Style["display"] = "block";
            }

            update_badge("DeletedExtras", "ID", funcID.Text);
        }

        protected void confirm_func_restore_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select2 = "SELECT * FROM Orders WHERE OrderID='" + func_order_ID.Text + "' AND OrderType='Open'";
            SqlCommand cmd2 = new SqlCommand(select2, con);
            SqlDataReader read2 = cmd2.ExecuteReader();

            if (read2.HasRows)
            {
                read2.Close();

                string select3 = " SELECT * FROM RevisionExtra WHERE ID='" + func_ID.Text + "' ";
                SqlCommand cmd3 = new SqlCommand(select3, con);
                SqlDataReader read3 = cmd3.ExecuteReader();

                if (read3.HasRows)
                {
                    func_exist.InnerHtml = "Item with function id " + func_ID.Text + " already exists in revision, to edit existing go to revisions and select this function";
                    func_info.Style["background-color"] = "orangered";
                    func_exist.Style["color"] = "white";
                }

                else
                {
                    //Command goes here
                    read3.Close();

                    string _user = Request.QueryString["id"], select = "SELECT * FROM Users WHERE UserId='" + _user + "'", pword = String.Empty, _reason = func_reason.Text;
                    SqlCommand cmd = new SqlCommand(select, con);
                    SqlDataReader read = cmd.ExecuteReader();

                    if (read.Read())
                    {
                        pword = read.GetValue(2).ToString();
                    }

                    if (_reason.Length > 20)
                    {
                        func_error_reason.Visible = false;
                        //func_error_reason.Text = "*Sorry this field must be greater than 20 characters...";
                    }

                    if (func_pword.Value == pword)
                    {
                        func_error_pword.Visible = false;
                        //func_error_pword.Text = "*Invalid password...";
                    }

                    //VALIDATION

                    if (_reason.Length < 20)
                    {
                        func_error_reason.Visible = true;
                        func_error_reason.Text = "*Sorry this field must be greater than 20 characters...";
                    }

                    else if (func_pword.Value != pword)
                    {
                        func_error_pword.Visible = true;
                        func_error_pword.Text = "*Invalid password...";
                    }

                    else
                    {
                        read.Close();

                        string insert = " INSERT INTO RevisionExtra(Name, Description, ID, OrderID, Price, ClientID, Type, Badge) SELECt Name, Description, ID, OrderID, Price, ClientID, 'Restore', 'New' FROM DeletedExtras WHERE ID='" + func_ID.Text + "' ";
                        //string delete = " DELETE FROM DeletedExtra WHERE ID='" + func_ID.Text + "' ";

                        SqlCommand cmd1, cmd4;
                        cmd1 = new SqlCommand(insert, con);
                        //cmd4 = new SqlCommand(delete, con);

                        SqlDataAdapter sda1, sda2;
                        sda1 = new SqlDataAdapter();
                        //sda2 = new SqlDataAdapter();

                        sda1.InsertCommand = cmd1;
                        //sda2.DeleteCommand = cmd4;

                        sda1.InsertCommand.ExecuteNonQuery();
                        //sda2.DeleteCommand.ExecuteNonQuery();

                        func_exist.InnerHtml = "Function successfully added to revisions. Please wait about 3-4 days before it can be restored to your order...";
                    }
                }
            }

            else
            {

            }           
        }

        protected void cancel_search1()
        {
            if (c_search.Text == null || c_search.Text == "")
            {
                cancelnull.Visible = false;
                cancelyes.Visible = true;
                c_searchnull.Visible = false;
                BindCancel();
            }

            else
            {
                string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                con.Open();

                string id = Request.QueryString["id"], select = String.Empty;

                if (c_searchby.Value == "orderid")
                {
                    select = "  SELECT * FROM DeletedOrders WHERE ClientID='" + id + "' AND OrderID LIKE '%" + c_search.Text + "%' ";
                }

                else if (c_searchby.Value == "servicename")
                {
                    select = "  SELECT * FROM DeletedOrders WHERE ClientID='" + id + "' AND ServiceName LIKE '%" + c_search.Text + "%' ";
                }

                else if (c_searchby.Value == "projectname")
                {
                    select = "  SELECT * FROM DeletedOrders WHERE ClientID='" + id + "' AND ProjectName LIKE '%" + c_search.Text + "%' ";
                }

                SqlCommand cmd = new SqlCommand(select, con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                cancelledlist.DataSource = ds;
                cancelledlist.DataBind();

                SqlDataReader read = cmd.ExecuteReader();

                if (read.HasRows)
                {
                    cancelnull.Visible = false;
                    c_searchnull.Visible = false;
                    cancelyes.Visible = true;
                    //read.Close();                    
                }

                else
                {
                    cancelnull.Visible = false;
                    c_searchnull.Visible = true;
                    c_searchtext.InnerHtml = "Sorry, but the item '" + c_search.Text + "' was not found amongst your deleted orders";
                    cancelyes.Visible = false;
                }

                con.Close();
            }
        }

        protected void cancel_search2()
        {
            if (c_search2.Text == null || c_search2.Text == "")
            {
                cancelnull2.Visible = false;
                cancelyes2.Visible = true;
                c_searchnull2.Visible = false;
                BindCancelExtra();
            }

            else
            {
                string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                con.Open();

                string id = Request.QueryString["id"], select = String.Empty;

                if (c_searchby2.Value == "orderid")
                {
                    select = "  SELECT * FROM DeletedExtras WHERE ClientID='" + id + "' AND OrderID LIKE '%" + c_search2.Text + "%' ";
                }

                else if (c_searchby2.Value == "funcid")
                {
                    select = "  SELECT * FROM DeletedExtras WHERE ClientID='" + id + "' AND ID LIKE '%" + c_search2.Text + "%' ";
                }

                SqlCommand cmd = new SqlCommand(select, con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                cancelledlist2.DataSource = ds;
                cancelledlist2.DataBind();

                SqlDataReader read = cmd.ExecuteReader();

                if (read.HasRows)
                {
                    cancelnull2.Visible = false;
                    c_searchnull2.Visible = false;
                    cancelyes2.Visible = true;
                    //read.Close();                    
                }

                else
                {
                    cancelnull2.Visible = false;
                    c_searchnull2.Visible = true;
                    c_searchtext2.InnerHtml = "Sorry, but the item '" + c_search2.Text + "' was not found amongst your deleted functions";
                    cancelyes2.Visible = false;
                }

                con.Close();
            }
        }

        protected void c_search_TextChanged(object sender, EventArgs e)
        {
            cancel_search1();
        }

        protected void c_go_Click(object sender, EventArgs e)
        {
            cancel_search1();
        }

        protected void c_search2_TextChanged(object sender, EventArgs e)
        {
            cancel_search2();
        }

        protected void c_go2_Click(object sender, EventArgs e)
        {
            cancel_search2();
        }

        protected void ViewGeneral(object sender)
        {
            DataListItem dlst = (sender as LinkButton).NamingContainer as DataListItem;

        }

        protected void r_view1_Click(object sender, EventArgs e)
        {
            DataListItem dlstchild = (sender as LinkButton).NamingContainer as DataListItem;
            Label _ID = ((Label)dlstchild.FindControl("id"));
            string _oid = _ID.Text.Split(' ')[1];
            rev_o_ID.Value = _oid;

            g_overlay.Visible = true;
            g_editmodal.Visible = true;
            revision_order_container.Style["display"] = "block";
            restore_container.Style["display"] = "none";
            revision_delete_order_container.Style["display"] = "none";
            rev_o_success_contain.Style["display"] = "none";

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = "SELECT * FROM Revisions WHERE OrderID='" + _oid + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();
            while (read.Read())
            {
                rev_o_ProjectName.Value = read.GetValue(3).ToString();
                rev_o_DateExpected.Text = read.GetValue(13).ToString();
                rev_o_Description.Value = read.GetValue(4).ToString();
                rev_o_Features.Value = read.GetValue(5).ToString();
                rev_o_DateOrdered.Text = Convert.ToDateTime(read.GetValue(8)).ToString();
                rev_o_A1.Text = read.GetValue(17).ToString();
                rev_o_A2.Text = read.GetValue(18).ToString();
                rev_o_A3.Text = read.GetValue(19).ToString();
            }

            con.Close();
            //BindExtra(_oid);
            BindExtraGeneral("RevisionExtra", _oid, rev_o_ExtraFunctionlList, "OrderID");
            update_badge("Revisions", "OrderID", _oid);
        }

        protected void r_delete1_Click(object sender, EventArgs e)
        {
            DataListItem dlstchild = (sender as LinkButton).NamingContainer as DataListItem;
            Label id = ((Label)dlstchild.FindControl("id"));

            g_overlay.Visible = true;
            g_editmodal.Visible = true;
            revision_order_container.Style["display"] = "none";
            restore_container.Style["display"] = "none";
            revision_delete_order_container.Style["display"] = "block";

            rev_o_del_ID.Text = id.Text.ToString().Split(' ')[1];
            update_badge("Revisions", "OrderID", id.Text.ToString().Split(' ')[1]);
        }

        protected void rev_o_Save_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string Desc = rev_o_Description.Value, Feat = rev_o_Features.Value, zipext = Path.GetExtension(rev_o_zipUpload.PostedFile.FileName);
            decimal a1size = Math.Round(((decimal)rev_o_A1Upload.PostedFile.ContentLength / (decimal)1024), 2);
            decimal a2size = Math.Round(((decimal)rev_o_A2Upload.PostedFile.ContentLength / (decimal)1024), 2);
            decimal a3size = Math.Round(((decimal)rev_o_A3Upload.PostedFile.ContentLength / (decimal)1024), 2);
            decimal zipsize = Math.Round(((decimal)rev_o_zipUpload.PostedFile.ContentLength / (decimal)1024), 2);

            if (rev_o_ProjectName.Value != null || rev_o_ProjectName.Value != "")
            {
                rev_o_ProjectNameError.Visible = false;
                //rev_o_ProjectNameError.Text = "*This field can not be empty";
            }

            if (Desc.Length > 50 || rev_o_Description.Value != "")
            {
                rev_o_DescriptionError.Visible = false;
                //rev_o_DescriptionError.Text = "*This field must be more than 50 characters";
            }

            if (Feat.Length > 50 || rev_o_Features.Value != "")
            {
                rev_o_FeaturesError.Visible = false;
                //rev_o_FeaturesError.Text = "*This field must be more than 50 characters";
            }

            if (rev_o_DateExpected.Text != "" || rev_o_DateExpected.Text != null)
            {
                rev_o_DateExpectedError.Visible = false;
                //rev_o_DateExpectedError.Text = "*This field can not be empty";
            }

            if (rev_o_A1Upload.HasFile && a1size < 5200)
            {
                rev_o_A1Error.Visible = false;
                rev_o_A1Error.Text = "*File must not be greater than 5MB";
            }

            if (rev_o_A2Upload.HasFile && a2size < 5200)
            {
                rev_o_A2Error.Visible = false;
                rev_o_A2Error.Text = "*File must not be greater than 5MB";
            }

            if (rev_o_A3Upload.HasFile && a3size < 5200)
            {
                rev_o_A3Error.Visible = false;
                rev_o_A3Error.Text = "*File must not be greater than 5MB";
            }

            if (rev_o_zipUpload.HasFile && zipsize < 52000)
            {
                rev_o_zipError.Visible = false;
                rev_o_zipError.Text = "*File must not be greater than 50MB";
            }

            if (rev_o_zipUpload.HasFile && zipext == ".zip")
            {
                rev_o_zipError.Visible = false;
                rev_o_zipError.Text = "*File must be a zip file";
            }

            //VALIDATION

            if (rev_o_ProjectName.Value == null || rev_o_ProjectName.Value == "")
            {
                rev_o_ProjectNameError.Visible = true;
                rev_o_ProjectNameError.Text = "*This field can not be empty";
            }

            else if (Desc.Length < 50 || rev_o_Description.Value == "")
            {
                rev_o_DescriptionError.Visible = true;
                rev_o_DescriptionError.Text = "*This field must be more than 50 characters";
            }

            else if (Feat.Length < 50 || rev_o_Features.Value == "")
            {
                rev_o_FeaturesError.Visible = true;
                rev_o_FeaturesError.Text = "*This field must be more than 50 characters";
            }

            else if (rev_o_DateExpected.Text == "" || rev_o_DateExpected.Text == null)
            {
                rev_o_DateExpectedError.Visible = true;
                rev_o_DateExpectedError.Text = "*This field can not be empty";
            }

            else if ((Convert.ToDateTime(rev_o_DateExpected.Text) - Convert.ToDateTime(rev_o_DateOrdered.Text)).TotalDays < 7)
            {
                rev_o_DateExpectedError.Visible = true;
                rev_o_DateExpectedError.Text = "*Date must not be less than & days from order date";
            }

            else if (Convert.ToDateTime(rev_o_DateExpected.Text) < DateTime.Now)
            {
                rev_o_DateExpectedError.Visible = true;
                rev_o_DateExpectedError.Text = "*Date must not be less than today's date";
            }

            else if (rev_o_A1Upload.HasFile && a1size > 5200)
            {
                rev_o_A1Error.Visible = true;
                rev_o_A1Error.Text = "*File must not be greater than 5MB";
            }

            else if (rev_o_A2Upload.HasFile && a2size > 5200)
            {
                rev_o_A2Error.Visible = true;
                rev_o_A2Error.Text = "*File must not be greater than 5MB";
            }

            else if (rev_o_A3Upload.HasFile && a3size > 5200)
            {
                rev_o_A3Error.Visible = true;
                rev_o_A3Error.Text = "*File must not be greater than 5MB";
            }

            else if (rev_o_zipUpload.HasFile && zipsize > 52000)
            {
                rev_o_zipError.Visible = true;
                rev_o_zipError.Text = "*File must not be greater than 50MB";
            }

            else if (rev_o_zipUpload.HasFile && zipext != ".zip")
            {
                rev_o_zipError.Visible = true;
                rev_o_zipError.Text = "*File must be a zip file";
            }

            else
            {
                string update = "UPDATE Revisions SET ProjectName='" + rev_o_ProjectName.Value + "', DateExpected='" + rev_o_DateExpected.Text + "', Description='" + rev_o_Description.Value + "', Features='" + rev_o_Features.Value + "' WHERE OrderID='" + rev_o_ID.Value + "' ";
                SqlCommand ucmd = new SqlCommand(update, con);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.UpdateCommand = ucmd;
                sda.UpdateCommand.ExecuteNonQuery();

                string A1Path, A2Path, A3Path, zipPath, zipName, A1Name, A2Name, A3Name, ext1, ext2, ext3, zipext2;

                A1Path = rev_o_A1Upload.PostedFile.FileName;
                A2Path = rev_o_A2Upload.PostedFile.FileName;
                A3Path = rev_o_A3Upload.PostedFile.FileName;
                zipPath = rev_o_zipUpload.PostedFile.FileName;

                A1Name = Path.GetFileName(A1Path);
                A2Name = Path.GetFileName(A2Path);
                A3Name = Path.GetFileName(A3Path);
                zipName = Path.GetFileName(zipPath);

                ext1 = Path.GetExtension(A1Name);
                ext2 = Path.GetExtension(A2Name);
                ext3 = Path.GetExtension(A3Name);
                zipext2 = Path.GetExtension(zipName);

                if (ext1 != "")
                {
                    byte[] A1Byte;
                    using (BinaryReader A1br = new BinaryReader(rev_o_A1Upload.PostedFile.InputStream))
                    {
                        A1Byte = A1br.ReadBytes(rev_o_A1Upload.PostedFile.ContentLength);
                    }

                    string _update = "UPDATE Revisions SET Attachment1=@A1, Apath1=@A1path WHERE OrderID='" + rev_o_ID.Value + "' ";
                    SqlCommand _ucmd = new SqlCommand(_update, con);
                    _ucmd.Parameters.AddWithValue("@A1", A1Byte);
                    _ucmd.Parameters.AddWithValue("@A1path", rev_o_A1Upload.PostedFile.FileName.ToString());
                    SqlDataAdapter _sda = new SqlDataAdapter();
                    _sda.UpdateCommand = _ucmd;
                    _sda.UpdateCommand.ExecuteNonQuery();
                }

                if (ext2 != "")
                {
                    byte[] A2Byte;
                    using (BinaryReader A2br = new BinaryReader(rev_o_A2Upload.PostedFile.InputStream))
                    {
                        A2Byte = A2br.ReadBytes(rev_o_A2Upload.PostedFile.ContentLength);
                    }

                    string _update = "UPDATE Revisions SET Attachment2=@A2, Apath2=@A2path WHERE OrderID='" + rev_o_ID.Value + "' ";
                    SqlCommand _ucmd = new SqlCommand(_update, con);
                    _ucmd.Parameters.AddWithValue("@A2", A2Byte);
                    _ucmd.Parameters.AddWithValue("@A2path", rev_o_A2Upload.PostedFile.FileName.ToString());
                    SqlDataAdapter _sda = new SqlDataAdapter();
                    _sda.UpdateCommand = _ucmd;
                    _sda.UpdateCommand.ExecuteNonQuery();
                }

                if (ext3 != "")
                {
                    byte[] A3Byte;
                    using (BinaryReader A3br = new BinaryReader(rev_o_A3Upload.PostedFile.InputStream))
                    {
                        A3Byte = A3br.ReadBytes(rev_o_A3Upload.PostedFile.ContentLength);
                    }

                    string _update = "UPDATE Revisions SET Attachment3=@A3, Apath3=@A3path WHERE OrderID='" + rev_o_ID.Value + "' ";
                    SqlCommand _ucmd = new SqlCommand(_update, con);
                    _ucmd.Parameters.AddWithValue("@A3", A3Byte);
                    _ucmd.Parameters.AddWithValue("@A3path", rev_o_A3Upload.PostedFile.FileName.ToString());
                    SqlDataAdapter _sda = new SqlDataAdapter();
                    _sda.UpdateCommand = _ucmd;
                    _sda.UpdateCommand.ExecuteNonQuery();
                }

                if (zipext2 != "")
                {
                    byte[] zipByte;
                    using (BinaryReader zipbr = new BinaryReader(rev_o_zipUpload.PostedFile.InputStream))
                    {
                        zipByte = zipbr.ReadBytes(rev_o_zipUpload.PostedFile.ContentLength);
                    }

                    string _update = "UPDATE Revisions SET ZipFilePath=@zippath, ZipFileName=@zipname WHERE OrderID='" + rev_o_ID.Value + "' ";
                    SqlCommand _ucmd = new SqlCommand(_update, con);
                    _ucmd.Parameters.AddWithValue("@zippath", zipByte);
                    _ucmd.Parameters.AddWithValue("@zipname", rev_o_zipUpload.PostedFile.FileName.ToString());
                    SqlDataAdapter _sda = new SqlDataAdapter();
                    _sda.UpdateCommand = _ucmd;
                    _sda.UpdateCommand.ExecuteNonQuery();
                }

                con.Close();

                rev_o_success.Visible = true;
                rev_o_success_contain.Style["display"] = "block";
            }
        }

        protected void rev_o_del_ConfirmDelete_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string _user = Request.QueryString["id"], select = "SELECT * FROM Users WHERE UserId='" + _user + "'", delete1, delete2, pword = String.Empty, _reason = rev_o_del_reason.Text;
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            if (read.Read())
            {
                pword = read.GetValue(2).ToString();
            }

            read.Close();

            if (_reason.Length > 20)
            {
                rev_o_del_reasonError.Visible = false;
                //rev_o_del_reasonError.Text = "*This field musn't be less than 20 characters...";
            }

            if (rev_o_del_pword.Value == pword)
            {
                rev_o_del_pwordError.Visible = false;
                //rev_o_del_pwordError.Text = "*Password is incorrect...";
            }

            //VALIDATION

            if (_reason.Length<20)
            {
                rev_o_del_reasonError.Visible = true;
                rev_o_del_reasonError.Text = "*This field musn't be less than 20 characters...";
            }

            else if (rev_o_del_pword.Value!=pword)
            {
                rev_o_del_pwordError.Visible = true;
                rev_o_del_pwordError.Text = "*Password is incorrect...";
            }

            else
            {
                delete1 = " DELETE FROM Revisions WHERE OrderID='" + rev_o_del_ID.Text + "' ";
                delete2 = " DELETE FROM RevisionExtra WHERE OrderID='" + rev_o_del_ID.Text + "' ";

                SqlCommand cmd1, cmd2;
                cmd1 = new SqlCommand(delete1, con);
                cmd2 = new SqlCommand(delete2, con);

                SqlDataAdapter sda1 = new SqlDataAdapter(), sda2 = new SqlDataAdapter();
                sda1.DeleteCommand = cmd1;
                sda2.DeleteCommand = cmd2;

                sda1.DeleteCommand.ExecuteNonQuery();
                sda2.DeleteCommand.ExecuteNonQuery();

                Response.Write("<script>alert(\"Revision deleted succesfully...\")</script>");

                g_cancel();

                BindGeneral("Revisions", revisionOrderList, revision_null, r_searchnull1, Trevisions1);
                BindGeneral("RevisionExtra", revisionFunctionList, revision_null2, r_searchnull2, Trevisions2);
            }

            con.Close();           
        }

        protected void rev_o_funcsave_Click(object sender, EventArgs e)
        {
            DataListItem dlst = (sender as LinkButton).NamingContainer as DataListItem;
            Label id = ((Label)dlst.FindControl("funcID"));
            TextBox describe = ((TextBox)dlst.FindControl("funcDescribe"));
            Label error = ((Label)dlst.FindControl("error"));
            Label funcwarn = ((Label)dlst.FindControl("funcWarn"));

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            if (describe.ToString().Length > 50)
            {
                error.Visible = false;
                //error.Text = "*This field must not be less than 50 characters...";
            }

            //VALIDATION

            if (describe.Text.ToString().Length<50)
            {
                error.Visible = true;
                error.Text = "*This field must not be less than 50 characters...";
            }

            else
            {
                string update = " UPDATE RevisionExtra SET Description='" + describe.Text + "' WHERE ID='" + id.Text + "' ";
                SqlCommand cmd = new SqlCommand(update, con);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.UpdateCommand = cmd;
                sda.UpdateCommand.ExecuteNonQuery();

                BindExtraGeneral("RevisionExtra", rev_o_ID.Value, rev_o_ExtraFunctionlList, "OrderID");
                BindGeneral("RevisionExtra", revisionFunctionList, revision_null2, r_searchnull2, Trevisions2);
                funcwarn.Text = "<li>Function with id " + id.Text + " was successfully updated</li>";
                //Response.Write("<script>alert(\"Function succesfully updated...\")</script>");
            }

            con.Close();
            
        }

        protected void rev_o_funcdelete_Click(object sender, EventArgs e)
        {
            DataListItem dlst = (sender as LinkButton).NamingContainer as DataListItem;
            Label id = ((Label)dlst.FindControl("funcID"));

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string delete = " DELETE FROM RevisionExtra WHERE ID='" + id.Text + "' ";
            SqlCommand cmd = new SqlCommand(delete, con);
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.DeleteCommand = cmd;
            sda.DeleteCommand.ExecuteNonQuery();

            con.Close();
            BindExtraGeneral("RevisionExtra", rev_o_ID.Value, rev_o_ExtraFunctionlList, "OrderID");
            BindGeneral("RevisionExtra", revisionFunctionList, revision_null2, r_searchnull2, Trevisions2);
            Response.Write("<script>alert(\"Function succesfully deleted...\")</script>");
        }

        protected void rev_func_edit_Click(object sender, EventArgs e)
        {
            DataListItem dlst = (sender as LinkButton).NamingContainer as DataListItem;
            Label id = ((Label)dlst.FindControl("funcID"));

            g_overlay.Visible = true;
            g_editmodal.Visible = true;
            rev_func_container.Style["display"] = "block";

            rev_func_id.Text = id.Text;

            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = " SELECT * FROM RevisionExtra WHERE ID='" + id.Text + "' ";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            if (read.Read())
            {
                rev_func_name.Text = read.GetValue(0).ToString();
                rev_func_describe.Value= read.GetValue(1).ToString();
            }

            con.Close();

            update_badge("RevisionExtra", "ID", id.Text);
        }

        protected void rev_func_delete_Click(object sender, EventArgs e)
        {
            DataListItem dlst = (sender as LinkButton).NamingContainer as DataListItem;
            Label id = ((Label)dlst.FindControl("funcID"));

            g_overlay.Visible = true;
            g_editmodal.Visible = true;
            rev_func_del_container.Style["display"] = "block";

            rev_func_del_ID.Text = id.Text;

            update_badge("RevisionExtra", "ID", id.Text);
        }

        protected void rev_func_save_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            if (rev_func_describe.Value.ToString().Length > 50)
            {
                rev_func_describe_error.Visible = false;
                //error.Text = "*This field must not be less than 50 characters...";
            }

            //VALIDATION

            if (rev_func_describe.Value.ToString().Length < 50)
            {
                rev_func_describe_error.Visible = true;
                rev_func_describe_error.Text = "*This field must not be less than 50 characters...";
            }

            else
            {
                string update = " UPDATE RevisionExtra SET Description='" + rev_func_describe.Value + "' WHERE ID='" + rev_func_id.Text + "' ";
                SqlCommand cmd = new SqlCommand(update, con);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.UpdateCommand = cmd;
                sda.UpdateCommand.ExecuteNonQuery();

                BindExtraGeneral("RevisionExtra", rev_o_ID.Value, rev_o_ExtraFunctionlList, "OrderID");
                BindGeneral("RevisionExtra", revisionFunctionList, revision_null2, r_searchnull2, Trevisions2);

                rev_func_success_container.Style["display"] = "block";
                rev_func_success.Visible = true;
                //Response.Write("<script>alert(\"Function succesfully updated...\")</script>");
            }

            con.Close();
        }

        protected void rev_func_confirmDelete_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string _user = Request.QueryString["id"], select = "SELECT * FROM Users WHERE UserId='" + _user + "'", pword = String.Empty, _reason = rev_func_del_reason.Text;
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            if (read.Read())
            {
                pword = read.GetValue(2).ToString();
            }

            read.Close();

            if (_reason.Length > 20)
            {
                rev_func_del_reasonError.Visible = false;
            }

            if (rev_func_del_pword.Value == pword)
            {
                rev_func_del_pwordError.Visible = false;
            }

            //VALIDATION

            if (_reason.Length<20)
            {
                rev_func_del_reasonError.Visible = true;
            }

            else if (rev_func_del_pword.Value!=pword)
            {
                rev_func_del_pwordError.Visible = true;
            }

            else
            {
                 string delete = " DELETE FROM RevisionExtra WHERE ID='" + rev_func_del_ID.Text + "' ";
                 SqlCommand cmd1 = new SqlCommand(delete, con);
                 SqlDataAdapter sda = new SqlDataAdapter();
                 sda.DeleteCommand = cmd1;
                 sda.DeleteCommand.ExecuteNonQuery();

                 con.Close();
                 BindExtraGeneral("RevisionExtra", rev_o_ID.Value, rev_o_ExtraFunctionlList, "OrderID");
                 BindGeneral("RevisionExtra", revisionFunctionList, revision_null2, r_searchnull2, Trevisions2);
                 Response.Write("<script>alert(\"Function succesfully deleted...\")</script>");
                 g_cancel(); 
            }

            con.Close();
        }

        protected void rev_search()
        {
            if (r_search1.Text == null || r_search1.Text == "")
            {
                revision_null.Visible = false;
                revision_yes.Visible = true;
                r_searchnull1.Visible = false;
                BindGeneral("Revisions", revisionOrderList, revision_null, r_searchnull1, Trevisions1);
            }

            else
            {
                string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                con.Open();

                string id = Request.QueryString["id"], select = String.Empty;

                if (r_searchby1.Value == "orderid")
                {
                    select = "  SELECT * FROM Revisions WHERE ClientID='" + id + "' AND OrderID LIKE '%" + r_search1.Text + "%' ";
                }

                else if (r_searchby1.Value == "servicename")
                {
                    select = "  SELECT * FROM Revisions WHERE ClientID='" + id + "' AND ServiceName LIKE '%" + r_search1.Text + "%' ";
                }

                else if (r_searchby1.Value == "projectname")
                {
                    select = "  SELECT * FROM Revisions WHERE ClientID='" + id + "' AND ProjectName LIKE '%" + r_search1.Text + "%' ";
                }

                SqlCommand cmd = new SqlCommand(select, con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                revisionOrderList.DataSource = ds;
                revisionOrderList.DataBind();

                SqlDataReader read = cmd.ExecuteReader();

                if (read.HasRows)
                {
                    revision_null.Visible = false;
                    r_searchnull1.Visible = false;
                    revision_yes.Visible = true;
                    //read.Close();                    
                }

                else
                {
                    revision_null.Visible = false;
                    r_searchnull1.Visible = true;
                    r_searchtext1.InnerHtml = "Sorry, but the item '" + r_search1.Text + "' was not found amongst your revisions";
                    revision_yes.Visible = false;
                }

                con.Close();
            }
        }

        protected void rev_search2()
        {
            if (r_search2.Text == null || r_search2.Text == "")
            {
                revision_null2.Visible = false;
                revision_yes2.Visible = true;
                r_searchnull2.Visible = false;
                BindGeneral("RevisionExtra", revisionFunctionList, revision_null2, r_searchnull2, Trevisions2);
            }

            else
            {
                string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                con.Open();

                string id = Request.QueryString["id"], select = String.Empty;

                if (r_searchby2.Value == "orderid")
                {
                    select = "  SELECT * FROM RevisionExtra WHERE ClientID='" + id + "' AND OrderID LIKE '%" + r_search2.Text + "%' ";
                }

                else if (r_searchby2.Value == "funcid")
                {
                    select = "  SELECT * FROM RevisionExtra WHERE ClientID='" + id + "' AND ID LIKE '%" + r_search2.Text + "%' ";
                }

                SqlCommand cmd = new SqlCommand(select, con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                revisionFunctionList.DataSource = ds;
                revisionFunctionList.DataBind();

                SqlDataReader read = cmd.ExecuteReader();

                if (read.HasRows)
                {
                    revision_null2.Visible = false;
                    r_searchnull2.Visible = false;
                    revision_yes2.Visible = true;
                    //read.Close();                    
                }

                else
                {
                    revision_null2.Visible = false;
                    r_searchnull2.Visible = true;
                    r_searchtext2.InnerHtml = "Sorry, but the item '" + r_search2.Text + "' was not found amongst your functions";
                    revision_yes2.Visible = false;
                }

                con.Close();
            }
        }

        protected void transaction_search()
        {
            if (t_search.Text == null || t_search.Text == "")
            {
                transaction_null.Visible = false;
                transaction_yes.Visible = true;
                t_searchnull.Visible = false;
                BindGeneral("Transactions", transactionsList, transaction_null, t_searchnull, Ttransactions);
            }

            else
            {
                string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                con.Open();

                string id = Request.QueryString["id"], select = String.Empty;

                if (t_searchby.Value == "orderid")
                {
                    select = "  SELECT * FROM Transactions WHERE ClientID='" + id + "' AND OrderID LIKE '%" + t_search.Text + "%' ";
                }

                else if (t_searchby.Value == "transactionID")
                {
                    select = "  SELECT * FROM Transactions WHERE ClientID='" + id + "' AND TransactionID LIKE '%" + t_search.Text + "%' ";
                }

                SqlCommand cmd = new SqlCommand(select, con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                transactionsList.DataSource = ds;
                transactionsList.DataBind();

                SqlDataReader read = cmd.ExecuteReader();

                if (read.HasRows)
                {
                    transaction_null.Visible = false;
                    t_searchnull.Visible = false;
                    transaction_yes.Visible = true;
                    //read.Close();                    
                }

                else
                {
                    transaction_null.Visible = false;
                    t_searchnull.Visible = true;
                    t_searchnulltext.InnerHtml = "Sorry, but the item '" + t_search.Text + "' was not found amongst your transactions";
                    transaction_yes.Visible = false;
                }

                con.Close();
            }
        }

        protected void my_refunds_search()
        {
            if (refunds_search.Text == null || refunds_search.Text == "")
            {
                refunds_null.Visible = false;
                refunds_yes.Visible = true;
                refunds_searchnull.Visible = false;
                BindGeneral("Refunds", refundsList, refunds_null, refunds_searchnull, Trefunds);
            }

            else
            {
                string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                con.Open();

                string id = Request.QueryString["id"], select = String.Empty;

                if (refunds_searchby.Value == "orderid")
                {
                    select = "  SELECT * FROM Refunds WHERE ClientID='" + id + "' AND OrderID LIKE '%" + refunds_search.Text + "%' ";
                }

                else if (refunds_searchby.Value == "refundID")
                {
                    select = "  SELECT * FROM Refunds WHERE ClientID='" + id + "' AND ID LIKE '%" + refunds_search.Text + "%' ";
                }

                SqlCommand cmd = new SqlCommand(select, con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                refundsList.DataSource = ds;
                refundsList.DataBind();

                SqlDataReader read = cmd.ExecuteReader();

                if (read.HasRows)
                {
                    refunds_null.Visible = false;
                    refunds_searchnull.Visible = false;
                    refunds_yes.Visible = true;
                    //read.Close();                    
                }

                else
                {
                    refunds_null.Visible = false;
                    refunds_searchnull.Visible = true;
                    refunds_searchnullText.InnerHtml = "Sorry, but the item '" + refunds_search.Text + "' was not found amongst your pending refunds";
                    refunds_yes.Visible = false;
                }

                con.Close();
            }
        }

        protected void r_search1_TextChanged(object sender, EventArgs e)
        {
            rev_search();
        }

        protected void r_go1_Click(object sender, EventArgs e)
        {
            rev_search();
        }

        protected void r_search2_TextChanged(object sender, EventArgs e)
        {
            rev_search2();
        }

        protected void r_go2_Click(object sender, EventArgs e)
        {
            rev_search2();
        }

        protected void t_search_TextChanged(object sender, EventArgs e)
        {
            transaction_search();
        }

        protected void t_go_Click(object sender, EventArgs e)
        {
            transaction_search();
        }

        protected void refunds_search_TextChanged(object sender, EventArgs e)
        {
            my_refunds_search();
        }

        protected void refunds_go_Click(object sender, EventArgs e)
        {
            my_refunds_search();
        }

        protected void transactions_view(object sender, EventArgs e)
        {
            DataListItem dlst = (sender as LinkButton).NamingContainer as DataListItem;
            Label id = ((Label)dlst.FindControl("id"));

            update_badge("Transactions", "TransactionID", id.Text);
        }

        protected void refunds_view(object sender, EventArgs e)
        {
            DataListItem dlst = (sender as LinkButton).NamingContainer as DataListItem;
            Label id = ((Label)dlst.FindControl("id"));

            update_badge("Refunds", "ID", id.Text);
        }

        protected void notify_view(object sender, EventArgs e)
        {
            DataListItem dlst = (sender as LinkButton).NamingContainer as DataListItem;
            Label id = ((Label)dlst.FindControl("id"));

            update_badge("Notifications", "ID", id.Text);
        }

        protected void file_download(string table, string binary_column, string binary_name, string condition_column, string id)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = " SELECT * FROM " + table + " WHERE " + condition_column + "=" + id + " ";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            byte[] bytes;
            string filename;

            read.Read();
            bytes = (byte[])read[binary_column];
            filename = read[binary_name].ToString();
            read.Close();

            Response.Clear();
            Response.Buffer = true;
            Response.Charset = " ";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();

            con.Close();
        }

        protected void zip_download(string table, string binary_name, string condition_column, string id)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();

            string select = " SELECT * FROM " + table + " WHERE " + condition_column + "=" + id + " ", path = String.Empty;
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader read = cmd.ExecuteReader();

            while(read.Read())
            {
               path = read[binary_name].ToString();
            }

            if (File.Exists(Server.MapPath(path)))
            {
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(path));
                Response.WriteFile(Server.MapPath(path));
                Response.End();
            }

            else
            {
                //Response.Write("<script>alert('Project with OrderID '" + ID.Value + "' doesn't have any project file...')</script>");
                warning.Style["background-color"] = "orangered";
                warning.Style["color"] = "white";
                warnText.InnerHtml = "Project with OrderID '" + id + "' doesn't have any project file...";
            }
                  
            con.Close();
        }

        protected void A1_Click(object sender, EventArgs e)
        {
            file_download("Orders", "Attachment1", "Apath1", "OrderID", ID.Value);
        }

        protected void A2_Click(object sender, EventArgs e)
        {
            file_download("Orders", "Attachment2", "Apath2", "OrderID", ID.Value);
        }

        protected void A3_Click(object sender, EventArgs e)
        {
            file_download("Orders", "Attachment3", "Apath3", "OrderID", ID.Value);
        }

        protected void zipfile_Click(object sender, EventArgs e)
        {
            zip_download("Orders", "ZipFilePath", "OrderID", ID.Value);
        }

        protected void rev_o_zipfile_Click(object sender, EventArgs e)
        {
            file_download("Revisions", "ZipFilePath", "ZipFileName", "OrderID", rev_o_ID.Value);
        }

        protected void rev_o_A1_Click(object sender, EventArgs e)
        {
            file_download("Revisions", "Attachment1", "Apath1", "OrderID", rev_o_ID.Value);
        }

        protected void rev_o_A2_Click(object sender, EventArgs e)
        {
            file_download("Revisions", "Attachment2", "Apath2", "OrderID", rev_o_ID.Value);
        }

        protected void rev_o_A3_Click(object sender, EventArgs e)
        {
            file_download("Revisions", "Attachment3", "Apath3", "OrderID", rev_o_ID.Value);
        }
    }
}