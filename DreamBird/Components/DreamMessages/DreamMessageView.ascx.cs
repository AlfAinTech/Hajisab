using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
public partial class Components_DreamMessages_DreamMessageView : CoreDreamControlAdapter
{
    protected void Page_Load(object sender, EventArgs e)
    
    
    {
    if(HttpContext.Current.User.Identity.IsAuthenticated) { 
        DreamBirdEntities db = new DreamBirdEntities();
        string current_userId = HttpContext.Current.User.Identity.GetUserId();
        DreamUserProfile dup = db.DreamUserProfiles.Where(q => q.AspNetUserId == current_userId).First();
        messages_list.DataSource = db.DreamMessages.Where(q => q.ReceiverId == dup.id).ToList();
        messages_list.DataBind();

    }
    }
}