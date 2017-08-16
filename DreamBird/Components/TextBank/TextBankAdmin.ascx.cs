using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
public partial class Components_TextBank_TextBankAdmin :  CoreDreamControlAdapter
{
    private string textMode;
    public string TextMode
    {
        get
        {
            return textMode;
        }
        set
        {
            textMode = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {

            if (textMode == "Custom")
            {
                bindData(0);
            }
            else if (textMode == "Question")
            {
                TextBankAdminPanel.Visible = false;
                BindDynamicData();
                TagControl.Dispose();
            }

        }
    }


    private void BindDynamicData()
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


            String func = String.Format("setValue('{0}','#{1}');", txtEditor.ClientID, HiddenEditor.ClientID);
            save_textBank.OnClientClick = func;
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor();", true);
        }
    }
    public void bindData(int TextID)
    {
        BindDynamicData();
        if (textMode == "Custom")
        {
            DreamBirdEntities db = new DreamBirdEntities();
            Dream dream;
            DreamLayout page;
            List<LayoutTextBank> layoutTexts;
            if (Request.QueryString["DID"] != null && Request.QueryString["PID"] != null && Request.QueryString["CID"] != null)
            {
                int dream_id = int.Parse(Request.QueryString["DID"]);
                int page_id = int.Parse(Request.QueryString["PID"]);
                String baseControl = Request.QueryString["CID"].ToString();

                dream = db.Dreams.Where(dm => dm.id == dream_id).First();
                page = db.DreamLayouts.Where(dl => dl.id == page_id).First();
                if (db.LayoutTextBanks.Any(w => w.DreamLayout.id == page.id && w.ControlName == baseControl))
                {
                    var TextBank = db.LayoutTextBanks.Where(w => w.DreamLayout.id == page.id && w.ControlName == baseControl).First();
                    tbank_name.Text = TextBank.TextBank.TextName;
                    tbank_id.Value = TextBank.TextBank.id.ToString();
                    txtEditor.InnerText = TextBank.TextBank.textdata;
                    List<string> taglist = new List<string>();
                    if (db.TextBankTags.Any(a => a.TextID == TextBank.TextBank.id))
                    {
                        var TTagList = db.TextBankTags.Where(w => w.TextID == TextBank.TextBank.id).Select<TextBankTag, int?>(s => s.TagID).ToList();
                        taglist = db.Tags.Where(w => TTagList.Contains(w.id)).Select(s => s.Name).ToList();
                    }
                    TagControl.LoadScripts();
                    TagControl.SetTags(taglist);
                }
                else
                {
                    //dream_name.Text = dream.DreamName;
                    //page_name.Text = page.Page;
                    string ProposedTBankName = page.Dream.DreamName + "_" + page.Page;
                    int TextBankCount = db.TextBanks.Where(w => w.TextName.Contains(ProposedTBankName)).Count() + 1;
                    tbank_name.Text = ProposedTBankName + "_" + TextBankCount;
                    tbank_name.Enabled = false;
                    txtEditor.InnerText = "";
                    //dream_name.Text = dream.DreamName;
                    //page_name.Text = page.Page;

                }
            }
        }
        else if (textMode == "Shared")
        {
            DreamBirdEntities db = new DreamBirdEntities();
            TextBank tb = db.TextBanks.Where(q => q.id == TextID).First();
            tbank_name.Text = tb.TextName;
            tbank_id.Value = tb.id.ToString();
            txtEditor.InnerText = tb.textdata;
            //text_id.Text = tb.id.ToString();

            //RelatedDream_list.DataSource = tb.LayoutTextBanks1;
            //RelatedDream_list.DataBind();
            //bindDynamicContent();
            //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
            TagControl.LoadScripts();
            if (db.TextBankTags.Any(a => a.TextID == TextID))
            {
                TagControl.SetTags(db.TextBankTags.Where(w => w.TextID == TextID).Select(s => s.Tag.Name).ToList());
            }
        }
    }
    
    protected void cmdSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            if (textMode == "Custom")
            {
                if (Request.QueryString["DID"] != null && Request.QueryString["PID"] != null && Request.QueryString["CID"] != null)
                {
                    String control_name = Request.QueryString["CID"].ToString();
                    int page_id = int.Parse(Request.QueryString["PID"]);
                    var data = db.LayoutTextBanks.Where(q => q.LayoutID == page_id && q.ControlName == control_name).ToList();
                    LayoutTextBank ltb = new LayoutTextBank();
                    List<string> taglist = new List<string>();
                    if (data.Count != 0)
                    {
                        ltb = data[0];
                        taglist = TagControl.GetTags();
                        List<int> tagids = new List<int>();
                        if (taglist.Count > 0)
                        {
                            foreach (string str in taglist)
                            {
                                if (db.Tags.Any(a => a.Name == str))
                                {
                                    int i = db.Tags.Where(w => w.Name == str).Select(s => s.id).First();
                                    tagids.Add(i);
                                }
                                else
                                {
                                    Tag tag = new Tag();
                                    tag.Name = str;
                                    db.Tags.Add(tag);
                                    db.SaveChanges();
                                    tagids.Add(tag.id);
                                }
                            }
                            foreach (int id in tagids)
                            {
                                TextBankTag tbt = new TextBankTag();
                                tbt.TagID = id;
                                tbt.TextID = ltb.TextBank.id;
                                db.TextBankTags.Add(tbt);
                                db.SaveChanges();
                            }
                        }

                        ltb.TextBank.textdata = HiddenEditor.Value;
                        ltb.TextBank.TextName = tbank_name.Text;
                        ltb.ControlName = Request.QueryString["CID"];
                        ltb.IsShared = false;
                        ltb.LayoutID = int.Parse(Request.QueryString["PID"]);
                    }
                    else
                    {
                        //Add in TextBank
                        TextBank tbnew = new TextBank();
                        tbnew.textdata = HiddenEditor.Value;
                        tbnew.TextName = tbank_name.Text;
                        tbnew.IsShared = false;
                        db.TextBanks.Add(tbnew);
                        ltb.TextID = tbnew.id;
                        ltb = new LayoutTextBank();
                        ltb.ControlName = Request.QueryString["CID"];
                        ltb.IsShared = false;
                        ltb.LayoutID = int.Parse(Request.QueryString["PID"]);
                        db.LayoutTextBanks.Add(ltb);
                        taglist = TagControl.GetTags();
                        List<int> tagids = new List<int>();
                        if (taglist.Count > 0)
                        {
                            foreach (string str in taglist)
                            {
                                if (db.Tags.Any(a => a.Name == str))
                                {
                                    int i = db.Tags.Where(w => w.Name == str).Select(s => s.id).First();
                                    tagids.Add(i);
                                }
                                else
                                {
                                    Tag tag = new Tag();
                                    tag.Name = str;
                                    db.Tags.Add(tag);
                                    db.SaveChanges();
                                    tagids.Add(tag.id);
                                }
                            }
                            foreach (int id in tagids)
                            {
                                TextBankTag tbt = new TextBankTag();
                                tbt.TagID = id;
                                tbt.TextID = ltb.TextBank.id;
                                db.TextBankTags.Add(tbt);
                                db.SaveChanges();
                            }
                        }

                    }
                    db.SaveChanges();
                    txtEditor.InnerText = HiddenEditor.Value;
                    TagControl.LoadScripts();
                    TagControl.SetTags(taglist);
                    
                }
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
            }
            else if (textMode == "Shared")
            {
                int textID = int.Parse(tbank_id.Value);
                if (tbank_id.Value != "")
                {
                    TextBank tb = db.TextBanks.Where(q => q.id == textID).First();

                    tb.TextName = tbank_name.Text;
                    tb.textdata = HiddenEditor.Value;
                }
                else
                {
                }
                db.SaveChanges();
                txtEditor.InnerText = HiddenEditor.Value;
                List<string> TagList = TagControl.GetTags();
                if (TagList.Count > 0)
                {
                    foreach (string TagName in TagList)
                    {
                        if ((!db.Tags.Any(a => a.Name == TagName)))
                        {
                            Tag tag = new Tag();
                            tag.Name = TagName;
                            db.Tags.Add(tag);
                        }
                    }
                    db.SaveChanges();
                    foreach (string TagName in TagList)
                    {
                        if (!(db.TextBankTags.Any(a => a.TextID == textID && a.Tag.Name == TagName)))
                        {
                            TextBankTag tag = new TextBankTag();
                            tag.TextID = textID;
                            tag.TagID = db.Tags.Where(w => w.Name == TagName).Select(s => s.id).First();
                            db.TextBankTags.Add(tag);
                        }
                    }
                    db.SaveChanges();
                }
                
                TagControl.LoadScripts();
                if (db.TextBankTags.Any(a => a.TextID == textID))
                {
                    TagControl.SetTags(db.TextBankTags.Where(w => w.TextID == textID).Select(s => s.Tag.Name).ToList());
                }
                BindDynamicData();
                //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
            }
        }
    }

    override
    public void OnShowAdminEvent(object sender, EventArgs e) {


        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);



    }

    override
    public  void OnHideAdminEvent(object sender, EventArgs e) {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);

    }



}