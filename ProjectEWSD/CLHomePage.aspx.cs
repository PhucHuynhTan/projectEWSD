using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectEWSD
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info=True;User ID=sa; password=123456");

        protected void Page_Load(object sender, EventArgs e)
        {
            String pos = Session["pos"].ToString();
            BlockRP();
            if (pos.Equals("CL"))
            {
                Loadreportdeadline();
            }
            else if (pos.Equals("CM"))
            {
                LoadreportdeadlineCM();
            }
            Loadreportnew();
        }

        public void Loadreportdeadline()
        {
            SqlDataAdapter dap = new SqlDataAdapter();
            DataTable tb = new DataTable();
            DataTable tb1 = new DataTable();
            String user = Session["user"].ToString();
            try
            {
                DateTime today = DateTime.Now;
                con.Open();
                SqlCommand cmd1 = new SqlCommand("Select * from Report where IDWrite = @user", con);
                cmd1.Parameters.AddWithValue("@user", user);
                cmd1.CommandType = CommandType.Text;
                dap = new SqlDataAdapter(cmd1);
                dap.Fill(tb1);
                if (tb1.Rows.Count > 0)
                {
                    DateTime nearday1 = today.AddDays(-14);
                    DateTime nearday2 = today.AddDays(-9);
                    String date1 = nearday1.ToString("yyyy-MM-dd");
                    String date2 = nearday2.ToString("yyyy-MM-dd");
                    SqlCommand cmd2 = new SqlCommand("Select * from Report where DateRP between '" + date1 + "' and '" + date2 + "'", con);
                    cmd2.CommandType = CommandType.Text;
                    dap = new SqlDataAdapter(cmd2);
                    dap.Fill(tb);
                    dlM.DataSource = tb;
                    dlM.DataBind();
                }
                con.Close();
            }
            catch { }

        }

        private void BlockRP()
        {
            SqlDataAdapter dap = new SqlDataAdapter();
            DataTable tb = new DataTable();
            DataTable tb1 = new DataTable();
            String user = Session["user"].ToString();
            String email = Session["email"].ToString();
            try
            {
                DateTime today = DateTime.Now;
                con.Open();
                DateTime nearday1 = today.AddDays(-30);
                DateTime nearday2 = today.AddDays(-15);
                String date1 = nearday1.ToString("yyyy-MM-dd");
                String date2 = nearday2.ToString("yyyy-MM-dd");
                SqlCommand cmd3 = new SqlCommand("Update Report SET StatusRP = 'Overdue', UserEmail = @email WHERE IDWrite = @user AND DateRP between '" + date1 + "' and '" + date2 + "'", con);
                cmd3.Parameters.AddWithValue("@email", email);
                cmd3.Parameters.AddWithValue("@user", user);
                cmd3.CommandType = CommandType.Text;
                cmd3.ExecuteNonQuery();
                con.Close();
            }
            catch { }
        }

        public void LoadreportdeadlineCM()
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
        protected void readmore_Click(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void dlM_ItemCommand(object source, DataListCommandEventArgs e)
        {
            String pos = Session["pos"].ToString();
            if (e.CommandName == "readmore")
            {
                if (pos.Equals("CL"))
                {
                    Response.Redirect("CLSentReportBox.aspx");
                }
                else if (pos.Equals("CM"))
                {
                    String lbNumberID = ((Label)(e.Item.FindControl("lbID"))).Text;
                    Session["IdRPEmail"] = lbNumberID.ToString();
                    Response.Redirect("CLViewInboxRP.aspx");
                }
            }
        }

    }
}