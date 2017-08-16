using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_SharedTextBankSelection : System.Web.UI.UserControl,ICoreDreamControl
{
    public event EventHandler TextBankSelected;
    protected void Page_Load(object sender, EventArgs e)
    {
       if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            if (Request.QueryString.HasKeys())
            {
                int dreamID = Convert.ToInt32(Request.QueryString["DID"].ToString());
                int layoutID = Convert.ToInt32(Request.QueryString["PID"].ToString());
                string DreamName = db.Dreams.Where(w => w.id == dreamID).Select(s => s.DreamName).First();
                string PageName = db.DreamLayouts.Where(w => w.id == layoutID).Select(s => s.Page).First();
                dream_name.Text = DreamName;
                page_name.Text = PageName;
                pageNavigate.HRef = "~/DreamHome/" + DreamName + "/" + PageName;
                pageNavigate.DataBind();
            }
            bindData();
            }
        }
  
    public void bindData()
{
    DreamBirdEntities db = new DreamBirdEntities();
    Dream dream;
    DreamLayout page;
    List<LayoutTextBank> layoutTexts;
        SharedTextBankList.bindData();
    if (Request.QueryString["DID"] != null && Request.QueryString["PID"] != null && Request.QueryString["CID"] != null)
    {
        int dream_id = int.Parse(Request.QueryString["DID"]);
        int page_id = int.Parse(Request.QueryString["PID"]);
        dream = db.Dreams.Where(dm => dm.id == dream_id).First();
        page = db.DreamLayouts.Where(dl => dl.id == page_id).First();
        String baseControl = Request.QueryString["CID"].ToString();
        layoutTexts = db.LayoutTextBanks.Where(q => q.LayoutID == page.id && q.ControlName == baseControl).ToList();
        if (layoutTexts.Count() > 0)
        {
            LayoutTextBank layoutText = layoutTexts[0];
            IQueryable<TextBank> queryable;
            //if text is shared Than Bind shared Panel
            if (layoutText.IsShared.Value)
            {
                queryable = db.TextBanks.Where(tb => tb.id == layoutText.TextBank1.id);
                TextBank t = queryable.First();
                SharedTextDetail.TextClicked_eventHanlder(t.id);
                    SharedTextBankList.ClickedTextEnable(t.id);
            } } }
    }
    public void TextClicked_searchText(object sender, EventArgs e)
    {

        EventArgTextBankClik evt = (EventArgTextBankClik)e;
        int text_id = evt.TextBankID;
        SharedTextDetail.TextClicked_eventHanlder(text_id);
    }
    public void SelectClicked_Clicked(object sender, EventArgs e)
    {
        EventArgTextBankClik evt = (EventArgTextBankClik)e;
        int text_id = evt.TextBankID;
        if (TextBankSelected!=null)
            {
            TextBankSelected(sender, evt);
        }

    }

    public void BindData()
    {
        
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
       
    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {
        
    }
}