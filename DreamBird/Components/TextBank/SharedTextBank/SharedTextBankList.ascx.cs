using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_SharedTextBankList : System.Web.UI.UserControl
{
    public event EventHandler AddClicked;
    public event EventHandler TextClicked;
    public event EventHandler ActivatePanels;
    public Boolean ShowAddBtn;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            //add_btn.Visible = ShowAddBtn;
            bindData();
        }
    }
    public void bindData()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        SharedText_list.DataSource =  db.TextBanks.Where(q => q.IsShared == true).ToList();
        SharedText_list.DataBind();
        if(SharedText_list.Items.Count != 0) {
            LinkButton lk = (LinkButton)SharedText_list.Items[0].FindControl("TextName");
            text_btn_Click(lk, EventArgs.Empty);
                }
    }

    protected void add_btn_Click(object sender, EventArgs e)
    {
        if(AddClicked != null)
        {AddClicked(this, EventArgs.Empty); }
        
    }
    public void text_btn_Click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        EventArgTextBankClik evt = new EventArgTextBankClik();
        evt.TextBankID = id;
        ViewState["SelectedTextID"] = id;
        //dreamEdit(this, evt);
        TextClicked(this, evt);
        if (ActivatePanels != null)
        {
            ActivatePanels(this, EventArgs.Empty);
        }
    }
    protected void SearchClicked(object sender, EventArgs e)
    {
        EventArgSearchTextBank evt = (EventArgSearchTextBank)e;
        String text = evt.searchTextBank_text;
        DreamBirdEntities db = new DreamBirdEntities();
        SharedText_list.DataSource =db.TextBanks.Where(q => q.TextName.Contains(text) && q.IsShared==true).ToList();
        SharedText_list.DataBind();


    }
    public void ClickedTextEnable(int id)
    {
        bindData();
        foreach (RepeaterItem item in SharedText_list.Items)
        {

          LinkButton btn =   (LinkButton)item.FindControl("TextName");
            int text_id = int.Parse(btn.CommandArgument);
            if(text_id==id)
            {
                btn.ForeColor = System.Drawing.Color.Red;
            }
            
        }
    }
}