using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_BestUmrahPackages : System.Web.UI.UserControl,ICoreDreamControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Databind();
        }
    }
    public void Databind()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        BetsPackages_list.DataSource = db.PackageDetails.Where(q => q.Dream.IsFeatured).ToList();
        BetsPackages_list.DataBind();
    }
    protected void bookNowClick(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        int id = int.Parse(b.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        PackageDetail pd = db.PackageDetails.Where(q => q.id == id).First();
        DreamLayout dl = db.DreamLayouts.Where(q => q.DreamID == pd.dreamID && q.Page == "BookingForm").First();
        Response.Redirect("~/UmrahHome/" + pd.Dream.DreamName + "/UmrahDetail");
    }

    public void BindData()
    {
        // throw new NotImplementedException();
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
        // throw new NotImplementedException();
    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {
        // throw new NotImplementedException();
    }
}