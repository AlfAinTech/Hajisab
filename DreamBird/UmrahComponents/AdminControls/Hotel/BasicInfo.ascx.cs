using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Hotel_BasicInfo : System.Web.UI.UserControl
{
    public event EventHandler hotelAdded;
    public int selectedHotel;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
           
        }
    }

  

   

    protected void hotel_add_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            PackageEntities db;
            db = new PackageEntities();
            Hotel d;
            String uid = HttpContext.Current.User.Identity.GetUserId();
            if (ViewState["SelectedhotelID"] == null)
            {
                if (!(db.Hotels.Any(w => w.hotelName == hotelName_txt.Text)))
                {
                     d = new Hotel //Make sure you have a table called test in DB
                    {
                        hotelName = hotelName_txt.Text.ToString(),
                        mediaID = int.Parse(hotelImg_id.Text),
                        description = description_txt.InnerText.ToString(),
                        rating= int.Parse(star_list.SelectedValue),
                        distance = float.Parse(distance_txt.Text),
                        AspNetUserID=uid,
                        hotelType=hotelTypeList.SelectedValue,
                    };

                    db.Hotels.Add(d);
                    db.SaveChanges();
                    
                    ViewState["SelectedhotelID"] = Convert.ToInt32(d.id);
                    this.clearControl();
                   
                }
                else
                {
                    ShowError("Dream Already Exist! Change the Name and try again");
                    return;
                }

            }
            else
            {
                selectedHotel = int.Parse(ViewState["SelectedhotelID"].ToString());
                 d = db.Hotels.Where(q => q.id == selectedHotel).First();
                d.hotelName = hotelName_txt.Text;
                d.description = description_txt.InnerText.ToString();
                d.mediaID = int.Parse(hotelImg_id.Text);
                d.rating = 0;
                d.distance = Math.Round(float.Parse(distance_txt.Text),2);
                d.rating = int.Parse(star_list.SelectedValue);
                d.AspNetUserID = uid;
                d.hotelType = hotelTypeList.SelectedValue;
                db.SaveChanges();
                
            }
            if (hotelAdded != null)
            {
                EventArgHotelClicked evt = new EventArgHotelClicked();
                evt.hotelID = d.id;
                hotelAdded(this, evt);
            }
            //TagControl.LoadScripts();
            //  ScriptManager.RegisterStartupScript(Page, typeof(Page), "a_key", "OpenMainsTabs();", true);
            ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab('BasicInfo');", true);

        }
    }
    public void clearControl()
    {
        hotelName_txt.Text = "";
        description_txt.InnerText = "";
        hotelImg_id.Text = "";
        hotel_video.Src = "";
        hotel_video.Visible = false;
        hotel_img.Visible = true;
        hotel_img.ImageUrl = "";
        ViewState.Clear();
        distance_txt.Text = "0";
        hotelTypeList.SelectedIndex = 0;
        //navigation_chk_add.Checked = false;
        // MediaBank.lo.LoadScripts();
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab('BasicInfo');", true);
    }


    public void EditDataBind(int id)
    {
        PackageEntities db = new PackageEntities();
        Hotel dr = db.Hotels.Where(q => q.id == id).First();
        hotelName_txt.Text = dr.hotelName;
        description_txt.InnerText = dr.description;
        distance_txt.Text = dr.distance.ToString();
        star_list.SelectedValue = dr.rating.ToString();
        hotelTypeList.SelectedValue = dr.hotelType;
        MediaItem selected_hotel_img;
        if (dr.MediaItem != null)
        {
            selected_hotel_img = db.MediaItems.Where(q => q.id == dr.mediaID).First();

           // MediaBank.setMediaItem(selected_hotel_img.id);
            ViewState["selectedImageID"] = selected_hotel_img.id;
            hotelImg_id.Text = selected_hotel_img.id.ToString();
            if (selected_hotel_img.mediaType == "Image")
            {
                hotel_img.ImageUrl = selected_hotel_img.Path100;
                hotel_video.Visible = false;
                hotel_img.Visible = true;
                hotel_img.Style.Add("display", "block");
                hotel_video.Style.Add("display", "none");
            }
            else if (selected_hotel_img.mediaType == "video")
            {
                hotel_img.Visible = false;
                hotel_video.Visible = true;
                hotel_video.Src = selected_hotel_img.Path480;
                hotel_img.Style.Add("display", "none");
                hotel_video.Style.Add("display", "block");
                hotel_video.Attributes.Add("controls", "");
            }
        }
        ViewState.Clear();
        ViewState["SelectedhotelID"] = id;

        //navigation_chk_add.Checked = false;
        //  ScriptManager.RegisterStartupScript(Page, typeof(Page), "a_key", "OpenMainsTabs();", true);

        //   PageEdit
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab('BasicInfo');", true);
    }


    protected void CloseMediaBank(object sender, EventArgs e)
    {
        ModalPopupExtender1.Hide();
      //  ScriptManager.RegisterStartupScript(Page, typeof(Page), "a_key", "OpenMainsTabs();", true);
    }
    protected void MediaBankControl1_MediaSelected(object sender, EventArgs e)
    {
        EventArgMediaSelection evt = (EventArgMediaSelection)e;
        int media_id = evt.SelectedMedia;
        PackageEntities db = new PackageEntities();
        
        MediaItem media_item = db.MediaItems.Where(q=>q.id == media_id).First();
        if (media_item.mediaType.ToLower() == "image" || media_item.mediaType.ToLower() == "image")
        {
            hotel_img.ImageUrl = media_item.PathWithResolution;
            hotel_video.Visible = false;
            hotel_img.Visible = true;
            hotel_img.Style.Add("display", "block");
            hotel_video.Style.Add("display", "none");
        }
        else if (media_item.mediaType == "video")
        {
            hotel_img.Visible = false;
            hotel_video.Visible = true;
            hotel_video.Src = media_item.Path480;
            hotel_video.Attributes.Add("controls", "");
            hotel_img.Style.Add("display", "none");
            hotel_video.Style.Add("display", "block");
        }
        hotel_img.ImageUrl = media_item.Path500;//.path;
        hotelImg_id.Text = media_item.id.ToString();
        ViewState["selectedImageID"] = media_item.id;
        ModalPopupExtender1.Hide();
        //   ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_key", "OpenMainsTabs();", true);
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "OpenTab('BasicInfo');", true);
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

    protected void cmdSelectImage_Click(object sender, EventArgs e)
    {

    }
    protected void MediaBankControl_SomeThindDone(object sender, EventArgs e)
    {
      //  ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_key", "OpenMainsTabs();", true);
    }
    


}