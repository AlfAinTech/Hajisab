using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_VisaPackages_VisaPackage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            dataBind();
        }
    }
    public void dataBind()
    {
        String uid = HttpContext.Current.User.Identity.GetUserId();
        DreamBirdEntities db = new DreamBirdEntities();
        visa_list.DataSource = db.VisaPackages.ToList();
        if (HttpContext.Current.User.IsInRole("UmrahAdmin"))
        {
            visa_list.DataSource = db.VisaPackages.Where(q => q.AspNetUserID == uid).ToList();
        }
        visa_list.DataBind();
       // ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab('Accommodations')", true);

    }

    protected void fromDate_TextChanged(object sender, EventArgs e)
    {
      
           // bindLimitedData(fromDate.Text, toDate.Text);
        
    }
  

    protected void toDate_TextChanged(object sender, EventArgs e)
    {
       
          //  bindLimitedData(fromDate.Text, toDate.Text);
        
    }
    protected void bindLimitedData(String fd, String td)
    {
        if (Page.IsValid) { 
        String uid = HttpContext.Current.User.Identity.GetUserId();
        DreamBirdEntities db = new DreamBirdEntities();
        List<VisaPackage> data = db.VisaPackages.ToList();
        if (HttpContext.Current.User.IsInRole("UmrahAdmin")) { data.Where(q => q.AspNetUserID == uid); }
        if (fd != "")
        {
            DateTime fromdate = DateTime.Parse(fd);
            if (td != "")
            {
                DateTime todate = DateTime.Parse(td);
                visa_list.DataSource = data.Where(q =>  q.issueDate >= fromdate && q.issueDate <= todate && q.AspNetUserID==uid).ToList();

            }
            else { visa_list.DataSource = data.Where(q =>  q.issueDate >= fromdate && q.AspNetUserID == uid).ToList(); }
        }
        else
        {
            visa_list.DataSource = data.Where(q=>q.AspNetUserID == uid).ToList();
        }
        visa_list.DataBind();
    }
    }
    protected void editbutton_clicked(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        ToggleElements(item, true);
       // ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations)", true);

    
    }
    protected void deleteButton_clicked(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
       VisaPackage vp = db.VisaPackages.Where(q => q.id == id).First();
        db.VisaPackages.Remove(vp);
        db.SaveChanges();
        dataBind();
        //ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations)", true);
    }
    protected void updatebutton_clicked(object sender, EventArgs e)
    {
        if (Page.IsValid) { 
        DreamBirdEntities db = new DreamBirdEntities();
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        TextBox tname = (TextBox)item.FindControl("visaTitle_txt");
        TextBox tprice = (TextBox)item.FindControl("amount_txt");
        TextBox availableFrom = (TextBox)item.FindControl("availableFrom_txt");
        TextBox availableTill = (TextBox)item.FindControl("availableTill_txt");
            DateTime issueDate = DateTime.Parse(availableFrom.Text.ToString());
            DateTime expireDate = DateTime.Parse(availableTill.Text.ToString());
            if (issueDate > expireDate) {
                ShowError("Invalid Date Limit");
                return;
            }
            VisaPackage ac = db.VisaPackages.Where(q => q.id == id).First();
        ac.visaTitle = tname.Text;
        ac.amount = float.Parse(tprice.Text);
        ac.issueDate = DateTime.Parse(availableFrom.Text.ToString());
        ac.expireDate = DateTime.Parse(availableTill.Text.ToString());
        db.SaveChanges();
        ToggleElements(item, false);
        //update respective Packages Range
        List<PackageDetail> packages = db.PackageDetails.Where(q => q.visaID == id).ToList();
        foreach(PackageDetail pd in packages)
        {
            pd.minRange = pd.minAmount;
            pd.maxRange = pd.maxAmount;
            db.SaveChanges();
        }
        //dataBind(ac.hotelID);
        //ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations)", true);


    }
    }
    protected void AddNewVisaPackages_Clicked(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DateTime issueDate = DateTime.Parse(AddavailableFrom_txt.Text.ToString());
            DateTime expireDate = DateTime.Parse(AddavailableTill_txt.Text.ToString());
            if (issueDate > expireDate)
            {
                ShowError("Invalid Date Limit");
                return;
            }
            String uid = HttpContext.Current.User.Identity.GetUserId();
            DreamBirdEntities db = new DreamBirdEntities();
            if (db.VisaPackages.Where(q=>q.visaTitle == addTitle_txt.Text && q.AspNetUserID==uid).Count() == 0) { 
                VisaPackage ac = new VisaPackage
            {
                visaTitle = addTitle_txt.Text,
                amount = float.Parse(addAmount_txt.Text),
                issueDate = DateTime.Parse(AddavailableFrom_txt.Text),
                expireDate = DateTime.Parse(AddavailableTill_txt.Text),
                AspNetUserID=uid,
                };
                db.VisaPackages.Add(ac);
                db.SaveChanges();
                clearControl();
                dataBind();
            }
            else
            {
                ShowError("Visa Title Already Exist! Change the Name and try again");
                return;
            }
        }else
        {
           
        }
    }
    // ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations)", true);
    public void ShowError(String errorMsg)
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "alert('" + errorMsg + "');", true);
    }
    public void clearControl()
    {
        addAmount_txt.Text = "";
        addTitle_txt.Text = "";
        AddavailableFrom_txt.Text = "";
        AddavailableTill_txt.Text = "";
    }
    private void ToggleElements(RepeaterItem item, bool isEdit)
    {
        //Toggle Buttons.
        
        TextBox tname = (TextBox)item.FindControl("visaTitle_txt");
        TextBox tprice = (TextBox)item.FindControl("amount_txt");
        TextBox availableFrom = (TextBox)item.FindControl("availableFrom_txt");
        TextBox availableTill = (TextBox)item.FindControl("availableTill_txt");
        LinkButton edit_btn = (LinkButton)item.FindControl("edit_btn");
        LinkButton delete_btn = (LinkButton)item.FindControl("delete_btn");
        LinkButton update_btn = (LinkButton)item.FindControl("update_btn");
        tname.Enabled = tprice.Enabled = availableFrom.Enabled = availableTill.Enabled = update_btn.Visible = isEdit;
        delete_btn.Visible = edit_btn.Visible = !isEdit;


    }

    
}