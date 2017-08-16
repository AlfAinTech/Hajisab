using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for BaseDreamControlAdapter
/// </summary>
public class CoreDreamControlAdapter : System.Web.UI.UserControl,ICoreDreamControl
{
    public String BaseDreamControl_ClientID;
    public String BaseDreamControl_ServerID;
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
    public CoreDreamControlAdapter()
    
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

    public virtual void BindData3(List<News> list)
    {

    }

    public virtual void OnHideAdminEvent(object sender, EventArgs e)
    {
        
    }

    public virtual void SetBaseDreamControl(IBaseDreamControl baseDreamControl) {
        this.BaseDreamControl_ClientID = baseDreamControl.getBaseDreamClientID();
        this.BaseDreamControl_ServerID = baseDreamControl.getBaseDreamServerID();
    }

   
}