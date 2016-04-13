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
    public partial class DLTPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info=True;User ID=sa; password=123456");

        protected void Page_Load(object sender, EventArgs e)
        {
            String user = Session["user"].ToString();
            Loadreportdeadline();
            Loadreportnew();
        }

        public void Loadreportdeadline()
        {
            SqlDataAdapter dap = new SqlDataAdapter();
            DataTable tb = new DataTable();
            DataTable tb1 = new DataTable();
            DataTable tb2 = new DataTable();
            String user = Session["user"].ToString();
            try
            {
                DateTime today = DateTime.Now;
                con.Open();
                SqlCommand cmd1 = new SqlCommand("Select * from Employee where ID = @user", con);
                cmd1.Parameters.AddWithValue("@user", user);
                cmd1.CommandType = CommandType.Text;
                dap = new SqlDataAdapter(cmd1);
                dap.Fill(tb1);
                if (tb1.Rows.Count > 0)
                {
                    String email = tb1.Rows[0][3].ToString();
                    DateTime nearday1 = today.AddDays(-14);
                    DateTime nearday2 = today.AddDays(-9);
                    String date1 = nearday1.ToString("yyyy-MM-dd");
                    String date2 = nearday2.ToString("yyyy-MM-dd");
                    SqlCommand cmd2 = new SqlCommand("Select * from Report where DateRP between '" + date1 + "' and '" + date2 + "'", con);
                    cmd2.CommandType = CommandType.Text;
                    dap = new SqlDataAdapter(cmd2);
                    dap.Fill(tb);
                    if (tb.Rows.Count > 0)
                    {
                        SqlCommand cmd3 = new SqlCommand("Select * from Report WHERE UserEmail = @email", con);
                        cmd3.Parameters.AddWithValue("@email", email);
                        cmd3.CommandType = CommandType.Text;
                        dap = new SqlDataAdapter(cmd3);
                        dap.Fill(tb2);
                        dlM.DataSource = tb2;
                        dlM.DataBind();
                    }
                }
                con.Close();
            }
            catch { }

        }

        public void Loadreportnew()
        {
            SqlDataAdapter dap = new SqlDataAdapter();
            DataTable tb2 = new DataTable();

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select* from Report WHERE StatusRP = 'Public'", con);
                dap = new SqlDataAdapter(cmd);
                dap.Fill(tb2);
                DataList1.DataSource = tb2;
                DataList1.DataBind();
                con.Close();
            }
            catch { }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        private void loadEmail(String user) 
        {

            DataTable tb = new DataTable();
            try 
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Employee WHERE ID = @user",con);
                cmd.Parameters.AddWithValue("@user",user);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter dpa = new SqlDataAdapter(cmd);
                dpa.Fill(tb);
                if (tb.Rows.Count > 0) 
                {
                    Session["EmailFrom"] = tb.Rows[0][3].ToString();
                }
                con.Close();
            }
            catch { }
        }

        protected void dlM_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "readmore")
            {
                    String lbNumberID = ((Label)(e.Item.FindControl("lbID"))).Text;
                    String lbFrom = ((Label)(e.Item.FindControl("lbEmailFrom"))).Text;
                    Session["IdRPEmail"] = lbNumberID.ToString();
                    loadEmail(lbFrom);
                    Response.Redirect("DLTDetailReports.aspx");
            }
        }
    }
}