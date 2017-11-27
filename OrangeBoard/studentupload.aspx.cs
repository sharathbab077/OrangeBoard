using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrangeBoard
{
    public partial class studentupload : System.Web.UI.Page
    {
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
                 protected void UploadFile(object sender, EventArgs e)
        {

            try
            {5
                string fileName = Path.GetFileName(FileUpload1assignment.PostedFile.FileName);
                if (fileName != null)
                {
                    FileUpload1assignment.PostedFile.SaveAs(Server.MapPath("~/course1/") + fileName);
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
               
            }
            catch
            {
                Label1.Text = "Please insert the file";
            }
        }
            }
            protected void UploadFile(object sender, EventArgs e)
            {

                try
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (fileName != null)
                    {
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/course1/") + fileName);
                        Response.Redirect(Request.Url.AbsoluteUri);
                    }

                }
                catch
                {
                    Label1.Text = "Please insert the file";
                }
            }



        }
    }
}