using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_SharedTextBankAdmin : CoreDreamControlAdapter
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            SharedTextBankList.bindData();
        }

    }
    public void TextClicked_searchText(object sender, EventArgs e)
    {
       SharedTextDetail.Visible = true;
       //AdminTextBank.Visible = false;

        EventArgTextBankClik evt = (EventArgTextBankClik)e;
        int text_id = evt.TextBankID;
        TextBankAdmin.bindData(text_id);
        SharedTextDetail.TextClicked_eventHanlder(text_id);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script_Activate_Panels", "$('a[data-id="+ '"' + text_id +'"'+ "]').addClass('active');", true);
    }
    public void addBtn_clicked(object sender, EventArgs e)
    {
       SharedTextDetail.Visible = false;
      //AdminTextBank.Visible = true;
        //AdminTextBank.BindData();
        
        //AdminTextBank.ShowScript();
    }
    public void NewTextAdded_Textsaved(object sender, EventArgs e)
    {
        SharedTextBankList.bindData();
    }

    protected void add_textBank_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if(db.TextBanks.Any(a => a.TextName == TextBankName.Text))
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_duplicate", "alert('Text Bank with this name already exist, change the name and save again');", true);
            SharedTextBankList.bindData();
        }
        else
        {
            TextBank tbanknew = new TextBank();
            tbanknew.TextName = TextBankName.Text;
            tbanknew.IsShared = true;
            tbanknew.textdata = "";
            db.TextBanks.Add(tbanknew);
            db.SaveChanges();
            SharedTextBankList.bindData();
        }
        
    }
}
