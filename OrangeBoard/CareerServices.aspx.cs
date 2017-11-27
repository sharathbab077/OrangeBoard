using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;
using System.Data;
using Clockwork;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

namespace OrangeBoard
{
    public partial class CareerServices : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=DESKTOP-4PPCII6\SQLEXPRESS;Initial Catalog=OrangeBoard;Integrated Security=True";

            try
            {


                string query = "SELECT PhoneNumber FROM dbo.StudentCareerInformation WHERE degree= '" + degree.Text + "' AND major = '" + major.Text + "' AND programmingLanguages= '" + programming.Text + "' AND workyears >= " + Exyears.Text+";";

                // Create a SqlCommand object and pass the constructor the connection string and the query string.
                SqlCommand queryCommand = new SqlCommand(query, con);

                con.Open();

                ArrayList ar = new ArrayList();
                int i = 0;
                using (SqlDataReader reader = queryCommand.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ar.Add(reader[0].ToString()); //This writes first column values for your all rows.
                        i = i + 1;
                    }
                }
                string[] a = ar.ToArray(typeof(string)) as string[];

                API api = new API("517b63d0706f907bdb548a4d8d6f49ba75b7b34b");

                int l = a.Length;
                //  Response.Write(l);
                string b = message
                    .Text;
                for (i = 0; i < l; i++)
                {
                    Response.Write(a[i] + " ");
                   SMSResult result = api.Send(new SMS { To = a[i], Message = b });
                }
            }


            catch (Exception exp)
            {
                throw exp;
            }
            finally
            {
                con.Close();
            }

            Response.Redirect("CareerServices.aspx");
        }

    }
}
    