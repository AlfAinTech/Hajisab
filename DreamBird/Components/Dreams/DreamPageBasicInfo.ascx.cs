using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamPageBasicInfo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void EditDataBind(int Id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        rptr_userRoles.DataSource = db.AspNetRoles.Where(w => w.Name != "Admin").ToList();
        rptr_userRoles.DataBind();

        var page = db.DreamLayouts.Where(w => w.id == Id).First();
        foreach (RepeaterItem item in rptr_userRoles.Items)
        {
            CheckBox cbox = item.FindControl("userrole") as CheckBox;
            string attr = cbox.Attributes["data-id"].ToString();
            string rolename = db.AspNetRoles.Where(w => w.Id == attr).Select(s => s.Name).First();
            if (db.DreamPageAuthorizations.Any(a => a.DreamLayout_id == page.id && a.PageRole == rolename))
            {
                var auth = db.DreamPageAuthorizations.Where(w => w.DreamLayout_id == page.id && w.PageRole == rolename).First();
                cbox.Checked = Convert.ToBoolean(auth.isAllowed);
            }
        }

        Page_Name.Text = page.Page;
        Dream_ID.Value = page.DreamID.ToString();
        published.Checked = page.IsPublished;
        if (page.LayoutType != null)
        {
            Page_Type.SelectedValue = page.LayoutType;
        }
        navigate.NavigateUrl = "../../UmrahHome/" + page.Dream.DreamName + "/" + page.Page;
    }
}