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
    public partial class ViewDetailExceptionReports : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info=True;User ID=sa; password=123456");

        protected void Page_Load(object sender, EventArgs e)
        {
            int Id = int.Parse(Session["IdRPEmail"].ToString());
            LoadData(Id);
            txtemal.Text = Session["EmailFrom"].ToString();
        }

        public void LoadData(int id)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ShowReportByNumberID", con);
                cmd.Parameters.AddWithValue("@number", id);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    txtTitle.Text = reader[1].ToString();
                    txtDate.Text = reader[4].ToString();
                    txtContent.Text = reader[3].ToString();
                }
                reader.Close();
                con.Close();
            }
            catch { }
        }

        public void UpdateRP(String status, String email)
        {
            int Id = int.Parse(Session["IdRPEmail"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("Update Report set StatusRP='" + status + "', UserEmail = '" + email + "' where NumberID='" + Id + "'", con);
                cmd1.ExecuteNonQuery();
            }
            catch
            { }
            con.Close();
        }
        protected void btCancel_Click(object sender, EventArgs e)
        {
            String type = Session["TypeRP"].ToString();
            if (type.Equals("Static Report"))
            {
                Response.Redirect("PVCStaticReports.aspx");
            }
            else if (type.Equals("Exception Report"))
            {
                Response.Redirect("PVCExceptionReports.aspx");
            }
        }

        private void sendEmailCM(String emailTo, String emailFrom, String pass, String status)
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
                "CMR -" + txtTitle.Text + "", System.Text.Encoding.UTF8);
                Byte i;
                for (i = 0; i < addr.Length; i++)
                    mail.To.Add(addr[i]);
                mail.Subject = txtTitle.Text;
                mail.Body = "Title : " + txtTitle.Text + "\nStatus : " + status + "\n Date : " + date
                    + "\nComment : " + txtComment.Text + "\n Detail : http://localhost:50622/Login";
                mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                mail.ReplyTo = new MailAddress(emailTo);
                SmtpServer.Send(mail);
            }
            catch { }
        }
      

        protected void btCheck_Click(object sender, EventArgs e)
        {
            String status = "Public";
            UpdateRP(status, txtemal.Text);
            String emailTo = "tungldgc60294@fpt.edu.vn";
            String emailFrom = "phuchtgc60244@fpt.edu.vn";
            String pass = "huynhtanphuc";
            sendEmailCM(emailTo,emailFrom,pass,status);
            String type = Session["TypeRP"].ToString();
            if (type.Equals("Static Report"))
            {
                Response.Redirect("PVCStaticReports.aspx");
            }
            else if (type.Equals("Exception Report")) 
            {
                Response.Redirect("PVCExceptionReports.aspx");
            }
        }

        protected void btRechec_Click(object sender, EventArgs e)
        {
            String status = "Non-Accept";
            UpdateRP(status,txtemal.Text);
            String emailTo = "tungldgc60294@fpt.edu.vn";
            String emailFrom = "phuchtgc60244@fpt.edu.vn";
            String pass = "huynhtanphuc";
            sendEmailCM(emailTo, emailFrom, pass, status);
            String type = Session["TypeRP"].ToString();
            if (type.Equals("Static Report"))
            {
                Response.Redirect("PVCStaticReports.aspx");
            }
            else if (type.Equals("Exception Report"))
            {
                Response.Redirect("PVCExceptionReports.aspx");
            }
        }
    }
}