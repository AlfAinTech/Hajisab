using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_SharedTextDetail : System.Web.UI.UserControl
{
    public Boolean EditableText;
    public event EventHandler Select_clicked;
    [Editor("System.Windows.Forms.Design.StringCollectionEditor, System.Design",
"System.Drawing.Design.UITypeEditor, System.Drawing")]
    [PersistenceMode(PersistenceMode.InnerProperty)]

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
            //bindDynamicContent();

            //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
        }
    }
    public void TextClicked_eventHanlder(int textID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        TextBank tb = db.TextBanks.Where(q => q.id == textID).First();        
        RelatedDream_list.DataSource = tb.LayoutTextBanks1;
        RelatedDream_list.DataBind();
       // bindDynamicContent();
    }



    protected void TextList_ActivatePanels(object sender, EventArgs e)
    {
        // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "ActivatePanels('#basicInfo');", true);
    }
    protected void save_text_Click(object sender, EventArgs e)
    {
        //int textID = int.Parse(text_id.Text);
        //DreamBirdEntities db = new DreamBirdEntities();
        //if (text_id.Text != "")
        //{
        //    TextBank tb = db.TextBanks.Where(q => q.id == textID).First();

        //    tb.TextName = TextName_txt.Text;
        //    //tb.textdata = HiddenEditor.Value;
        //}
        //else
        //{
        //}
        //db.SaveChanges();
        ////txtEditor.InnerText = HiddenEditor.Value;
        //List<string> TagList = TagControl.GetTags();
        //if(TagList.Count > 0)
        //{
        //    foreach(string TagName in TagList)
        //    {
        //        if((!db.Tags.Any(a => a.Name == TagName)))
        //        {
        //            Tag tag = new Tag();
        //            tag.Name = TagName;
        //            db.Tags.Add(tag);
        //        }
        //    }
        //    db.SaveChanges();
        //    foreach(string TagName in TagList)
        //    {
        //        if(!(db.TextBankTags.Any(a => a.TextID == textID && a.Tag.Name == TagName)))
        //        {
        //            TextBankTag tag = new TextBankTag();
        //            tag.TextID = textID;
        //            tag.TagID = db.Tags.Where(w => w.Name == TagName).Select(s => s.id).First();
        //            db.TextBankTags.Add(tag);
        //        }
        //    }
        //    db.SaveChanges();
        //}
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
        //TagControl.LoadScripts();
        //if (db.TextBankTags.Any(a => a.TextID == textID))
        //{
        //    TagControl.SetTags(db.TextBankTags.Where(w => w.TextID == textID).Select(s => s.Tag.Name).ToList());
        //}
    }

    protected void select_button_Click(object sender, EventArgs e)
    {
        //DreamBirdEntities db = new DreamBirdEntities();
        //if (text_id.Text != "")
        //{
        //    int id = int.Parse(text_id.Text);
        //    if (Request.QueryString["DID"] != null && Request.QueryString["PID"] != null && Request.QueryString["CID"] != null)
        //    {
        //        int pid = int.Parse(Request.QueryString["PID"]);
        //        String cid = Request.QueryString["CID"].ToString();
        //        var data = db.LayoutTextBanks.Where(q => q.ControlName == cid && q.LayoutID == pid).ToList();
        //        if (data.Count() != 0)
        //        {
        //            LayoutTextBank ltb = data[0];
        //            ltb.SharedTextID = id;
        //            ltb.IsShared = true;
        //        }
        //        else
        //        {
        //            TextBank tb = new TextBank
        //            {
        //                TextName = "Default",
        //                IsShared = false,
        //                textdata = "",
        //            };
        //            db.TextBanks.Add(tb);
        //            // db.SaveChanges();
        //            LayoutTextBank ltb = new LayoutTextBank
        //            {
        //                IsShared = true,
        //                ControlName = cid,
        //                LayoutID = pid,
        //                SharedTextID = id,
        //                TextID = tb.id,
        //            };
        //            db.LayoutTextBanks.Add(ltb);

        //        }
        //        db.SaveChanges();

        //    }
        //}
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);

    }


    public void bindDynamicContent()
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


            //String func = String.Format("setValue('{0}','#{1}')", txtEditor.ClientID, HiddenEditor.ClientID);
            //save_text.OnClientClick = func;


        }
    }

}