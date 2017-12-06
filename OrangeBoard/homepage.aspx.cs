using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;
using System.Data;
//using Clockwork;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.Net;

namespace OrangeBoard
{
    public partial class homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["suidValue"]= txtboxsuid.Text;


            SqlConnection con = new SqlConnection();
            con.ConnectionString= @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "F:\\3sem\\mehal125\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
           // con.ConnectionString = @"" + "C:\\Users\\Mehal K Chaudhari\\Source\\Repos\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select StudentId from dbo.Student", con);
            SqlDataAdapter da2 = new SqlDataAdapter("select InstructorId from dbo.Instructor", con);
            DataSet ds = new DataSet();
            DataSet ds2 = new DataSet();
            da.Fill(ds, "dbo.Student");
            da2.Fill(ds2, "dbo.Instructor");
            List<string> studentId = new List<string>();
            List<string> instructorid = new List<string>();
            foreach (DataRow row in ds.Tables["dbo.Student"].Rows)
            {
                studentId.Add(row["StudentId"].ToString());

            }
            foreach (DataRow row in ds2.Tables["dbo.Instructor"].Rows)
            {
                instructorid.Add(row["InstructorId"].ToString());

            }

            if (studentId.Exists(element => element == txtboxsuid.Text) /*&& phone.Exists(element => element == phoneNo.Text)*/)
            {
                Response.Redirect("studenthomepage.aspx");
            }
            else if (instructorid.Exists(element => element == txtboxsuid.Text) /*&& phone.Exists(element => element == phoneNo.Text)*/)
            {
                Response.Redirect("instructor.aspx");

            }
            else if(txtboxsuid.Text=="CS12345")
            {
                Response.Redirect("CareerServices.aspx");
            }
            con.Close();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void sendmail(Object sender,EventArgs e)
        {
            string txtEmail = "orange.board.syracuse@gmail.com";
            string txtTo = "mkchaudh@syr.edu";
            string ssub = "This email is from "+ contactName.Text +""+ contactSubject.Text;

            string body = contactMessage.Text;
            using (MailMessage mm = new MailMessage(txtEmail, txtTo))
            {
                mm.Subject = ssub;
                mm.Body = body;

                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(txtEmail, "orangeboard");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);

            }
        }








        //protected void sendmail(object sender, EventArgs e)
        //{
        //    string to = "mkchaudh@syr.edu"; //To address    
           
        //    //From address   
            
        //    string from = "orange.board.syracuse@gmail.com";
        //    MailMessage message = new MailMessage(from, to);

        //    string mailbody = contactMessage.Text;
        //    string subject = contactSubject.Text;
        //    message.Subject = subject;
            
        //    message.Body = mailbody;
        //    message.BodyEncoding = Encoding.UTF8;
        //    message.IsBodyHtml = true;
        //    SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
        //    System.Net.NetworkCredential basicCredential1 = new
        //    System.Net.NetworkCredential("orange.board.syracuse@gmail.com", "oneplustwo");
        //    client.EnableSsl = true;
        //    client.UseDefaultCredentials = false;
        //    client.Credentials = basicCredential1;
        //    try
        //    {
        //        client.Send(message);
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //}

        
       
    }
}