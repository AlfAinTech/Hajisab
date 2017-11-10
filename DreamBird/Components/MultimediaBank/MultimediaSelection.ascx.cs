using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_MultimediaBank_MultimediaSelection : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void MultimediaList_ItemClicked(object sender, EventArgs e)
    {
        if (Request.QueryString["PID"] != null && Request.QueryString["CID"] != null && Request.QueryString["DID"] != null)
        {
            EventArgPackageEdit evt = e as EventArgPackageEdit;
            int multimediaID = evt.PackageEditID;
            PackageEntities db = new PackageEntities();
            int pid = int.Parse(Request.QueryString["PID"].ToString());
            String cid = Request.QueryString["CID"].ToString();
            int did = int.Parse(Request.QueryString["DID"].ToString());
          
            db.SaveChanges();
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_close", "window.close();", true);
    }
}