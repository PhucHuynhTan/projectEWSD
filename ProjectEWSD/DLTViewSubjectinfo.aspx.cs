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
    public partial class WebForm14 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Initial Catalog=EWSD;Persist Security Info = True; User ID = sa; password=123456");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            String cmrKey = Session["CmrKey"].ToString();
            loadCMRKey(cmrKey);

            String fac = Session["facultie"].ToString();
            loadFaculite(fac);

            String spec = Session["specia"].ToString();
            loadSpec(spec);

            String username = Session["usernameID"].ToString();
            loadNameEmp(username);
        }



        private void loadCMRKey(String cmrkey)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ShowSubjectInfo", con);
                cmd.Parameters.AddWithValue("@cmrKey", cmrkey);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    txtCMRkey.Text = reader[6].ToString();
                    txtStartdate.Text = reader[4].ToString();
                    txtFinishdate.Text = reader[5].ToString();

                    String facultie = reader[1].ToString();
                    Session["facultie"] = facultie.ToString();

                    String specia = reader[2].ToString();
                    Session["specia"] = specia.ToString();

                    String usernameID = reader[3].ToString();
                    Session["usernameID"] = usernameID.ToString();

                    txtStatus.Text = reader[15].ToString();
                }
                reader.Close();
                con.Close();
            }
            catch { }
        }

        private void loadFaculite(String id)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Facultie WHERE FacultieID = @id", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.CommandType = CommandType.Text;
                SqlDataReader readerFac = cmd.ExecuteReader();
                while (readerFac.Read())
                {
                    txtFacultie.Text = readerFac[1].ToString();
                }
                con.Close();
            }
            catch { }
        }

        private void loadSpec(String id)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Specialize WHERE SpecID = @id", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.CommandType = CommandType.Text;
                SqlDataReader readerFac = cmd.ExecuteReader();
                while (readerFac.Read())
                {
                    txtSpecialize.Text = readerFac[1].ToString();
                }
                con.Close();
            }
            catch { }
        }

        private void loadNameEmp(String id)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Employee WHERE ID = @id", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.CommandType = CommandType.Text;
                SqlDataReader readerFac = cmd.ExecuteReader();
                while (readerFac.Read())
                {
                    txtLecturesr.Text = readerFac[2].ToString();
                }
                con.Close();
            }
            catch { }
        }

        private void sendEmail(String to, String from, String pass, String comment)
        {
            SmtpClient SmtpServer = new SmtpClient();
            SmtpServer.Credentials = new System.Net.NetworkCredential(from, pass);
            SmtpServer.Port = 587;
            SmtpServer.Host = "smtp.gmail.com";
            SmtpServer.EnableSsl = true;
            MailMessage mail = new MailMessage();
            String[] addr = to.Split(',');
            try
            {
                mail.From = new MailAddress(from,
                "CMR - Subject Reprot", System.Text.Encoding.UTF8);
                Byte i;
                for (i = 0; i < addr.Length; i++)
                    mail.To.Add(addr[i]);
                mail.Subject = txtCMRkey.Text;
                mail.Body = "CMR Key : " + txtCMRkey.Text + "\n Date : " + txtStartdate.Text + "-" + txtFinishdate.Text
                    + "\n Detail : http://localhost:50622/Login" + "\nComment :" + txtComment.Text;
                mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                mail.ReplyTo = new MailAddress(to);
                SmtpServer.Send(mail);
            }
            catch { }
        }

        private void UpdateCMR(String cmrkey, Boolean CkCm, String userCk, String status)
        {
            String date = DateTime.Today.ToShortDateString();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UpdateCMRtable", con);
                cmd.Parameters.AddWithValue("@cmrkey", cmrkey);
                cmd.Parameters.AddWithValue("@ckCM", true);
                cmd.Parameters.AddWithValue("@ckDLT", CkCm);
                cmd.Parameters.AddWithValue("@ckPVC", false);
                cmd.Parameters.AddWithValue("@idEmpCk", userCk);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@date", date);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
            }
            catch { }
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            try {
                loadUserByEmail(txtSendto.Text);
                String idDLT = Session["UserByEmail"].ToString();

                String status = "Wait PVC";
                UpdateCMR(txtCMRkey.Text, true, idDLT, status);

                String emailTo = "phuchtgc60244@fpt.edu.vn";
                String emailFrom = "kienntgc60317@fpt.edu.vn";
                String pass = "Abc123!@#";
                sendEmail(emailTo, emailFrom, pass, "No");
                Response.Redirect("DLTSubjectBox.aspx");
            }
            catch { }
        }

        protected void btnRecheck_Click(object sender, EventArgs e)
        {
            try 
            {
                String cmrKey = Session["CmrKey"].ToString();
                loadUserByCMR(cmrKey);
                String idCL = Session["UserByCMR"].ToString();

                String status = "Non-Accept";
                UpdateCMR(txtCMRkey.Text, false, idCL, status);


                String emailTo = "tungldgc60294@fpt.edu.vn";
                String emailFrom = "kienntgc60317@fpt.edu.vn";
                String pass = "Abc123!@#";
                sendEmail(emailTo, emailFrom, pass, txtComment.Text);
                Response.Redirect("DLTSubjectBox.aspx");
            }
            catch { }

        }

        private void loadUserByCMR(String cmr)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from CourseCode WHERE CMRKey = @cmr", con);
                cmd.Parameters.AddWithValue("@cmr", cmr);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Session["UserByCMR"] = reader[1].ToString();
                }
                con.Close();
            }
            catch { }
        }

        private void loadUserByEmail(String email)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Employee WHERE Email = @email", con);
                cmd.Parameters.AddWithValue("@email", email);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Session["UserByEmail"] = reader[0].ToString();
                }
                con.Close();
            }
            catch { }
        }

    }
}