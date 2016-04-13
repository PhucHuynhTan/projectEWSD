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
    public partial class GuestExceptionReports : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("server=DESKTOP-HBNKLS5\\SQLEXPRESS;Initial Catalog=EWSD;Persist Security Info=True;User ID=sa; password=123456");

        protected void Page_Load(object sender, EventArgs e)
        {
            Loadreportpublic();
        }
        public void Loadreportpublic()
        {
            SqlDataAdapter dap = new SqlDataAdapter();
            DataTable tb2 = new DataTable();

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Report WHERE StatusRP = 'Public' and TypeRP='Exception'", con);
                dap = new SqlDataAdapter(cmd);
                dap.Fill(tb2);
                dlM.DataSource = tb2;
                dlM.DataBind();
                con.Close();
            }
            catch { }
        }
    }
}