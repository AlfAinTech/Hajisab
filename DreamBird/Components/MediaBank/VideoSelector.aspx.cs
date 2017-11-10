using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_MediaBank_VideoSelector : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void MediaBankControl_MediaSelectedEvent(object sender, EventArgs e)
    {
        int CKEditorFuncNum = 0;

        //if (Request.QueryString.AllKeys.Contains("CKEditorFuncNum"))
        //{

        //    CKEditorFuncNum = int.Parse(Request.QueryString["CKEditorFuncNum"].ToString());


        //}
        EventArgMediaSelection evt = e as EventArgMediaSelection;
        PackageEntities db = new PackageEntities();
        var MediaItem = db.MediaItems.Where(w => w.id == evt.SelectedMedia).First();
        String path = MediaItem.path+"/"+MediaItem.name;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script_videoURL", "AddLink('"+path+"');", true);
        //   ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", "<script>executeAfter('"+path+ "');</script>", false);
        //String funCall = String.Format("<script>window.close();window.opener.CKEDITOR.tools.callFunction({0},'{1}');</script>", CKEditorFuncNum, path);
        //ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", funCall, false);
    }
}