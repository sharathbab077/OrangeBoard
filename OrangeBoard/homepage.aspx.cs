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

            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "C:\\Users\\Mehal K Chaudhari\\Source\\Repos\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
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
    }
}