using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_CustomConfiguration_CustomHotel : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }

    }
    public void dataBind(int id)
    {
        ViewState["SelectedhotelID"] = id.ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        CustomHotel_List.DataSource = db.Accommodations.Where(q => q.hotelID == id).ToList();
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
            TextBox price_txtAdd = (TextBox)item.FindControl("price_txtAdd");
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
            if (ViewState["SelectedhotelID"] != null)
            {
                int hotelID = int.Parse(ViewState["SelectedhotelID"].ToString());
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
                clearControl();
            }
            else
            {

            }
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

        TextBox Accomname_txtAdd = (TextBox)item.FindControl("Accomname_txt");
        TextBox txtDistanceAdd = (TextBox)item.FindControl("txtDistance");
        TextBox price_txtAdd = (TextBox)item.FindControl("price_txtAdd");
        DropDownList star_list = (DropDownList)item.FindControl("star_list");
        DropDownList ddlCity = (DropDownList)item.FindControl("ddlCity");
        TextBox Month = (TextBox)item.FindControl("txtMonth");

        LinkButton edit_btn = (LinkButton)item.FindControl("edit_btn");
        LinkButton delete_btn = (LinkButton)item.FindControl("delete_btn");
        LinkButton update_btn = (LinkButton)item.FindControl("update_btn");
        Accomname_txtAdd.Enabled = txtDistanceAdd.Enabled = price_txtAdd.Enabled = star_listAdd.Enabled = ddlCityAdd.Enabled = Month.Enabled = update_btn.Visible = isEdit;
        delete_btn.Visible = edit_btn.Visible = !isEdit;


    }
}