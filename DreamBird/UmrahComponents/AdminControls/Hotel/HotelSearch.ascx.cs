using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Hotel_HotelSearch : System.Web.UI.UserControl
{
    public event EventHandler hotelSearch;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

   

    public void BindData()
    {
        //throw new NotImplementedException();
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {
        //throw new NotImplementedException();
    }

    protected void search_hotel_Click(object sender, EventArgs e)
    {
        string keyword = SearchBox.Text;

        if (!keyword.Equals(""))
        {
            EventArgHotelSearch evt = new EventArgHotelSearch();
            evt.SearchHotelName = keyword;

            if (hotelSearch != null)
                hotelSearch(this, evt);
        }
        //TagControl.LoadScripts();
    }
}