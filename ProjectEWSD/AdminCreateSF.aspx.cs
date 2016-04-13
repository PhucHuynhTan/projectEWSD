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
    public partial class WebForm17 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info = True; User ID = sa; password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            try
            {
                String dll = cmbFS.SelectedValue;
                if (dll.Equals("F")) 
                {
                    if (CheckFac(txtID.Text) == true) 
                    {
                        Response.Write("<script>alert('This Faculite is existing !')</script>");
                    }
                    else 
                    {
                        InsertFac(txtID.Text,txtName.Text);
                        Response.Write("<script>alert('Success !')</script>");
                    }
                }
                else if (dll.Equals("S")) 
                {
                    if (CheckSpec(txtID.Text) == true)
                    {
                        Response.Write("<script>alert('This Specialize is existing !')</script>");
                    }
                    else
                    {
                        InsertSpec(txtID.Text, txtName.Text);
                        Response.Write("<script>alert('Success !')</script>");
                    }
                }
            }
            catch
            {

            }
        }

        private void InsertFac(String id, String name) 
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Facultie values(@id,@name)", con);
                cmd.Parameters.AddWithValue("@id",id);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch { }
        }

        private void InsertSpec(String id, String name)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Specialize values(@id,@name)", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch { }
        }

        private Boolean CheckSpec(String id) 
        {
            Boolean s = false;
            DataTable tb = new DataTable();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Specialize WHERE SpecID = @id",con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter dpa = new SqlDataAdapter(cmd);
                dpa.Fill(tb);
                if (tb.Rows.Count > 0) {
                    s = true;
                }
                con.Close();
            }
            catch { }
            return s;
        }

        private Boolean CheckFac(String id)
        {
            Boolean s = false;
            DataTable tb = new DataTable();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Facultie WHERE FacultieID = @id", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter dpa = new SqlDataAdapter(cmd);
                dpa.Fill(tb);
                if (tb.Rows.Count > 0)
                {
                    s = true;
                }
                con.Close();
            }
            catch { }
            return s;
        }
    }
}