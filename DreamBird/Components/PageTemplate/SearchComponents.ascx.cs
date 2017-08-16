using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_SearchComponents : System.Web.UI.UserControl
{
    public event EventHandler SearchClicked;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        string SearchKeyword = search_components.Text;
        EventArgControlSearch evt = new EventArgControlSearch();
        evt.SearchKeyword = SearchKeyword;
        if(SearchClicked != null)
        {
            SearchClicked(this, evt);
        }
    }
}