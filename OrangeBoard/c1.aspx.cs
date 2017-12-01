using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Net.Mail;
using System.Data.SqlClient;

namespace OrangeBoard
{
    public partial class c1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {






            SqlConnection con = new SqlConnection();
            string i = Session["id"].ToString();
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "C:\\Users\\Mehal K Chaudhari\\Source\\Repos\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
            con.Open();
            /***************/
            SqlDataAdapter da = new SqlDataAdapter("select CourseId,CourseContent,AssignmentQuestion from dbo.CourseContent where CourseId = '" + Session["cid" + i].ToString() + "';", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "dbo.CourseContent");

            List<string> showfiles = new List<string>();

            foreach (DataRow row in ds.Tables["dbo.CourseContent"].Rows)
            {
                showfiles.Add(row["CourseContent"].ToString());
                showfiles.Add(row["AssignmentQuestion"].ToString());
            }



          
            coursetitle.InnerText = Session["ctitle" + i].ToString();
            courselocation.InnerText = Session["clocation" + i].ToString();
            coursetiming.InnerText = Session["ctiming" + i].ToString();
            courseday.InnerText = Session["cday" + i].ToString();

            /* changes made here */

            //pass the path of the course here from DB
            if (!IsPostBack)
            {
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/courseContent/"));
                List<ListItem> files = new List<ListItem>();
                foreach (string filePath in filePaths)
                {

                    if (showfiles.Contains(Path.GetFileName(filePath)))
                    {
                        files.Add(new ListItem(Path.GetFileName(filePath), filePath));
                    }
                }
                GridView1.DataSource = files;
                GridView1.DataBind();

            }
        }
        //added a download function
        protected void DownloadFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }







        //dummy func
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/courseContent/") + e.CommandArgument);
                Response.End();
            }
        }
        //dummy func
        public class courseonerecpients
        {
            public int id { get; set; }
            public string name { get; set; }
            public string email { get; set; }
        }
        //added a delete function
        protected void DeleteFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            File.Delete(filePath);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        //changed the upload button code here
        protected void c1uploadbtn(object sender, EventArgs e)
        {
            try
            {
                string fileName = null;
                Button button = (Button)sender;
                if (button.ID == "Button1")
                {
                     fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                    if (fileName != null)
                    {
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/courseContent/") + fileName);
                        /********************************/
                        string i = Session["id"].ToString();
                        SqlConnection con = new SqlConnection();

                        con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "C:\\Users\\Mehal K Chaudhari\\Source\\Repos\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
                        con.Open();


                        string a = Session["suidValue"].ToString();
                        SqlCommand cmd = con.CreateCommand();
                        cmd.CommandType = System.Data.CommandType.Text;

                        cmd.CommandText = "INSERT INTO dbo.CourseContent(CourseId,CourseContent) VALUES('" + Session["cid" + i].ToString() + "','"  + fileName + "')" + ";";
                        cmd.ExecuteNonQuery();
                        con.Close();

                        Response.Redirect(Request.Url.AbsoluteUri);
                        Label1.Text = "File successfully uploaded";
                    }
                }
                else if(button.ID == "Button2")
                    {
                         fileName = Path.GetFileName(FileUpload2.PostedFile.FileName);

                    if (fileName != null)
                    {
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/courseContent/") + fileName);
                        /********************************/
                        string i = Session["id"].ToString();
                        SqlConnection con = new SqlConnection();

                        con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "C:\\Users\\Mehal K Chaudhari\\Source\\Repos\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
                        con.Open();


                        string a = Session["suidValue"].ToString();
                        SqlCommand cmd = con.CreateCommand();
                        cmd.CommandType = System.Data.CommandType.Text;

                        cmd.CommandText = "INSERT INTO dbo.CourseContent (CourseId, AssignmentQuestion) VALUES('" + Session["cid" + i].ToString() + "','" + fileName +  "')" + ";";
                        cmd.ExecuteNonQuery();
                        con.Close();

                        Response.Redirect(Request.Url.AbsoluteUri);
                        Label1.Text = "File successfully uploaded";
                    }
                }

               

            }
            catch
            {
                Label1.Text = "No file uploaded !!! Please insert the file";
            }


        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void notifybtnc1_Click(object sender, EventArgs e)
        {

            SqlDataReader rdr = null;

            // create a connection object
            SqlConnection conn = new SqlConnection("Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename = F:\\3sem\\senew\\OrangeBoard\\OrangeBoard\\App_Data\\email.mdf; Integrated Security = True");

            // create a command object
            SqlCommand cmd = new SqlCommand("SELECT [Full Name],EmailId from dbo.Student", conn);

            try
            {
                // open the connection
                conn.Open();

                // get an instance of the SqlDataReader
                rdr = cmd.ExecuteReader();

                var emails = new List<courseonerecpients>();
                while (rdr.Read())
                {

                    emails.Add(new courseonerecpients
                    {

                        name = rdr["[Full Name]"].ToString(),
                        email = rdr["EmailId"].ToString(),


                    });
                }

                foreach (courseonerecpients email in emails)
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
                    mail.Subject = ("Course One");
                    mail.IsBodyHtml = false;
                    string notifytext = c1txtarea.Text;
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

        protected void viewuploadedassignment(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            string i = Session["id"].ToString();
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "C:\\Users\\Mehal K Chaudhari\\Source\\Repos\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
            con.Open();
            /***************/
            SqlDataAdapter da = new SqlDataAdapter("select Assignment from dbo.Assignment where CourseId = '" + Session["cid" + i].ToString() + "';", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "dbo.Assignment");
            SqlDataAdapter da2 = new SqlDataAdapter("select CourseTitle, LocationofCourse, Timing, DaysOfWeek from dbo.Course where InstructorId='" + Session["suidValue"].ToString() + "' ;", con);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2, "dbo.Course");
            List<string> suid = new List<string>();
            List<string> showfiles = new List<string>();
            List<string> Courses = new List<string>();
            List<string> CourseLocation = new List<string>();
            List<string> CourseTiming = new List<string>();
            List<string> CourseDay = new List<string>();
            foreach (DataRow row in ds.Tables["dbo.Assignment"].Rows)
            {
                showfiles.Add(row["Assignment"].ToString());
            }
            foreach (DataRow row in ds2.Tables["dbo.Course"].Rows)
            {
                Courses.Add(row["CourseTitle"].ToString());
                CourseLocation.Add(row["LocationofCourse"].ToString());
                CourseTiming.Add(row["Timing"].ToString());
                CourseDay.Add(row["DaysOfWeek"].ToString());
            }

            string[] filePaths2 = Directory.GetFiles(Server.MapPath("~/assignment1/"));
            List<ListItem> files2 = new List<ListItem>();
            foreach (string filePath in filePaths2)
            {
                if (showfiles.Contains(Path.GetFileName(filePath)))
                {

                    files2.Add(new ListItem(Path.GetFileName(filePath), filePath));
                }
            }
            GridViewinstructorassignment.DataSource = files2;
            GridViewinstructorassignment.DataBind();
        }


    }
}

