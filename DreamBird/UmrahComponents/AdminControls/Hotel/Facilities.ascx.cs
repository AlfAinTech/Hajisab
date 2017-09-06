using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Hotel_Facilities : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
     
        
    }
    protected void MediaBankControl_SomeThindDone(object sender, EventArgs e)
    {
       // ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_key", "OpenMainsTabs();", true);
    }
    protected void SomeThingElseDone(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "<script type='text/javascript'>Sys.Application.add_load(OpenCollapse);</script>", false);
    }
    protected void MediaBankControl1_MediaSelected(object sender, EventArgs e)
    {
        MediaItem media_item;
        EventArgMediaSelection evt = (EventArgMediaSelection)e;
        DreamBirdEntities db = new DreamBirdEntities();
        int media_id = evt.SelectedMedia;
        media_item = db.MediaItems.Where(q => q.id == media_id).First();
        if ( media_item.mediaType == "image")
        {
            facility_imgAdd.ImageUrl = media_item.Path100;
            facility_videoAdd.Visible = false;
            facility_imgAdd.Visible = true;
            facility_imgAdd.Style.Add("display", "block");
            facility_videoAdd.Style.Add("display", "none");
        }
        else if (media_item.mediaType == "video")
        {
            facility_imgAdd.Visible = false;
            facility_videoAdd.Visible = true;
            facility_videoAdd.Src = media_item.Path480;
            facility_videoAdd.Attributes.Add("controls", "");
            facility_imgAdd.Style.Add("display", "none");
            facility_videoAdd.Style.Add("display", "block");
        }
        facility_imgAdd.ImageUrl = media_item.Path500;//.path;
        facilityImg_id.Text = media_item.id.ToString();
        ViewState["selectedImageID"] = media_item.id;
        ModalPopupExtender1.Hide();
        //ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_key", "OpenMainsTabs();", true);

    }
    protected void MediaBankControl1_MyEvents(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    public void ShowError(String errorMsg)
    {
        //ErrorMessage.Text = errorMsg;
        //ErrorMessage.Visible = true;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "alert('" + errorMsg + "');", true);
    }
    protected void delete_click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        HotelFacility hf = db.HotelFacilities.Where(q => q.id == id).First();
        int hotel_id = hf.hotelID;
        db.HotelFacilities.Remove(hf);
        db.SaveChanges();
        bindData(hotel_id);
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "OpenTab(Facilities);", true);
    }
    protected void edit_click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        HotelFacility hf = db.HotelFacilities.Where(q => q.id == id).First();
        addName_txt.Text = hf.Name;
        Addavailable_chk.Checked = hf.availability;
        ViewState["selectedImageID"] = hf.MediaItem.id;
        ViewState["SelectedFacility"] = hf.id;
        facilityImg_id.Text = hf.mediaID.ToString();
        if (hf.MediaItem.mediaType == "Image")
        {
            facility_imgAdd.ImageUrl = hf.MediaItem.Path100;
            facility_videoAdd.Visible = false;
            facility_imgAdd.Visible = true;
            facility_imgAdd.Style.Add("display", "block");
            facility_videoAdd.Style.Add("display", "none");
        }
        else if (hf.MediaItem.mediaType == "video")
        {
            facility_imgAdd.Visible = false;
            facility_videoAdd.Visible = true;
            facility_videoAdd.Src = hf.MediaItem.Path480;
            facility_videoAdd.Attributes.Add("controls", "");
            facility_imgAdd.Style.Add("display", "none");
            facility_videoAdd.Style.Add("display", "block");
        }
        //ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Facilities);", true);

    }
    protected void add_btn_Clicked(object sender, EventArgs e)
    {
        if(Page.IsValid)
        {
            
            DreamBirdEntities db = new DreamBirdEntities();
            if (ViewState["SelectedFacility"] != null ) {
                int id = int.Parse(ViewState["SelectedFacility"].ToString());
              HotelFacility hf =  db.HotelFacilities.Where(q => q.id == id).First();
                hf.Name = addName_txt.Text;
                hf.availability = Addavailable_chk.Checked;
                hf.mediaID = int.Parse(facilityImg_id.Text);
                db.SaveChanges();
                bindData(hf.hotelID);

                }
            else
            {
                if( Request.QueryString["hotelID"] != null) {
                    int hotel_id = int.Parse(Request.QueryString["hotelID"].ToString());
                HotelFacility hf = new HotelFacility
                {
                    Name = addName_txt.Text,
                    availability = Addavailable_chk.Checked,
                    mediaID = int.Parse(facilityImg_id.Text),
                    hotelID = hotel_id,
                };
                db.HotelFacilities.Add(hf);
                    db.SaveChanges();
                    bindData(hotel_id);
                }
                else { }

            }
           
            clearControl();
            //ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Facilities);", true);

        }
    }

    public void clearControl()
    {
        addName_txt.Text = "";
        Addavailable_chk.Checked = false;
        facilityImg_id.Text = "";
        facility_imgAdd.ImageUrl = "";
        facility_videoAdd.Src = "";
        ViewState.Clear();
    }
    public void bindData(int hotel_id)
    {
        ViewState["SelectedhotelID"] = hotel_id;
        DreamBirdEntities db = new DreamBirdEntities();
        facility_list.DataSource = db.HotelFacilities.Where(q => q.hotelID == hotel_id).ToList();
        facility_list.DataBind();
        //ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab(Facilities);", true);

    }
}