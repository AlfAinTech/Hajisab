using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamPageListView : System.Web.UI.UserControl
{
    public event EventHandler DreamPageClicked;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void BindData(int DreamID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var pageids = db.DreamLayouts.Where(w => w.DreamID == DreamID).Select<DreamLayout, int?>(s => s.id).ToList();
        var lessonMenuPages = db.LessonMenus.Where(w => pageids.Contains(w.ParentLayoutID)).Select<LessonMenu, int?>(s => s.DreamLayoutID).ToList();
        rptr_dreamPageList.DataSource = db.DreamLayouts.Where(q => q.DreamID == DreamID && !lessonMenuPages.Contains(q.id)).ToList();
        rptr_dreamPageList.DataBind();
    }

    protected void lb_dreamPageList_Click(object sender, EventArgs e)
    {
        EventArgDreamEdit evt = new EventArgDreamEdit();
        LinkButton lb = sender as LinkButton;
        int PageID = Convert.ToInt32(lb.CommandName);
        evt.DreamEditID = PageID;
        if(DreamPageClicked != null)
        {
            DreamPageClicked(this, evt);
        }
    }
}