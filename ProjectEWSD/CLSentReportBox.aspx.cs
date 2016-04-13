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
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info = True; User ID = sa; password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {
            String user = Session["user"].ToString();
            LoadReport(user);
        }

        public void LoadReport(String username)
        {
            DataTable tb = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ShowReportByID", con);
                cmd.Parameters.AddWithValue("@id", username);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                sda.Fill(tb);
                dlRP.DataSource = tb;
                dlRP.DataBind();
            }
            catch
            {

            }
            con.Close();
        }

        protected void dlRP_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "viewSentRP")
            {
                String lbID = ((Label)(e.Item.FindControl("lbID"))).Text;
                Session["IdRP"] = lbID.ToString();
                Response.Redirect("ClViewRP.aspx");
            }
        }
    }


}