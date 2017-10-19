using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_CustomConfiguration_CustomFlight : System.Web.UI.UserControl
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
        AirLineListAdd.DataSource = db.AirLines.ToList();
        AirLineListAdd.DataBind();
        CustomHotel_List.DataSource = db.CustomFlightConfigurations.ToList();
        CustomHotel_List.DataBind();
        //ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab('Accommodations');", true);

    }
    protected void editbutton_clicked(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        CustomFlightConfiguration ac = db.CustomFlightConfigurations.Where(q => q.id == id).First();
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        ToggleElements(item, true);
        //update respective packages

        // ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations);", true);

    }
    protected void deleteButton_clicked(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        CustomFlightConfiguration ac = db.CustomFlightConfigurations.Where(q => q.id == id).First();
        // int hotel_id = ac.;
        db.CustomFlightConfigurations.Remove(ac);
        db.SaveChanges();
        //  dataBind(hotel_id);
      //  ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations);", true);
    }
    protected void updatebutton_clicked(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            LinkButton lk = (LinkButton)sender;
            int id = int.Parse(lk.CommandArgument);
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            CheckBox IsRoundTrip = (CheckBox)item.FindControl("IsRoundTrip");
            TextBox price_txt = (TextBox)item.FindControl("price_txt");
            DropDownList AirLineList = (DropDownList)item.FindControl("AirLineList");
            TextBox Month = (TextBox)item.FindControl("txtMonth");
            DropDownList ClassList = (DropDownList)item.FindControl("ClassList");
            CustomFlightConfiguration ac = db.CustomFlightConfigurations.Where(q => q.id == id).First();
            ac.AirLineID = int.Parse(AirLineList.SelectedValue);
            ac.IsRoundTrip = IsRoundTrip.Checked;
            ac.EstimatedPrice = decimal.Parse(price_txt.Text);
            ac.Class = int.Parse(ClassList.SelectedValue);
            ac.Month = Convert.ToDateTime(Month.Text);
            db.SaveChanges();
            ToggleElements(item, false);
            //dataBind(ac.hotelID);

            //   ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations);", true);

        }
    }
    protected void AddNewCustomHotel_Clicked(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DreamBirdEntities db = new DreamBirdEntities();

            CustomFlightConfiguration ac = new CustomFlightConfiguration
            {
               
                EstimatedPrice = decimal.Parse(price_txtAdd.Text),
                IsRoundTrip = IsRoundTripAdd.Checked,
                AirLineID = int.Parse(AirLineListAdd.SelectedValue),
                Class = int.Parse(ClassListAdd.SelectedValue),
                Month = DateTime.Parse(txtMonthAdd.Text)
            };
            db.CustomFlightConfigurations.Add(ac);
            db.SaveChanges();
            clearControl(); dataBind();

        }
        //   ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations);", true);
    }
    public void clearControl()
    {
        txtMonthAdd.Text = "";
        ClassListAdd.ClearSelection();
        price_txtAdd.Text = "";
        IsRoundTripAdd.Checked = false;
        AirLineListAdd.ClearSelection();
    }
    private void ToggleElements(RepeaterItem item, bool isEdit)
    {
        //Toggle Buttons.

        CheckBox IsRoundTrip = (CheckBox)item.FindControl("IsRoundTrip");
        TextBox price_txt = (TextBox)item.FindControl("price_txt");
        DropDownList AirLineList = (DropDownList)item.FindControl("AirLineList");
        TextBox Month = (TextBox)item.FindControl("txtMonth");
        DropDownList ClassList = (DropDownList)item.FindControl("ClassList");

        LinkButton edit_btn = (LinkButton)item.FindControl("edit_btn");
        LinkButton delete_btn = (LinkButton)item.FindControl("delete_btn");
        LinkButton update_btn = (LinkButton)item.FindControl("update_btn");
        IsRoundTrip.Enabled = AirLineList.Enabled = price_txt.Enabled = ClassList.Enabled = Month.Enabled = update_btn.Visible = isEdit;
        delete_btn.Visible = edit_btn.Visible = !isEdit;


    }

    protected void CustomHotel_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType != ListItemType.Header && e.Item.ItemType != ListItemType.Footer)
        {
            DropDownList dp = (DropDownList)e.Item.FindControl("AirLineList");
            DropDownList city = (DropDownList)e.Item.FindControl("ClassList");
            CustomFlightConfiguration ch = (CustomFlightConfiguration)e.Item.DataItem;
            DreamBirdEntities db = new DreamBirdEntities();
            dp.DataSource = db.AirLines.ToList();
            dp.DataBind();
            dp.SelectedValue = ch.AirLineID.ToString();
            city.SelectedValue = ch.Class.ToString();
        }
    }
}