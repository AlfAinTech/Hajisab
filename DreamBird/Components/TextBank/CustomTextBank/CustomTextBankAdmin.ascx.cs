using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_CustomTextBankAdmin : CoreDreamControlAdapter
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // Selection_panel.Visible = shared_chk.Checked;
        if (!Page.IsPostBack)
        {

        }
    }



    public void bindData(int text_id)
    {

    }
    //OnChange Dropdown 
    //protected void Dream_list_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int dream_id = int.Parse(Dream_list.SelectedValue);
    //    DreamBirdEntities db = new DreamBirdEntities();
    //    var data = db.DreamLayouts.Where(q => q.DreamID == dream_id).ToList();
    //    Page_list.DataSource = data;
    //    Page_list.DataBind();
    //    if (data.Count != 0) { Page_list.SelectedValue = Page_list.Items[0].Value; }
    //    ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
    //    ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "script3", "$('#collapseOne').addClass('in');", true);
    //    TagControl.LoadScripts();

    //}

    //protected void Page_list_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DreamBirdEntities db = new DreamBirdEntities();
    //    int layout_id = int.Parse(Page_list.SelectedValue);
    //    List<LayoutTextBank> layoutsTextBank = db.LayoutTextBanks.Where(q => q.LayoutID == layout_id).ToList();
    //    List<int> text_ids = new List<int>();
    //    foreach (LayoutTextBank l in layoutsTextBank)
    //    {
    //        text_ids.Add(l.TextID);

    //    }
    //    List<TextBank> data = db.TextBanks.Where(q => text_ids.Contains(q.id)).ToList();
    //    TextBank_list.DataSource = data;
    //    TextBank_list.DataBind();
    //    if (data.Count != 0) { TextBank_list.SelectedValue = TextBank_list.Items[0].Value; TextBank_list_SelectedIndexChanged(this, EventArgs.Empty); }
    //    ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
    //    ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "script3", "$('#collapseOne').addClass('in');", true);
    //    TagControl.LoadScripts();

    //}

    //protected void TextBank_list_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DreamBirdEntities db = new DreamBirdEntities();
    //    int text_id = int.Parse(TextBank_list.SelectedValue);
    //    TextBank text_obj = db.TextBanks.Where(q => q.id == text_id).First();
    //    List<string> taglist = new List<string>();
    //    if (db.TextBankTags.Any(a => a.TextID == text_obj.id))
    //    {
    //        var TTagList = db.TextBankTags.Where(w => w.TextID == text_obj.id).Select<TextBankTag, int?>(s => s.TagID).ToList();
    //        taglist = db.Tags.Where(w => TTagList.Contains(w.id)).Select(s => s.Name).ToList();
    //    }
    //    TagControl.LoadScripts();
    //    TagControl.SetTags(taglist);
    //    txtEditor.InnerText = text_obj.textdata;
    //    ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);
    //    ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "script3", "$('#collapseOne').addClass('in');", true);
        
    //}

    //override
    //public void OnShowAdminEvent(object sender, EventArgs e)
    //{


    //    ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);



    //}

    //override
    //public void OnHideAdminEvent(object sender, EventArgs e)
    //{
    //    ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor()", true);

    //}


    
    //public void bindTextBank()

    //{
        
    //}


   
    
}