using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_NAV_General_NavigationAdminSetting : CoreDreamControlAdapter
{
    private int navigation_selectedID;

   
    protected void Page_Load(object sender, EventArgs e)

    {
        if (!Page.IsPostBack)
        {
            enableNavigationView();

        }
    }



    protected void addNavigation_Click(object sender, EventArgs e)
    {
        enableNavigationAddView();
    }

    protected void NavigationAdd1_NavigationAdded(object sender, EventArgs e)
    {
        enableNavigationView();
        NavigationView.BindData();


    }
    protected void NavigationEdit1_NavigationEdited(object sender, EventArgs e)
    {
        enableNavigationView();
        NavigationView.BindData();

    }
    protected void NavigationEdit_NavigationEdit(object sender, EventArgs e)
    {  
        EventArgNavigation evt = (EventArgNavigation)e;
         navigation_selectedID = evt.SelectedNavigationID ;
        enableNavigationEditView(navigation_selectedID);


    }

    private void enableNavigationView() {
        NavigationView.Visible = true;
        NavigationAdd1.Visible = false;
        addNavigation.Visible = true;
        NavigationEdit.Visible = false;
     
      //  NavigationEdit.fi

    }

    private void enableNavigationEditView(int id)
    {
       NavigationEdit.navigationID = id;
      NavigationView.Visible = false;
        NavigationEdit.Visible = true;
        addNavigation.Visible = false;
        NavigationEdit.setData();




    }


    private void enableNavigationAddView()
    {
        NavigationView.Visible = false;
        NavigationAdd1.Visible = true;
        addNavigation.Visible = false;

    }
}