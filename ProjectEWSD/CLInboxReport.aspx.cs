﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectEWSD
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info = True; User ID = sa; password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {
            String email = Session["email"].ToString();
            LoadReport(email);
        }

        public void LoadReport(String email)
        {
            DataTable tb = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ShowReportByEmail", con);
                cmd.Parameters.AddWithValue("@email", email);
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
            if (e.CommandName == "viewInboxPR")
            {
                String lbID = ((Label)(e.Item.FindControl("lbID"))).Text;
                String lbFrom = ((Label)(e.Item.FindControl("lblFrom"))).Text;

                Session["IdRPEmail"] = lbID.ToString();
                Session["IdEmail"] = lbFrom.ToString();
                Response.Redirect("CLViewInboxRP.aspx");
            }
        }

    }
}