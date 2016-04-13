using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectEWSD
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info=True;User ID=sa; password=123456");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {
            String user = txtUsername.Text;
            String pass = txtPass.Text;
            try
            {
                if (LoginAdmin(user, pass) == true)
                {
                    Session["user"] = txtUsername.Text;
                    Response.Redirect("AdminHomePage.aspx");
                }

                else
                {
                    String position = "Guest";
                    String position1 = "CL";
                    String position2 = "CM";
                    String position3 = "PVC";
                    String position4 = "DLT";
                    if (LoginAll(user, position) == true)
                    {
                        Session["user"] = txtUsername.Text;
                        Response.Redirect("GuestHomePage.aspx");
                    }
                    else if (LoginAll(user, position1) == true)
                    {
                        Session["user"] = txtUsername.Text;
                        Session["pos"] = position1;
                        Response.Redirect("CLHomePage.aspx");
                    }
                    else if (LoginAll(user, position2) == true)
                    {
                        Session["user"] = txtUsername.Text;
                        Session["pos"] = position2;
                        Response.Redirect("CLHomePage.aspx");
                    }
                    else if(LoginAll(user, position3) == true)
                    {
                        Session["user"] = txtUsername.Text;
                        Session["pos"] = position3;
                        Response.Redirect("PVCPage.aspx");
                    }
                    else if (LoginAll(user, position4) == true)
                    {
                        Session["user"] = txtUsername.Text;
                        Session["pos"] = position4;
                        Response.Redirect("DLTPage.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Username and Password')</script>");
                        txtUsername.Focus();
                    }
                }
            }
            catch
            {

            }

        }

        public Boolean LoginAdmin(String user, String pass)
        {
            Boolean s = false;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Manager where ID = @username and Pass = @password", con);
                cmd.Parameters.AddWithValue("@username", user);
                cmd.Parameters.AddWithValue("@password", pass);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    s = true;
                }
                else
                {
                    s = false;
                }
                con.Close();
            }
            catch
            {
                s = false;
            }
            return s;
        }

        public Boolean LoginAll(String user, String position)
        {
            MD5 md5Hash = MD5.Create();
            Boolean s = false;
            try
            {
                con.Open();
                String password = GetMd5Hash(md5Hash, txtPass.Text);
                SqlCommand cmd = new SqlCommand("checkLoginAll", con);
                cmd.Parameters.AddWithValue("@id ", user);
                cmd.Parameters.AddWithValue("@pass", password);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable tb = new DataTable();
                da.Fill(tb);
                if (tb.Rows.Count > 0)
                {
                    SqlCommand cmd1 = new SqlCommand("select * from Employee where ID = @id AND Position = @position", con);
                    cmd1.Parameters.AddWithValue("@id", user);
                    cmd1.Parameters.AddWithValue("@position", position);
                    da = new SqlDataAdapter(cmd1);
                    DataTable tb1 = new DataTable();
                    da.Fill(tb1);
                    if (tb1.Rows.Count > 0)
                    {
                        Session["email"] = tb1.Rows[0]["Email"].ToString();
                        s = true;
                    }
                    else
                    {
                        s = false;
                    }
                }   
                else
                {
                    s = false;
                }
                
                con.Close();
            }
            catch
            {
                s = false;
            }
            return s;
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

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("GuestHomePage.aspx");
        }
    }
}