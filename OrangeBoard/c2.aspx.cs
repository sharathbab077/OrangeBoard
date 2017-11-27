using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;

namespace OrangeBoard
{
    public partial class c2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/course2/") + e.CommandArgument);
                Response.End();
            }
        }
        protected void c2uploadbtn(object sender, EventArgs e)
        {
            if (FileUpload2.HasFile)
            {
                FileUpload2.PostedFile.SaveAs(Server.MapPath("~/course2/") + FileUpload2.FileName);
            }

            DataTable dt = new DataTable();
            dt.Columns.Add("File", typeof(string));
            dt.Columns.Add("Size", typeof(string));
            dt.Columns.Add("Type", typeof(string));
            foreach (string filename in Directory.GetFiles(Server.MapPath("~/course2")))
            {
                FileInfo fi = new FileInfo(filename);
                dt.Rows.Add(fi.Name, fi.Length, fi.Extension);

            }
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public class coursetwoerecpients
        {
            public int id { get; set; }
            public string name { get; set; }
            public string email { get; set; }
        }

        protected void linkbuttonclick(object sender, EventArgs e)
        {
            Response.Redirect("c1.aspx");
        }

        protected void notifybtnc2_Click(object sender, EventArgs e)
        {



            SqlDataReader rdr = null;

            // create a connection object
            SqlConnection conn = new SqlConnection("Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename = F:\\3sem\\senew\\OrangeBoard\\OrangeBoard\\App_Data\\email.mdf; Integrated Security = True");

            // create a command object
            SqlCommand cmd = new SqlCommand("SELECT name,emailid from dbo.student", conn);

            try
            {
                // open the connection
                conn.Open();

                // get an instance of the SqlDataReader
                rdr = cmd.ExecuteReader();

                var emails = new List<coursetwoerecpients>();
                while (rdr.Read())
                {

                    emails.Add(new coursetwoerecpients
                    {

                        name = rdr["name"].ToString(),
                        email = rdr["emailid"].ToString(),


                    });
                }

                foreach (coursetwoerecpients email in emails)
                {
                    const string username = "";
                    const string password = "";
                    SmtpClient smtpClient = new SmtpClient();
                    MailMessage mail = new MailMessage();
                    MailAddress fromaddress = new MailAddress("s.sachin2911@gmail.com", "Sachin S");
                    smtpClient.Host = "smtp.gmail.com";
                    smtpClient.Port = 587;
                    mail.From = fromaddress;
                    mail.To.Add(email.email);
                    mail.Subject = ("Course Two");
                    mail.IsBodyHtml = false;
                    string notifytext = c2txtarea.Text;
                    mail.Body = notifytext;
                    smtpClient.EnableSsl = true;
                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtpClient.Credentials = new System.Net.NetworkCredential(username, password);
                    smtpClient.Send(mail);
                }

            }

            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }

                // close the connection
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }



    }

  
}
  