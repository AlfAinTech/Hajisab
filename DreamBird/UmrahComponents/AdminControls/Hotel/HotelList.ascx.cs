using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Hotel_HotelList : System.Web.UI.UserControl
{

    public event EventHandler AddClicked;
    public event EventHandler hotelCllicked;
    public event EventHandler ActivatePanels;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            BindData();
        }

    }
    public void BindData()
    {
        //  String url = string.Format("{0}", Page.Request.Url.PathAndQuery);
        // String dream_name = DreamUtil.getDreamNameFromURL(url).ToString();

        DreamBirdEntities db = new DreamBirdEntities();
       
        //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;
        String uid = HttpContext.Current.User.Identity.GetUserId();
        Hotel_data_list.DataSource = db.Hotels.ToList();
        if (HttpContext.Current.User.IsInRole("UmrahAdmin"))
        {
            Hotel_data_list.DataSource = db.Hotels.Where(q => q.AspNetUserID == uid).ToList();
        }
        Hotel_data_list.DataBind();




    }
    
    protected void hotel_btn_Click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        EventArgHotelClicked evt = new EventArgHotelClicked();
        evt.hotelID = id;
        ViewState["SelectedHotelID"] = id;
        //dreamEdit(this, evt);
        
        hotelCllicked(this, evt);
        if (ActivatePanels != null)
        {
            ActivatePanels(this, EventArgs.Empty);
        }
       
    }

    protected void hotelSearch_hotelSearchrd(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();

        //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;
        EventArgHotelSearch evt = (EventArgHotelSearch)e;
        String searched_text = evt.SearchHotelName;
        String uid = HttpContext.Current.User.Identity.GetUserId();
        List<Hotel> result = db.Hotels.Where(q => q.hotelName.Contains(searched_text)).ToList();
        if (HttpContext.Current.User.IsInRole("UmrahAdmin"))
        {
            result = db.Hotels.Where(q => q.hotelName.Contains(searched_text) && q.AspNetUserID == uid).ToList();
        }
        if (result.Count() > 0)
        {
            Hotel_data_list.DataSource = result.ToList();
            Hotel_data_list.DataBind();
        }
        else
        {// ShowError("No items match your search");
        }
       

    }

    protected void add_btn_Click(object sender, EventArgs e)
    {
        AddClicked(this, EventArgs.Empty);
    }
    

}