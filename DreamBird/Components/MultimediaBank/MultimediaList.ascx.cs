using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_MultimediaBank_MultimediaList : System.Web.UI.UserControl
{
    public event EventHandler ItemClicked;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            rptr_multimedia_list.DataSource = db.Multimediabanks.ToList();
            rptr_multimedia_list.DataBind();
        }
    }
    public void BindMedia(int id = 0)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if(id == 0)
        {
            rptr_multimedia_list.DataSource = db.Multimediabanks.ToList();
            rptr_multimedia_list.DataBind();
        }
        else
        {
            rptr_multimedia_list.DataSource = db.Multimediabanks.Where(w => w.id == id).ToList();
            rptr_multimedia_list.DataBind();
        }
    }
    protected void item_multimedia_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        int itemID = Convert.ToInt32(lb.Attributes["data-mmid"].ToString());
        EventArgDreamEdit evt = new EventArgDreamEdit();
        evt.DreamEditID = itemID;
        if (ItemClicked != null)
        {
            ItemClicked(this, evt);
        }
    }
}