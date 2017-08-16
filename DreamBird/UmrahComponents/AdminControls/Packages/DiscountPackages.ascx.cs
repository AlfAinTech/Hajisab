using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Packages_DiscountPackages : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dataBind();
        }
    }
    public void dataBind()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if(Request.QueryString["packageID"] != null) {
            int package_id = int.Parse(Request.QueryString["packageID"].ToString());
        packages_list.DataSource = db.DiscountPackages.Where(q=>q.packageDetailID==package_id).ToList();
        packages_list.DataBind();
        }
        // ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab('Accommodations')", true);

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
        DiscountPackage vp = db.DiscountPackages.Where(q => q.id == id).First();
        db.DiscountPackages.Remove(vp);
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
        TextBox tname = (TextBox)item.FindControl("name_txt");
        TextBox tpercent = (TextBox)item.FindControl("percent_txt");
        TextBox availableFrom = (TextBox)item.FindControl("availableFrom_txt");
        TextBox availableTill = (TextBox)item.FindControl("availableTill_txt");
        DiscountPackage ac = db.DiscountPackages.Where(q => q.id == id).First();
            DateTime from = DateTime.Parse(availableFrom.Text);
            DateTime till = DateTime.Parse(availableTill.Text);
            if (from > till) { ShowError("invalid Date Limit"); return; }
        float value = float.Parse(tpercent.Text);
        ac.name = tname.Text;
        ac.discountPercent = Math.Round( float.Parse(tpercent.Text),2);
        ac.availableFrom = DateTime.Parse(availableFrom.Text.ToString());
        ac.availableTill = DateTime.Parse(availableTill.Text.ToString());
        db.SaveChanges();
        ToggleElements(item, false);

    }
    }
    protected void AddNewDiscountPackages_Clicked(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {   
            if (Request.QueryString["packageID"] != null ) {
                int package_id = int.Parse(Request.QueryString["packageID"].ToString());
            DreamBirdEntities db = new DreamBirdEntities();
                DateTime from = DateTime.Parse(AddavailableFrom_txt.Text);
                DateTime till = DateTime.Parse(AddavailableTill_txt.Text);
                if (from > till) { ShowError("invalid Date Limit"); return; }
                float value = float.Parse(addpercent_txt.Text);
                

                if (db.DiscountPackages.Where(q => q.name == addTitle_txt.Text).Count() == 0)
            {
                DiscountPackage ac = new DiscountPackage
                {
                    name = addTitle_txt.Text,
                    discountPercent = Math.Round( float.Parse(addpercent_txt.Text),2),
                    availableFrom = from,
                    availableTill = till,
                    packageDetailID=package_id,

                };
                db.DiscountPackages.Add(ac);
                db.SaveChanges();
                clearControl();
                dataBind();
            }
            else
            {
                ShowError("Package Title Already Exist! Change the Name and try again");
                return;
            }
            }
        }
        else
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
        addpercent_txt.Text = "";
        addTitle_txt.Text = "";
        AddavailableFrom_txt.Text = "";
        AddavailableTill_txt.Text = "";
    }
    private void ToggleElements(RepeaterItem item, bool isEdit)
    {
        //Toggle Buttons.

        TextBox tname = (TextBox)item.FindControl("name_txt");
        TextBox tprice = (TextBox)item.FindControl("percent_txt");
        TextBox availableFrom = (TextBox)item.FindControl("availableFrom_txt");
        TextBox availableTill = (TextBox)item.FindControl("availableTill_txt");
        LinkButton edit_btn = (LinkButton)item.FindControl("edit_btn");
        LinkButton delete_btn = (LinkButton)item.FindControl("delete_btn");
        LinkButton update_btn = (LinkButton)item.FindControl("update_btn");
        tname.Enabled = tprice.Enabled = availableFrom.Enabled = availableTill.Enabled = update_btn.Visible = isEdit;
        delete_btn.Visible = edit_btn.Visible = !isEdit;


    }
}