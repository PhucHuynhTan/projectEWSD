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
    public partial class WebForm10 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info = True; User ID = sa; password=123456");

        protected void Page_Load(object sender, EventArgs e)
        {
                loadNameCM();
                loadFacultie();
                loadSpecialize();
                loadNameTeacher();
        }

        protected void btcreate_Click(object sender, EventArgs e)
        {
            try {
                CreateSchedule();
                CreateCourse();
                CreateCMRtable();
                sendEmailCM();
                Response.Write("<script>alert('Success')</sript>");
                Response.Redirect("CLSubjectBox.aspx");
            }
            catch { }
        }

        private void sendEmailCM() 
        {
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
                "CMR - Subject Reprot", System.Text.Encoding.UTF8);
                Byte i;
                for (i = 0; i < addr.Length; i++)
                    mail.To.Add(addr[i]);
                mail.Subject = txtCMRkey.Text;
                mail.Body = "CMR Key : " + txtCMRkey.Text+"\n Date : "+txtdatestart.Text+"-"+txtdateend.Text 
                    + "\n Detail : http://localhost:50622/Login";
                mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                mail.ReplyTo = new MailAddress(emailTo);
                SmtpServer.Send(mail);
            }
            catch { }
        }

        private void CreateSchedule() 
        {
            try {
                con.Open();
                SqlCommand cmd = new SqlCommand("InsertSchedule",con);
                cmd.Parameters.AddWithValue("@scheID", txtCMRkey.Text);
                cmd.Parameters.AddWithValue("@factulie",ddFacultieID.SelectedValue);
                cmd.Parameters.AddWithValue("@specID",ddSpecID.SelectedValue);
                cmd.Parameters.AddWithValue("@teachID", ddTeachID.SelectedValue);
                cmd.Parameters.AddWithValue("@dateStart",txtdatestart.Text);
                cmd.Parameters.AddWithValue("@dateEnd", txtdateend.Text);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch { }
        }

        private void CreateCourse()
        {
            String username = Session["user"].ToString();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("InsertCourse", con);
                cmd.Parameters.AddWithValue("@cmrKey", txtCMRkey.Text);
                cmd.Parameters.AddWithValue("@IdCL", username);
                cmd.Parameters.AddWithValue("@scheID", txtCMRkey.Text);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch { }
        }

        private void CreateCMRtable() 
        {
            String dateToday = DateTime.Today.ToShortDateString();
            String status = "Wait CM";
            try 
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("InsertCMR", con);
                cmd.Parameters.AddWithValue("@cmrKey", txtCMRkey.Text);
                cmd.Parameters.AddWithValue("@idCheck",ddlSendTo.SelectedValue);
                cmd.Parameters.AddWithValue("@status",status);
                cmd.Parameters.AddWithValue("@date", dateToday);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch { }
        }


        public void loadSpecialize()
        {
            DataTable tb1 = new DataTable();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Specialize", con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter dpa = new SqlDataAdapter(cmd);
                dpa.Fill(tb1);
                ddSpecID.DataSource = tb1;
                ddSpecID.DataTextField = "SpecName";
                ddSpecID.DataValueField = "SpecID";
                ddSpecID.DataBind();
                con.Close();
            }
            catch {
            }
        }

        public void loadFacultie()
        {
           
            DataTable tb2 = new DataTable();
            try
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("Select * from Facultie", con);
                cmd1.ExecuteNonQuery();
                SqlDataAdapter dpa = new SqlDataAdapter(cmd1);
                dpa.Fill(tb2);
                ddFacultieID.DataSource = tb2;
                ddFacultieID.DataTextField = "FacultieName";
                ddFacultieID.DataValueField = "FacultieID";
                ddFacultieID.DataBind();
                con.Close();
            }
            catch {
            }

        }

        private void loadNameCM() 
        {
            DataTable tb = new DataTable();
            try
            {
                con.Open();
                SqlCommand cmd2 = new SqlCommand("Select * from Employee WHERE Position = 'CM'", con);
                cmd2.CommandType = CommandType.Text;
                cmd2.ExecuteNonQuery();
                SqlDataAdapter dpa = new SqlDataAdapter(cmd2);
                dpa.Fill(tb);
                ddlSendTo.DataSource = tb;
                ddlSendTo.DataTextField = "Email";
                ddlSendTo.DataValueField = "ID";
                ddlSendTo.DataBind();
                con.Close();
            }
            catch { }
        }

        public void loadNameTeacher()
        {
            DataTable tb3 = new DataTable();
            try
            {
                con.Open();
                SqlCommand cmd2 = new SqlCommand("Select * from Employee WHERE Position = 'Teacher'", con);
                cmd2.CommandType = CommandType.Text;
                cmd2.ExecuteNonQuery();
                SqlDataAdapter dpa = new SqlDataAdapter(cmd2);
                dpa.Fill(tb3);
                ddTeachID.DataSource = tb3;
                ddTeachID.DataTextField = "Fullname";
                ddTeachID.DataValueField = "ID";
                ddTeachID.DataBind();
                con.Close();
            }
            catch { }
        }
    }
}