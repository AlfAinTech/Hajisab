using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Hotel_Accommodations : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
           
        }
      
    }
    public void dataBind(int id)
    {
        ViewState["SelectedhotelID"] = id.ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        accommodation_list.DataSource = db.Accommodations.Where(q => q.hotelID == id).ToList();
        accommodation_list.DataBind();
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab('Accommodations');", true);

    }
    protected void editbutton_clicked(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse( lk.CommandArgument);
        Accommodation ac = db.Accommodations.Where(q => q.id == id).First();
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        ToggleElements(item, true);
        //update respective packages
        
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations);", true);
        
    }
    protected void deleteButton_clicked(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        Accommodation ac = db.Accommodations.Where(q => q.id == id).First();
        int hotel_id = ac.hotelID;
        db.Accommodations.Remove(ac);
        db.SaveChanges();
        dataBind(hotel_id);
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations);", true);
    }
    protected void updatebutton_clicked(object sender, EventArgs e)
    {
        if (Page.IsValid) { 
        DreamBirdEntities db = new DreamBirdEntities();
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        TextBox tname = (TextBox)item.FindControl("name_txt");
        TextBox tprice = (TextBox)item.FindControl("price_txt");
        CheckBox availablChk = (CheckBox)item.FindControl("available_chk");
        Accommodation ac = db.Accommodations.Where(q => q.id == id).First();
        ac.Name = tname.Text;
        ac.price = float.Parse(tprice.Text);
        ac.availability = availablChk.Checked;
        db.SaveChanges();
        ToggleElements(item, false);
        //dataBind(ac.hotelID);
        List<PackageDetail> packages = db.PackageDetails.Where(q => q.hotelIDMakkah == ac.hotelID || q.hotelIDMadina == ac.hotelID).ToList();
        foreach (PackageDetail pd in packages)
        {
            pd.minRange = pd.minAmount;
            pd.maxRange = pd.maxAmount;
            db.SaveChanges();
        }
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations);", true);

        }
    }
    protected void AddNewAccommodation_Clicked(object sender, EventArgs e)
    {
        if (Page.IsValid) { 
        DreamBirdEntities db = new DreamBirdEntities();
        if (ViewState["SelectedhotelID"] != null)
        {
            int hotelID = int.Parse(ViewState["SelectedhotelID"].ToString());
            Accommodation ac = new Accommodation
            {
                Name = addName_txt.Text,
                price = float.Parse(addPrice_txt.Text),
                availability = addAvailable_chk.Checked,
                hotelID = hotelID
            };
                db.Accommodations.Add(ac);
                db.SaveChanges();
                clearControl();
                dataBind(hotelID);
        }
        else
        {

        }
        }
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations);", true);
    }
    public void clearControl()
    {
        addName_txt.Text = "";
        addPrice_txt.Text = "";
        addAvailable_chk.Checked = false;
    }
    private void ToggleElements(RepeaterItem item, bool isEdit)
    {
        //Toggle Buttons.

        TextBox tname = (TextBox) item.FindControl("name_txt");
        TextBox tprice = (TextBox)item.FindControl("price_txt");
        CheckBox availablChk = (CheckBox) item.FindControl("available_chk");
        LinkButton edit_btn = (LinkButton)item.FindControl("edit_btn");
        LinkButton delete_btn = (LinkButton)item.FindControl("delete_btn");
        LinkButton update_btn = (LinkButton)item.FindControl("update_btn");
        tname.Enabled = tprice.Enabled = availablChk.Enabled  = update_btn.Visible = isEdit;
        delete_btn.Visible = edit_btn.Visible = !isEdit;

        
    }

}
