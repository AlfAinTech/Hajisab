using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_NewControls_NewsDetail : CoreDreamControlAdapter
{ 
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    override
    public void BindData2(int News_id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        Repeater1.DataSource = db.News.Where(w => w.id == News_id).ToList();
        Repeater1.DataBind();
    }
    
}