using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_SuperAdminTextBank : CoreDreamControlAdapter
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

       // Selection_panel.Visible = shared_chk.Checked;
        if (!Page.IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            //Bind Dream List

            var data = db.Dreams.ToList();
            Dream_list.DataSource = data;
            Dream_list.DataBind();
            if (data.Count != 0) { Dream_list.SelectedIndex = 0; }
            String path = Server.MapPath("~/components/TextBank/contents/js/custom.js");

            String script1 = File.ReadAllText(path);
            StringBuilder scriptBuilder = new StringBuilder();
            scriptBuilder.Append(script1);


            ClientScriptManager cs = Page.ClientScript;
            if (!cs.IsClientScriptBlockRegistered("script_textbank_admin"))
            {cs.RegisterClientScriptBlock(this.GetType(), "script_textbank_admin", scriptBuilder.ToString(), true);

                //Loading CKEditor 
                String ckeeditorPath = Server.MapPath("~/components/TextBank/ckeditor/ckeditor.js");
                String ckeEditorJS = File.ReadAllText(ckeeditorPath);
                //  cs.RegisterClientScriptBlock(this.GetType(), "script_CKEditor", ckeEditorJS, true);

                ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_CKEditor", "<script src='/components/TextBank/ckeditor/ckeditor.js'></script>", false);

                bindTextBank();
                String func = String.Format("setValue('{0}','#{1}')", txtEditor.ClientID, HiddenEditor.ClientID);
                cmdSave.OnClientClick = func;
               
            //}
            }
             ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
        }
    }



    public void bindData(int text_id)
    {

    }


    protected void cmdSave_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if (Request.QueryString["DID"] != null && Request.QueryString["PID"] != null && Request.QueryString["CID"] != null)
        { String control_name =Request.QueryString["CID"].ToString();
            int page_id = int.Parse(Request.QueryString["PID"]);
            var data = db.LayoutTextBanks.Where(q => q.LayoutID == page_id && q.ControlName == control_name).ToList();
            LayoutTextBank ltb=new LayoutTextBank();
            if (data.Count != 0)
            {
                
                ltb = data[0];
                ltb.TextBank.textdata = HiddenEditor.Value;
                ltb.TextBank.TextName = text_name.Text;
                ltb.ControlName = Request.QueryString["CID"];
                ltb.IsShared = shared_chk.Checked;
                ltb.LayoutID = int.Parse(Request.QueryString["PID"]);
            }
            else
            {
                //Add in TextBank
                TextBank tbnew = new TextBank();
                tbnew.textdata = HiddenEditor.Value;
                tbnew.TextName = text_name.Text;
                tbnew.IsShared = false;
                db.TextBanks.Add(tbnew);
                ltb.TextID = tbnew.id;
                ltb = new LayoutTextBank();
                ltb.ControlName = Request.QueryString["CID"];
                ltb.IsShared = shared_chk.Checked;
                ltb.LayoutID = int.Parse(Request.QueryString["PID"]);
                db.LayoutTextBanks.Add(ltb);
                
            }
            db.SaveChanges();
            txtEditor.InnerText = HiddenEditor.Value;
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);


        }
    }
    //OnChange Dropdown 
    protected void Dream_list_SelectedIndexChanged(object sender, EventArgs e)
    {
        int dream_id = int.Parse(Dream_list.SelectedValue);
        DreamBirdEntities db = new DreamBirdEntities();
        var data = db.DreamLayouts.Where(q => q.DreamID == dream_id).ToList();
        Page_list.DataSource = data;
        Page_list.DataBind();
        if (data.Count != 0) { Page_list.SelectedValue = Page_list.Items[0].Value; }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);


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
        if (data.Count != 0) { TextBank_list.SelectedValue = TextBank_list.Items[0].Value;  }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);


    }

    protected void TextBank_list_SelectedIndexChanged(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int text_id = int.Parse(TextBank_list.SelectedValue);
        TextBank text_obj = db.TextBanks.Where(q => q.id == text_id).First();
        txtEditor.InnerText = text_obj.textdata;
        shared_chk.Checked = text_obj.IsShared.Value;
        if(text_obj.LayoutTextBanks1.Count >1)
        {
            shared_chk.Enabled = false;
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
    }

    override
    public void OnShowAdminEvent(object sender, EventArgs e)
    {


        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);



    }

    override
    public void OnHideAdminEvent(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);

    }




    protected void shared_chk_CheckedChanged(object sender, EventArgs e)
    {
        custome_chk.Checked = !shared_chk.Checked;
        Custome_Panel.Visible = custome_chk.Checked;
       
        Shared_panel.Visible = shared_chk.Checked;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
        txtEditor.InnerText = HiddenEditor.Value;
       
    }

    protected void copy_textBank_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        copy_textBank.Visible = false;
        Selection_panel.Visible = true;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);


    }
    public void bindTextBank()

    {
        DreamBirdEntities db = new DreamBirdEntities();
        Dream dream;
        DreamLayout page;
        List<LayoutTextBank> layoutTexts;
        if (Request.QueryString["DID"] != null && Request.QueryString["PID"] != null && Request.QueryString["CID"] != null)
        {           int dream_id = int.Parse(Request.QueryString["DID"]);
            int page_id = int.Parse(Request.QueryString["PID"]);
            dream = db.Dreams.Where(dm => dm.id == dream_id).First();
            page = db.DreamLayouts.Where(dl => dl.id == page_id).First();
            String baseControl = Request.QueryString["CID"].ToString();
            dream_name.Text = dream.DreamName;
            page_name.Text = page.Page;
            layoutTexts = db.LayoutTextBanks.Where(q => q.LayoutID == page.id && q.ControlName == baseControl).ToList();
            if (layoutTexts.Count() > 0)
            {
                LayoutTextBank layoutText = layoutTexts[0];
                IQueryable<TextBank> queryable;
                //if text is shared Than Bind shared Panel
                if (layoutText.IsShared.Value)
                {
                    shared_chk.Checked = true;
                    Shared_panel.Visible = true;                  
                    queryable = db.TextBanks.Where(tb => tb.id == layoutText.TextBank1.id);
                    TextBank t = queryable.First();
                   // SharedTextBankSelection.bindData(t.id);
                }
                else
                {
                    custome_chk.Checked = true;
                    Custome_Panel.Visible = true;
                }
                //bind Custome Panel
                queryable = db.TextBanks.Where(tb => tb.id == layoutText.TextBank.id);
                TextBank tbank = queryable.First();
                txtEditor.InnerText = tbank.textdata;
                text_name.Text = tbank.TextName;
                dream_name.Text = dream.DreamName;
                page_name.Text = page.Page;

            }
        }
    }


    protected void custome_chk_CheckedChanged(object sender, EventArgs e)
    {
        shared_chk.Checked = !custome_chk.Checked;
        Custome_Panel.Visible = custome_chk.Checked;
        Shared_panel.Visible = shared_chk.Checked;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
    }
    protected void TextBank_Selected(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        EventArgTextBankClik evt= (EventArgTextBankClik)e;
        int text_id = evt.TextBankID;
        if (Request.QueryString["DID"] != null && Request.QueryString["PID"] != null && Request.QueryString["CID"] != null)
        {
            int pid = int.Parse(Request.QueryString["PID"]);
            String cid = Request.QueryString["CID"].ToString();
            var data = db.LayoutTextBanks.Where(q => q.ControlName == cid && q.LayoutID == pid).ToList();
            if(data.Count() !=0)
            {
                LayoutTextBank ltb = data[0];
                ltb.SharedTextID = text_id;
                ltb.IsShared = true;
            }
            else
            {
                TextBank tb = new TextBank
                {
                    TextName = "Default",
                    IsShared=false,
                     textdata="",
                };
                db.TextBanks.Add(tb);
               // db.SaveChanges();
                LayoutTextBank ltb = new LayoutTextBank
                {
                    IsShared = true,
                    ControlName=cid,
                    LayoutID=pid,
                    SharedTextID=text_id,
                    TextID=tb.id,
                };
                db.LayoutTextBanks.Add(ltb);
                
        }
            db.SaveChanges();
        }

        }
}