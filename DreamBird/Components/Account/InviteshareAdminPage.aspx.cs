using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Account_InviteshareAdminPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["LayoutID"] != null)
            {
                int layoutID = int.Parse(Request.QueryString["LayoutID"]);
                DreamBirdEntities db = new DreamBirdEntities();
                List<InviteSharePage> page = db.InviteSharePages.Where(q => q.LayoutID == layoutID).ToList();
                if (page.Count != 0)
                {
                    InviteSharePage Layout_page = page[0];
                   
                    share_text.Text = Layout_page.shareText;
                    share_url.Text = Layout_page.shareURL;
                }
                Page_id.Text = layoutID.ToString();


            }
        }

    }

    protected void save_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if(Page_id.Text != null) { 
        InviteSharePage t = new InviteSharePage
        {
            LayoutID = int.Parse(Page_id.Text),
            shareText = share_text.Text,
            shareURL = share_url.Text,
        };
        db.InviteSharePages.Add(t);
        db.SaveChanges();
    }
    }
}