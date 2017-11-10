using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Package_PackageSearch : System.Web.UI.UserControl, ICorePackageControl
{
    public event EventHandler packageSearch;
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void search_dream_Click(object sender, EventArgs e)
    {
        string keyword = SearchBox.Text;

        
            EventArgPackageSearch evt = new EventArgPackageSearch();
            evt.SearchPackageName = keyword;
            
            if (packageSearch != null)
            packageSearch(this, evt);
        
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

    public void SetBasePackageControl(IBasePackageControl BasePackageControl)
    {
        //throw new NotImplementedException();
    }
}