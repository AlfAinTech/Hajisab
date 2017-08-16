using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_AccommodationsMakkah : System.Web.UI.UserControl,ICoreDreamControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        Dream d = db.Dreams.Where(q => q.DreamName == dreamName).First();
        var data = db.PackageDetails.Where(q => q.dreamID == d.id).ToList();
        if (data.Count() != 0)
        {
            PackageDetail pd = data[0];
            bindData(pd.hotelIDMakkah);
        }
    }
    public void bindData(int hotelmakkahID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        accommodation_list.DataSource = db.Accommodations.Where(q => q.hotelID == hotelmakkahID && q.availability == true).ToList();
        accommodation_list.DataBind();
        if(accommodation_list.DataSource!=null)
        {
            RepeaterItem item = accommodation_list.Items[0];
             RadioButton rb = (RadioButton)item.FindControl("isselected_btn");
            rb.Checked = true;
            accomodation_changed(rb, EventArgs.Empty);
        }
    }

    protected void accomodation_changed(object sender, EventArgs e)
    {

        RadioButton rd = (RadioButton)sender;
        int id = 0;
        foreach (RepeaterItem item in accommodation_list.Items)
        {
            RadioButton rb = (RadioButton)item.FindControl("isselected_btn");
            if (rb != rd)
            {
                rb.Checked = false;

            }
            else
            {
                Label lb = (Label)item.FindControl("id_lbl");
                id = int.Parse(lb.Text);
                ViewState["selectedID"] = id.ToString();
                Session["AIDMakkah"] = id.ToString();
            }
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