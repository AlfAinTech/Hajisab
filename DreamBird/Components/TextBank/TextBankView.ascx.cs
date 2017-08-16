using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_TextBankView : CoreDreamControlAdapter
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {

            bindTextData();
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                save_progress.Visible = false;
            }
            else
            {
                DreamBirdEntities db = new DreamBirdEntities();
                String user_id = HttpContext.Current.User.Identity.GetUserId();
                String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
                String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
                Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
                DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName).First();
                if(db.DreamPageControls.Any(a => a.BaseDreamServer_ID == BaseDreamControl_ServerID && a.Layout_ID == page.id))
                {
                    var UserProgress = Convert.ToDecimal(db.DreamPageControls.Where(w => w.BaseDreamServer_ID == BaseDreamControl_ServerID && w.Layout_ID == page.id).Select(s => s.TotalProgress).First());
                    List<UserLessonProgress> data = db.UserLessonProgresses.Where(q => q.LessonMenu.DreamLayoutID == page.id && q.AspNetUser_id == user_id && q.progress == UserProgress).ToList();
                    if (data.Count != 0)
                    {
                        UserLessonProgress ulp = data[0];
                        ShowStatus(ulp, BaseDreamControl_ServerID);
                    }
                }
                
            }
        }
       
    }

    override
   public void OnHideAdminEvent(object sender, EventArgs e)
    {
        bindTextData();
        
    }

    private void bindTextData()
    {
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        DreamBirdEntities db = new DreamBirdEntities();
        Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.DreamID == dream.id).First();
        List<LayoutTextBank> layoutTexts = db.LayoutTextBanks.Where(q => q.LayoutID == page.id && q.ControlName == this.BaseDreamControl_ServerID).ToList();
        if (layoutTexts.Count() > 0)
        {
            LayoutTextBank layoutText = layoutTexts[0];
            IQueryable<TextBank> queryable;
            if (layoutText.IsShared.Value)
            {
                queryable = db.TextBanks.Where(tb => tb.id == layoutText.TextBank1.id);
            }
            else
            {
                queryable = db.TextBanks.Where(tb => tb.id == layoutText.TextBank.id);
            }
            TextBank tbank = queryable.First();
            literalHTML.Text = tbank.textdata;
        }
        else
        {
            literalHTML.Text = "No Data found ";
        }



    }
    protected void ShowStatus(UserLessonProgress ulp, string BaseServerID = null)
    {
            
      
            completed.Visible = true;
            save_progress.Visible = false;
        
    }

    protected void save_progress_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        String user_id = HttpContext.Current.User.Identity.GetUserId();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName).First();
        LessonMenu menu = db.LessonMenus.Where(q => q.DreamLayoutID == page.id).First();
        List<UserLessonProgress> data = db.UserLessonProgresses.Where(q => q.LessonMenu.DreamLayoutID == page.id && q.AspNetUser_id == user_id).ToList();
        var progressDetails = db.DreamPageControls.Where(w => w.Layout_ID == page.id && w.BaseDreamServer_ID == BaseDreamControl_ServerID).First();

        //if (data.Count == 0)
        //{
            UserLessonProgress ulp = new UserLessonProgress
            {
                menu_id = menu.id,
                AspNetUser_id = user_id,
                progress = Convert.ToDecimal(progressDetails.TotalProgress),
            };
            db.UserLessonProgresses.Add(ulp);
            db.SaveChanges();
            ShowStatus(ulp);
        //}

    }
}
