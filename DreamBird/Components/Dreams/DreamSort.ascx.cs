using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamSort : System.Web.UI.UserControl
{
    public event EventHandler dreamSort;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        String dreamSortfield = ddlSort.SelectedItem.Value.ToString();
        EventArgDreamSort evt = new EventArgDreamSort();
        evt.DreamSortField = dreamSortfield;
        dreamSort(this, evt);
    }
}