using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrangeBoard
{
    public partial class write : System.Web.UI.Page
    {




        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["BlogDemo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into BlogPost(Title,Content,Author, BlogDate) values(@title,@content,@author,@date)", con);
                cmd.Parameters.AddWithValue("@title", txbxTitle.Text);
                cmd.Parameters.AddWithValue("@content", txbxContent.Text);
                cmd.Parameters.AddWithValue("@author", txbxAuthor.Text);
                cmd.Parameters.AddWithValue("@date", System.DateTime.Now);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception k)
            {
                Response.Write(k.Message);
                //throw;
            }
            finally { con.Close(); }
        }
    }
}