﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminPages_Hotel_HotelAccommodation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Request.QueryString["hotelID"] != null)
            {
                int hotel_id = int.Parse(Request.QueryString["hotelID"]);
                Accommodation.dataBind(hotel_id);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "b_key", "selectedItem(" + hotel_id + ");", true);
            }
        }
    }
}