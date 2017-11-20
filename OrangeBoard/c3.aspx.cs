using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace OrangeBoard
{
    public partial class c3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/course3/") + e.CommandArgument);
                Response.End();
            }
        }
        protected void c3uploadbtn(object sender, EventArgs e)
        {
            if (FileUpload3.HasFile)
            {
                FileUpload3.PostedFile.SaveAs(Server.MapPath("~/course3/") + FileUpload3.FileName);
            }

            DataTable dt = new DataTable();
            dt.Columns.Add("File", typeof(string));
            dt.Columns.Add("Size", typeof(string));
            dt.Columns.Add("Type", typeof(string));
            foreach (string filename in Directory.GetFiles(Server.MapPath("~/course3")))
            {
                FileInfo fi = new FileInfo(filename);
                dt.Rows.Add(fi.Name, fi.Length, fi.Extension);

            }
            GridView3.DataSource = dt;
            GridView3.DataBind();
        }
        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }











    }
}