using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for BasePackageControlAdapter
/// </summary>
public class CorePackageControlAdapter : System.Web.UI.UserControl,ICorePackageControl
{
    public String BasePackageControl_ClientID;
    public String BasePackageControl_ServerID;
    private Boolean isShowAdminControls;
  
    public bool IsShowAdminControls
    {
        get
        {
            return isShowAdminControls;
        }

        set
        {
            isShowAdminControls = value;
        }
    }
    public CorePackageControlAdapter()
    
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public virtual void OnShowAdminEvent(object sender, EventArgs e) { }

    public virtual void BindData()
    {
        
    }

    public virtual void BindData2(int id)
    {

    }

  

    public virtual void OnHideAdminEvent(object sender, EventArgs e)
    {
        
    }

    public virtual void SetBasePackageControl(IBasePackageControl BasePackageControl) {
        this.BasePackageControl_ClientID = BasePackageControl.getBasePackageClientID();
        this.BasePackageControl_ServerID = BasePackageControl.getBasePackageServerID();
    }

   
}