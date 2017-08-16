using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Packages_PackageSearch : System.Web.UI.UserControl
{
    public event EventHandler packageSearch;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void search_package_Click(object sender, EventArgs e)
    {
        string keyword = SearchBox.Text;

        if (!keyword.Equals(""))
        {
            EventArgPackageSearch evt = new EventArgPackageSearch();
            evt.packageSearchText = keyword;

            if (packageSearch != null)
                packageSearch(this, evt);
        }
        //TagControl.LoadScripts();
    }
}