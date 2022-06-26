using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace GO_IT
{
    public partial class GetImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string id = Request.QueryString["id"];

                string constring = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;//@"Data Source=DESKTOP-22TB9CF\SQLEXPRESS; Initial Catalog=GoIt; Integrated Security=True;";
                SqlConnection con = new SqlConnection(constring);
                string query = "SELECT image FROM Users WHERE imgid=@ProductiD";

                SqlCommand com = new SqlCommand(query, con);
                com.Parameters.Add("@ProductiD", SqlDbType.Int).Value = Int32.Parse(id);

                con.Open();
                SqlDataReader r = com.ExecuteReader();

                if (r.Read())
                {
                    byte[] imgData = (byte[])r["image"];
                    Response.BinaryWrite(imgData);
                }

                con.Close();
            }
            catch (Exception)
            {

              
            }
        }
    }
}