using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_SearchTextBank : System.Web.UI.UserControl
{
    public event EventHandler textSearch;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void search_text_Click(object sender, EventArgs e)
    {
        String DreamName = search_text.Text;
        EventArgSearchTextBank evt = new EventArgSearchTextBank();
        evt.searchTextBank_text = DreamName;
        textSearch(this, evt);
    }
}