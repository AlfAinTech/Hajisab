using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Flight_AirLineSearch : System.Web.UI.UserControl
{
    public event EventHandler AirLineSearch;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void search_AirLine_Click(object sender, EventArgs e)
    {
        string keyword = SearchBox.Text;

        
            EventArgAirLineSearch evt = new EventArgAirLineSearch();
            evt.SearcText = keyword;

            if (AirLineSearch != null)
                AirLineSearch(this, evt);
        
        //TagControl.LoadScripts();
    }
}