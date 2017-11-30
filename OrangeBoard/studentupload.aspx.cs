﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrangeBoard
{
    public partial class studentupload : System.Web.UI.Page
    {

        protected void UploadFile(object sender, EventArgs e)
        {

            try
            {
                string fileName = Path.GetFileName(FileUpload1assignment.PostedFile.FileName);
                if (fileName != null)
                {
                    FileUpload1assignment.PostedFile.SaveAs(Server.MapPath("~/course1/") + fileName);
                    Response.Redirect(Request.Url.AbsoluteUri);
                }

            }
            catch
            {
                Label1assignment.Text = "Please insert the file";
            }
        }

        protected void DeleteFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            File.Delete(filePath);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/course1/"));
                List<ListItem> files = new List<ListItem>();
                foreach (string filePath in filePaths)
                {
                    files.Add(new ListItem(Path.GetFileName(filePath), filePath));
                }
                GridView1assignment.DataSource = files;
                GridView1assignment.DataBind();
            }
        }
        protected void DownloadFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }


    }
}