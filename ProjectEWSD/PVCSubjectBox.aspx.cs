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
    public partial class WebForm12 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info = True; User ID = sa; password=123456");

        protected void Page_Load(object sender, EventArgs e)
        {
            String user = Session["user"].ToString();
            LoadSubjectCheck(user);
        }

        public void LoadSubjectCheck(String user)
        {
            DataTable tb = new DataTable();
            SqlDataAdapter dpb = new SqlDataAdapter();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ShowSubjectCheck", con);
                cmd.Parameters.AddWithValue("@user", user);
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
                Response.Redirect("PVCViewSubjectinfo.aspx");
            }
        }
    }
}