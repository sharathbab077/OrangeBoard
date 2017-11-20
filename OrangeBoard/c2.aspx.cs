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


    }
}