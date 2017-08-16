using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImageSelector : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void OnMediaSelected(object sender, EventArgs e) {
        int CKEditorFuncNum =0;

        if (Request.QueryString.AllKeys.Contains("CKEditorFuncNum"))
        {

            CKEditorFuncNum = int.Parse(Request.QueryString["CKEditorFuncNum"].ToString());


        }

        String path=MediaBankControl.SelectedMediaItem.PathWithResolution;
        //   ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", "<script>executeAfter('"+path+ "');</script>", false);
        String funCall=String.Format("<script>window.close();window.opener.CKEDITOR.tools.callFunction({0},'{1}');</script>",CKEditorFuncNum,path);
        ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", funCall, false);
      
    }
}