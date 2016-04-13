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
    public partial class WebForm6 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info = True; User ID = sa; password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSendRP_Click(object sender, EventArgs e)
        {
            insertRP();
            sendEmailCM();
            Response.Redirect("CLSentReportBox.aspx");
        }

        private void insertRP() 
        {
            try 
            {
                DateTime dt;
                dt = DateTime.Today;
                String username = Session["user"].ToString();
                String title = txtTitle.Text;
                String status = "Wait CM";
                String date = dt.ToShortDateString();
                String type = typeRP.SelectedValue;
                String content = txtContent.Text;
                String email = txtToEmail.Text;
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("InsertRP", con);
                    cmd.Parameters.AddWithValue("@title", title);
                    cmd.Parameters.AddWithValue("@typeRP", type);
                    cmd.Parameters.AddWithValue("@content", content);
                    cmd.Parameters.AddWithValue("@date", date);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@user", username);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Success')</script>");
                }
                catch { }
            }
            catch { }
        }

        private void sendEmailCM()
        {
            DateTime dt;
            dt = DateTime.Today;
            String date = dt.ToShortDateString();
            String emailTo = "kienhdtgc60251@fpt.edu.vn";
            SmtpClient SmtpServer = new SmtpClient();
            SmtpServer.Credentials = new System.Net.NetworkCredential("tungldgc60294@fpt.edu.vn", "euroskies");
            SmtpServer.Port = 587;
            SmtpServer.Host = "smtp.gmail.com";
            SmtpServer.EnableSsl = true;
            MailMessage mail = new MailMessage();
            String[] addr = emailTo.Split(',');
            try
            {
                mail.From = new MailAddress("tungldgc60294@fpt.edu.vn",
                "CMR - "+typeRP.SelectedItem.Text+"", System.Text.Encoding.UTF8);
                Byte i;
                for (i = 0; i < addr.Length; i++)
                    mail.To.Add(addr[i]);
                mail.Subject = txtTitle.Text;
                mail.Body = "Title : " + txtTitle.Text +"\nType of Report : "+ typeRP.SelectedItem.Text +"\n Date : " + date 
                    + "\n Detail : http://localhost:50622/Login";
                mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                mail.ReplyTo = new MailAddress(emailTo);
                SmtpServer.Send(mail);
            }
            catch { }
        }
    }
}