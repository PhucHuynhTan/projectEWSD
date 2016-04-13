using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectEWSD
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info = True; User ID = sa; password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {
            int Id = int.Parse(Session["IdRP"].ToString());
            LoadData(Id);
        }

        public void LoadData(int id) 
        {
            try 
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ShowReportByNumberID",con);
                cmd.Parameters.AddWithValue("@number", id);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    txtTitle.Text = reader[1].ToString();
                    typeRP.SelectedValue = reader[2].ToString();
                    txtContent.Text = reader[3].ToString();
                    txtTo.Text = reader[6].ToString();
                }
                reader.Close();
                con.Close();
            }
            catch { }
        }

        protected void btBack_Click(object sender, EventArgs e)
        {
            try 
            {
                Response.Redirect("CLSentReportBox.aspx");
            }
            catch { }
        }

    }
}