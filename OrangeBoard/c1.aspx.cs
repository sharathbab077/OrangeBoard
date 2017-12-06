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
using System.Net;

namespace OrangeBoard
{
    public partial class c1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {






            SqlConnection con = new SqlConnection();
            string i = Session["id"].ToString();
            // con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "C:\\Users\\Mehal K Chaudhari\\Source\\Repos\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "F:\\3sem\\mehal125\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
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

      

        protected void sendmailadd(object sender, EventArgs e)
        {
            SqlDataReader rdr = null;
            var emaillist = new List<String>();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source = sharath\sqlexpress;Initial Catalog = Student;Integrated Security = True";
            SqlCommand cmd = new SqlCommand("SELECT emailid from dbo.emailsd", conn);
            try
            {
                conn.Open();
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    string name = rdr["emailid"].ToString();
                    emaillist.Add(name);

                }

            }
            catch (Exception ex)
            {

            }
            conn.Close();
            foreach (var m in emaillist)
            {
                string txtEmail = "orange.board.syracuse@gmail.com";
                string txtTo = m;
                string ssub = "Notification";
                
                string body = c1txtarea.Text;
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

        protected void editgrades(object sender, EventArgs e)
        {
           // string i = Session["id"].ToString();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source = sharath\sqlexpress;Initial Catalog = Student;Integrated Security = True";
            con.Open();

         //   SqlDataAdapter da = new SqlDataAdapter("select marks from dbo.marks where studentid = '" + Session["cid" + i].ToString() + "';", con);
           // DataSet ds = new DataSet();
           // da.Fill(ds, "dbo.Assignment");


        }
    }




}

