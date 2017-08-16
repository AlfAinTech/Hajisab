using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamAdminSetting : CoreDreamControlAdapter
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
    if(!IsPostBack)
    {
            enableDreamView();
    }

    }
    protected void dreamLiked_dreamLiked(object sender, EventArgs e)
    {
        enableDreamView();
    }
    protected void dreamEditClick_dreamEdit(object sender, EventArgs e)
    {
        EventArgDreamEdit evt = (EventArgDreamEdit)e;
       int id  = evt.DreamEditID;
        enableDreamEditView(id);

    }
    protected void addDream_btn_Click(object sender, EventArgs e)
    {
        enableDreamAddView();
    }
    protected void dreamAdd_dreamAdded(object sender, EventArgs e)
    {
        enableDreamView();
        
    }

    private void enableDreamView()
    {
        DreamView.BindData();
        DreamView.Visible = true;
        DreamAddEdit.Visible = false;
        //addNavigation.Visible = true;
        //NavigationEdit.Visible = false;
        addDream_btn.Visible = true;
        //  NavigationEdit.fi

    }

    private void enableDreamAddView()
    {
        //  NavigationEdit.navigationID = id;
        //   NavigationView.Visible = false;
        //   NavigationEdit.Visible = true;
        //    addNavigation.Visible = false;
        //NavigationEdit.setData();
        DreamAddEdit.FindControl("DreamPageEdit").Visible = false;
       DreamAddEdit.clearControl();
            DreamView.Visible = false;
            DreamAddEdit.Visible = true;
        addDream_btn.Visible = false;
       




    }
    private void enableDreamEditView(int id)
    {
        
        DreamView.Visible = false;
        DreamAddEdit.EditDataBind(id);
        DreamAddEdit.selectedDream = id;
        DreamAddEdit.Visible = true;
        addDream_btn.Visible = false;






    }



}