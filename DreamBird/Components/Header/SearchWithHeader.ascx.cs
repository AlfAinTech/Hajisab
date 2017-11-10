using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Header_SearchWithHeader : CorePackageControlAdapter, ISearch
{
    
    public event EventHandler DoSearch;

    protected void Page_Load(object sender, EventArgs e)
    {

        PackageUtil.SearchInterface = (ISearch)this;
        DoSearch += sudo_searcher;
    }

    protected void sudo_searcher(object sender, EventArgs e)
    {

    }

    public void search_dream_Click(object sender, EventArgs e)
    {
        
        String PackageName = SearchBox.Text;
        EventArgPackageSearch evt = new EventArgPackageSearch();
        evt.SearchPackageName = PackageName;
        if(DoSearch != null)
        {
            DoSearch(this, evt);
        }
       
    }
}