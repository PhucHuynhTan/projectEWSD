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
    public partial class WebForm18 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info = True; User ID = sa; password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadMesseage();
        }

        public void LoadMesseage()
        {
            DataTable tb = new DataTable();
            SqlDataAdapter dpb = new SqlDataAdapter();
            String status = "Public";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ShowMesseagePublic", con);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.CommandType = CommandType.StoredProcedure;
                dpb = new SqlDataAdapter(cmd);
                dpb.Fill(tb);
                dtCMR.DataSource = tb;
                dtCMR.DataBind();
                con.Close();
            }
            catch { }
        }

        protected void dtCMR_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "viewCMR")
            {
                String lbID = ((Label)(e.Item.FindControl("lbCmrKey"))).Text;
                Session["CmrKey"] = lbID.ToString();
            }
        }
    }
}