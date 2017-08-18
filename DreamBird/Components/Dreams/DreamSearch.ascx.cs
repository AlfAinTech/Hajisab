using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamSearch : System.Web.UI.UserControl, ICoreDreamControl
{
    public event EventHandler dreamSearch;
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void search_dream_Click(object sender, EventArgs e)
    {
        string keyword = SearchBox.Text;

        if (!keyword.Equals(""))
        {
            EventArgDreamSearch evt = new EventArgDreamSearch();
            evt.SearchDreamName = keyword;
            
            if (dreamSearch != null)
                dreamSearch(this, evt);
        }
        //TagControl.LoadScripts();
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
}