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
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info=True;User ID=sa; password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAcc();
        }

        public void Delete(String id)
        {
            try
            {

                SqlCommand cmd = new SqlCommand("deleteEmpByID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {

            }
        }

        public void LoadAcc() 
        {
            DataTable db = new DataTable();
            SqlDataAdapter dpa = new SqlDataAdapter();
            try 
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Employee",con);
                dpa = new SqlDataAdapter(cmd);
                dpa.Fill(db);
                GridView1.DataSource = db;
                GridView1.DataBind();
            }
            catch { }
        }

        protected void btSearchRoom_Click(object sender, EventArgs e)
        {

        }



        int stt = 1;
        public String get_stt() 
        {
            return Convert.ToString(stt++);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            int pageNumber = e.NewPageIndex;
            int pageLine = GridView1.PageSize;
            stt = pageNumber * pageLine + 1;
            LoadAcc();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String user = GridView1.DataKeys[e.RowIndex].Value.ToString();
            Delete(user);
            Page_Load(sender,e);
        }




    }
}