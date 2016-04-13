using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectEWSD
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info = True; User ID = sa; password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {
            
                txtTitle.Text = null;
                txtContent.Text = null;
                int Id = int.Parse(Session["IdRPEmail"].ToString());
                LoadData(Id);
        }

        public void LoadData(int id)
        {
            SqlDataAdapter dap = new SqlDataAdapter();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ShowReportByNumberID", con);
                cmd.Parameters.AddWithValue("@number", id);
                cmd.CommandType = CommandType.StoredProcedure;
                dap = new SqlDataAdapter(cmd);
                DataSet dts = new DataSet();
                dap.Fill(dts);
                txtTitle.Text = dts.Tables[0].Rows[0][1].ToString();
                typeRP.SelectedValue = dts.Tables[0].Rows[0][2].ToString();
                txtContent.Text = dts.Tables[0].Rows[0][3].ToString();
                con.Close();
            }
            catch { }
        }

        protected void btAccept_Click(object sender, EventArgs e)
        {
            try
            {
                String pos = Session["pos"].ToString();
                if (pos.Equals("CM"))
                {
                    String status = "Wait DLT";
                    UpdateRP(status, txtEmailSend.Text);
                    String emailTo = "kienntgc60317@fpt.edu.vn";
                    String emailFrom = "kienhdtgc60251@fpt.edu.vn";
                    String pass = "kienhdtgc602511993";
                    sendEmailCM(emailTo, emailFrom, pass);
                    Response.Redirect("CLInboxReport.aspx");
                }
            }
            catch { }
        }

        private void sendEmailCM(String emailTo, String emailFrom, String pass)
        {
            DateTime dt;
            dt = DateTime.Today;
            String date = dt.ToShortDateString();
            SmtpClient SmtpServer = new SmtpClient();
            SmtpServer.Credentials = new System.Net.NetworkCredential(emailFrom, pass);
            SmtpServer.Port = 587;
            SmtpServer.Host = "smtp.gmail.com";
            SmtpServer.EnableSsl = true;
            MailMessage mail = new MailMessage();
            String[] addr = emailTo.Split(',');
            try
            {
                mail.From = new MailAddress(emailFrom,
                "CMR -"+typeRP.SelectedItem.Text+"", System.Text.Encoding.UTF8);
                Byte i;
                for (i = 0; i < addr.Length; i++)
                    mail.To.Add(addr[i]);
                mail.Subject = txtTitle.Text;
                mail.Body = "Title : " + txtTitle.Text +"\nType of Report : "+typeRP.SelectedItem.Text +"\n Date : " + date 
                    +"\nComment : "+txtComment.Text+ "\n Detail : http://localhost:50622/Login";
                mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                mail.ReplyTo = new MailAddress(emailTo);
                SmtpServer.Send(mail);
            }
            catch { }
        }

        public void UpdateRP(String status, String email) 
        {
            DateTime dt;
            dt = DateTime.Today;
            int id = int.Parse(Session["IdRPEmail"].ToString());
            try 
            {
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand("UpdateRP", con);
                    cmd1.Parameters.AddWithValue("@title", txtTitle.Text);
                    cmd1.Parameters.AddWithValue("@typeRP", typeRP.SelectedValue);
                    cmd1.Parameters.AddWithValue("@content", txtContent.Text);
                    cmd1.Parameters.AddWithValue("@date", dt.ToShortDateString());
                    cmd1.Parameters.AddWithValue("@status", status);
                    cmd1.Parameters.AddWithValue("@email", email);
                    cmd1.Parameters.AddWithValue("@id", id);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.ExecuteNonQuery();
            }
            catch 
            {
            
            }
            con.Close();
        }

        public void DeleteRP(int number)
        {
            try 
            {
                con.Open();
                SqlCommand cmd2 = new SqlCommand("deleteRP", con);
                cmd2.Parameters.AddWithValue("@number",number);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.ExecuteNonQuery();
            }
            catch { }
            con.Close();
        }

        protected void btNonAccept_Click(object sender, EventArgs e)
        {

            int id = int.Parse(Session["IdRPEmail"].ToString());
            try
            {
                String pos = Session["pos"].ToString();
                String username = Session["user"].ToString();
                if (pos.Equals("CM"))
                {
                    String status = "Non-Accept";
                    String email = Session["IdEmail"].ToString();
                    UpdateRP(status, email);
                    String emailTo = "tungldgc60294@fpt.edu.vn";
                    String emailFrom = "kienhdtgc60251@fpt.edu.vn";
                    String pass = "kienhdtgc602511993";
                    sendEmailCM(emailTo,emailFrom,pass);
                    Response.Redirect("CLInboxReport.aspx");
                }
                else if (pos.Equals("CL")) 
                {
                    DeleteRP(id);
                    Response.Redirect("CLInboxReport.aspx");
                }
            }
            catch { }
        }

        protected void btCancel_Click(object sender, EventArgs e)
        {
            try 
            {
                Response.Redirect("CLInboxReport.aspx");
            }
            catch { }
        }
    }
}