using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace ProjectEWSD
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info=True;User ID=sa; password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {
            String Id = Session["user"].ToString();
        }

        static string GetMd5Hash(MD5 md5Hash, string input)
        {
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }

        private Boolean checkOldPass()
        {
            Boolean s = false;
            MD5 md5Hash = MD5.Create();
            String pass = GetMd5Hash(md5Hash, OldPass.Text.ToString());
            String Id = Session["user"].ToString();
            try
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("Select * from Employee  where ID = @id", con);
                cmd1.Parameters.AddWithValue("@id", Id);
                cmd1.CommandType = CommandType.Text;
                SqlDataAdapter dap = new SqlDataAdapter(cmd1);
                DataTable tb = new DataTable();
                dap.Fill(tb);
                if (tb.Rows.Count > 0)
                {
                    String passOld = tb.Rows[0][1].ToString();
                    if (passOld.Equals(pass) == true)
                    {
                        s = true;
                    }

                    else
                    {
                        s = false;
                    }
                }
                con.Close();
            }
            catch { }
            return s;
        }

        public void UpdatePass()
        {
            MD5 md5Hash = MD5.Create();
            String pass = GetMd5Hash(md5Hash, Password.Text);
            String Id = Session["user"].ToString();
            try
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("Update Employee set Pass = @pass where ID='" + Id + "'", con);
                cmd1.Parameters.AddWithValue("@pass", pass);
                cmd1.CommandType = CommandType.Text;
                cmd1.ExecuteNonQuery();
            }
            catch
            { }
            con.Close();
        }

        protected void btChange_Click(object sender, EventArgs e)
        {
            if (checkOldPass() == false) 
            {
                Response.Write("<script>alert('Old password not true !')</script>");
            }
            else 
            {
                UpdatePass();
                Response.Write("<script>alert('Change Your Password Success !')</script>");
            }
            Page_Load(sender,e);
        }
    }
}