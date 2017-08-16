using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_AdminTextBank : System.Web.UI.UserControl
{
    [Editor("System.Windows.Forms.Design.StringCollectionEditor, System.Design",
"System.Drawing.Design.UITypeEditor, System.Drawing")]
    [PersistenceMode(PersistenceMode.InnerProperty)]
    public event EventHandler TextSaved;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            var data = db.Dreams.ToList();
            Dream_list.DataSource = data;
            Dream_list.DataBind();
            if (data.Count != 0) { Dream_list.SelectedValue = Dream_list.Items[0].Value; }
            BindData();

            ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);

        }
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
    }

    public void ShowScript()
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
    }



    //save button if not shared textbank is selected
    protected void cmdSave_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();

        //Add in TextBank
        TextBank tbnew = new TextBank();
        tbnew.textdata = HiddenEditor.Value;
        tbnew.TextName = name_txt.Text;
        tbnew.IsShared = true;
        db.TextBanks.Add(tbnew);
        db.SaveChanges();
        txtEditor.InnerText = HiddenEditor.Value;
        BindData();
        if(TextSaved != null)
        {
            TextSaved(sender, e);
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);

    }

    protected void Dream_list_SelectedIndexChanged(object sender, EventArgs e)
    {
        int dream_id = int.Parse(Dream_list.SelectedValue);
        DreamBirdEntities db = new DreamBirdEntities();
        var data = db.DreamLayouts.Where(q => q.DreamID == dream_id).ToList();
        Page_list.SelectedValue = null;
        Page_list.DataSource = data;
        Page_list.DataBind();
        if (data.Count != 0) { Page_list.SelectedValue = Page_list.Items[0].Value; Page_list_SelectedIndexChanged(this, EventArgs.Empty); }

        ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenCollapse", "$('#collapseOne').addClass('in')", true);

    }

    protected void Page_list_SelectedIndexChanged(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int layout_id = int.Parse(Page_list.SelectedValue);
        List<LayoutTextBank> layoutsTextBank = db.LayoutTextBanks.Where(q => q.LayoutID == layout_id).ToList();
        List<int> text_ids = new List<int>();
        foreach (LayoutTextBank l in layoutsTextBank)
        {
            text_ids.Add(l.TextID);
        }
        List<TextBank> data = db.TextBanks.Where(q => text_ids.Contains(q.id)).ToList();
        TextBank_list.DataSource = data;
        TextBank_list.DataBind();
        if (data.Count != 0) { TextBank_list.SelectedValue = TextBank_list.Items[0].Value; TextBank_list_SelectedIndexChanged(this, EventArgs.Empty); }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenCollapse", "$('#collapseOne').addClass('in')", true);
        ShowScript();

    }

    protected void TextBank_list_SelectedIndexChanged(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int text_id = int.Parse(TextBank_list.SelectedValue);
        TextBank text_obj = db.TextBanks.Where(q => q.id == text_id).First();
        txtEditor.InnerText = text_obj.textdata;
        BindData();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenCollapse", "$('#collapseOne').addClass('in')", true);
        ShowScript();
        

    }




    public void BindData()
    {
        String path = Server.MapPath("~/components/TextBank/contents/js/custom.js");

        String script1 = File.ReadAllText(path);
        StringBuilder scriptBuilder = new StringBuilder();
        scriptBuilder.Append(script1);


        ClientScriptManager cs = Page.ClientScript;
        if (!cs.IsClientScriptBlockRegistered("script_textbank_admin"))
        {

            cs.RegisterClientScriptBlock(this.GetType(), "script_textbank_admin", scriptBuilder.ToString(), true);


            //Loading CKEditor 
            String ckeeditorPath = Server.MapPath("~/components/TextBank/ckeditor/ckeditor.js");
            String ckeEditorJS = File.ReadAllText(ckeeditorPath);
            //  cs.RegisterClientScriptBlock(this.GetType(), "script_CKEditor", ckeEditorJS, true);

            ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_CKEditor", "<script src='/components/TextBank/ckeditor/ckeditor.js'></script>", false);


            String func = String.Format("setValue('{0}','#{1}')", txtEditor.ClientID, HiddenEditor.ClientID);
            cmdSave.OnClientClick = func;



        }
    }





}