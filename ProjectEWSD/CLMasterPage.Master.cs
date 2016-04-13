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
    public partial class CLMasterPage : System.Web.UI.MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
                String user = Session["user"].ToString();
                String position = Session["pos"].ToString();
                lbUser.Text = user;
                lbUser1.Text = user;
                lbPos.Text = position;
        }

    }
}