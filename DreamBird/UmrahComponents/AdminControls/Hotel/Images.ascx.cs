using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Hotel_Images : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.QueryString["hotelID"]!=null)
            {
                int hid = int.Parse(Request.QueryString["hotelID"].ToString());
                bindData(hid);
            }
        }
    }
    public void bindData(int hid)
    {
        DreamBirdEntities db = new DreamBirdEntities();

       hotelImages_list.DataSource= db.HotelImages.Where(q => q.hotelID == hid).ToList();
        hotelImages_list.DataBind();
    }
    protected void addImage_clicked(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if (Page.IsValid)
        {
            int id = int.Parse(hotelImg_id.Text);
            if(Request.QueryString["hotelID"]!=null)
            {
                int hid = int.Parse(Request.QueryString["hotelID"].ToString());
                HotelImage hm = new HotelImage
                {
                    hotelID = hid,
                    mediaID = id,
                };
                db.HotelImages.Add(hm);
                db.SaveChanges();
                bindData(hid);
            }
        }
    }
   
    protected void SomeThingElseDone(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "<script type='text/javascript'>Sys.Application.add_load(OpenCollapse);</script>", false);
    }
    protected void CloseMediaBank(object sender, EventArgs e)
    {
        ModalPopupExtender1.Hide();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "a_key", "OpenMainsTabs();", true);
    }
    protected void MediaBankControl1_MediaSelected(object sender, EventArgs e)
    {
        EventArgMediaSelection evt = (EventArgMediaSelection)e;
        int media_id = evt.SelectedMedia;
        DreamBirdEntities db = new DreamBirdEntities();

        MediaItem media_item = db.MediaItems.Where(q => q.id == media_id).First();

        hotelImg_id.Text = media_item.id.ToString();
        ViewState["selectedImageID"] = media_item.id;
        ModalPopupExtender1.Hide();
        int id = int.Parse(hotelImg_id.Text);
        if (Request.QueryString["hotelID"] != null)
        {
            int hid = int.Parse(Request.QueryString["hotelID"].ToString());
            HotelImage hm = new HotelImage
            {
                hotelID = hid,
                mediaID = id,
            };
            db.HotelImages.Add(hm);
            db.SaveChanges();
            bindData(hid);
        }
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_key", "OpenMainsTabs();", true);

    }
    protected void MediaBankControl1_MyEvents(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    protected void MediaBankControl_SomeThindDone(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_key", "OpenMainsTabs();", true);
    }
    protected void delete_click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        HotelImage hf = db.HotelImages.Where(q => q.id == id).First();
        db.HotelImages.Remove(hf);
        db.SaveChanges();
        if (Request.QueryString["hotelID"] != null)
        {
            int hid = int.Parse(Request.QueryString["hotelID"].ToString());
            bindData(hid);
        }
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_key", "OpenMainsTabs();", true);
    }


}