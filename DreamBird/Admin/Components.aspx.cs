using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Components : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ControlCategoryList_CategoryClicked(object sender, EventArgs e)
    {
        EventArgControlSearch evt = (EventArgControlSearch)e;
        int id = evt.ControlCategory;
        ComponentsList.BindData(id);
    }

    protected void SearchComponents_SearchClicked(object sender, EventArgs e)
    {
        EventArgControlSearch evt = (EventArgControlSearch)e;
        string KeyWord = evt.SearchKeyword;
        ComponentsList.BindData(KeyWord);
    }

    protected void AddControlCategory_CategoryAdded(object sender, EventArgs e)
    {
        ControlCategoryList.BindData();
    }
}