using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Package_PackageDetail : System.Web.UI.UserControl
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            if(ViewState["path"]!=null && ViewState["dreamID"] !=null) {
                int dreamID = int.Parse(ViewState["dreamID"].ToString());
                String path = ViewState["path"].ToString();
            Control control = Page.LoadControl(path);
                control.ID = "id1";
                IPackageTypeCore IControl = (IPackageTypeCore)control;
                IControl.BindData(dreamID);
                IControl.SaveClicked += new EventHandler(save_clicked_);
                PlaceHolder1.Controls.Clear();
                PlaceHolder1.Controls.Add(control);
            }

        }
        
    }
    public void bindData(String ControlPath,int pkgID)
    {
        ViewState["path"] = ControlPath;
        ViewState["dreamID"] = pkgID;
        Control control = Page.LoadControl(ControlPath);
        control.ID = "id1";
        IPackageTypeCore IControl = (IPackageTypeCore)control;
        IControl.BindData(pkgID);
        IControl.SaveClicked += new EventHandler(save_clicked_);
        PlaceHolder1.Controls.Clear();
        PlaceHolder1.Controls.Add(control);
    }
    public void save_clicked_(object sender, EventArgs e)
    {
       
    }
    public void clear()
    {
        ViewState.Clear();
       
    }
}