using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_CustomConfiguration_CustomHotelUC : System.Web.UI.UserControl
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
        CustomHotel_List.DataSource = db.CustomHotelConfigurations.ToList();
        CustomHotel_List.DataBind();
        //ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab('Accommodations');", true);

    }
    protected void editbutton_clicked(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        CustomHotelConfiguration ac = db.CustomHotelConfigurations.Where(q => q.id == id).First();
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
        CustomHotelConfiguration ac = db.CustomHotelConfigurations.Where(q => q.id == id).First();
        // int hotel_id = ac.;
        db.CustomHotelConfigurations.Remove(ac);
        db.SaveChanges();
        //  dataBind(hotel_id);
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations);", true);
    }
    protected void updatebutton_clicked(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            LinkButton lk = (LinkButton)sender;
            int id = int.Parse(lk.CommandArgument);
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            TextBox Accomname_txtAdd = (TextBox)item.FindControl("Accomname_txt");
            TextBox txtDistanceAdd = (TextBox)item.FindControl("txtDistance");
            TextBox price_txtAdd = (TextBox)item.FindControl("price_txt");
            DropDownList star_list = (DropDownList)item.FindControl("star_list");
            TextBox Month = (TextBox)item.FindControl("txtMonth");
            DropDownList ddlCity = (DropDownList)item.FindControl("ddlCity");
            CustomHotelConfiguration ac = db.CustomHotelConfigurations.Where(q => q.id == id).First();
            ac.AccommodationType = Accomname_txtAdd.Text;
            ac.Distance = long.Parse(txtDistanceAdd.Text);
            ac.EstimatedPrice = decimal.Parse(price_txtAdd.Text);
            ac.Rating = int.Parse(star_list.SelectedValue);
            ac.Month = Convert.ToDateTime(Month.Text);
            ac.HotelCity = ddlCity.SelectedValue;
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

            CustomHotelConfiguration ac = new CustomHotelConfiguration
            {
                AccommodationType = Accomname_txtAdd.Text,
                EstimatedPrice = decimal.Parse(price_txtAdd.Text),
                Rating = int.Parse(star_listAdd.SelectedValue),
                Distance = long.Parse(txtDistanceAdd.Text),
                HotelCity = ddlCityAdd.SelectedValue,
                Month = DateTime.Parse(txtMonthAdd.Text)
            };
            db.CustomHotelConfigurations.Add(ac);
            db.SaveChanges();
            clearControl(); dataBind();

        }
        //   ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Accommodations);", true);
    }
    public void clearControl()
    {
        txtMonthAdd.Text = "";
        txtDistanceAdd.Text = "";
        price_txtAdd.Text = "";
        Accomname_txtAdd.Text = "";
        ddlCityAdd.ClearSelection();
        star_listAdd.ClearSelection();
    }
    private void ToggleElements(RepeaterItem item, bool isEdit)
    {
        //Toggle Buttons.

        TextBox Accomname_txt = (TextBox)item.FindControl("Accomname_txt");
        TextBox txtDistance = (TextBox)item.FindControl("txtDistance");
        TextBox price_txt = (TextBox)item.FindControl("price_txt");
        DropDownList star_list = (DropDownList)item.FindControl("star_list");
        DropDownList ddlCity = (DropDownList)item.FindControl("ddlCity");
        TextBox Month = (TextBox)item.FindControl("txtMonth");

        LinkButton edit_btn = (LinkButton)item.FindControl("edit_btn");
        LinkButton delete_btn = (LinkButton)item.FindControl("delete_btn");
        LinkButton update_btn = (LinkButton)item.FindControl("update_btn");
        Accomname_txt.Enabled = txtDistance.Enabled = price_txt.Enabled = star_list.Enabled = ddlCity.Enabled = Month.Enabled = update_btn.Visible = isEdit;
        delete_btn.Visible = edit_btn.Visible = !isEdit;


    }

    protected void CustomHotel_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType != ListItemType.Header && e.Item.ItemType != ListItemType.Footer)
        {
            DropDownList dp = (DropDownList)e.Item.FindControl("star_list");
            DropDownList city = (DropDownList)e.Item.FindControl("ddlCity");
            CustomHotelConfiguration ch = (CustomHotelConfiguration)e.Item.DataItem;
            dp.SelectedValue = ch.Rating.ToString();
            city.SelectedValue = ch.HotelCity.ToString();
        }
    }
}