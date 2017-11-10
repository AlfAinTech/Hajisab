using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Microsoft.AspNet.Identity;

using DreamBird;
using System.ComponentModel;

public partial class Components_Core_BasePackageControl : System.Web.UI.UserControl,IBasePackageControl
{
    private String defaultControl;
    private String adminSettingControl;
    private String userSettingControl;
    Control defaultControlInstance;

     [Editor("System.Windows.Forms.Design.StringCollectionEditor, System.Design",
"System.Drawing.Design.UITypeEditor, System.Drawing")]
    [PersistenceMode(PersistenceMode.InnerProperty)]
    public List<ListItem> AllowedRoles
    {
        get;
        set;
    }


    private Control admingSettingControlObject;
    private Control defaultSettingControlObject;



    public string DefaultControl
    {
        get
        {
            return defaultControl;
        }

        set
        {
            defaultControl = value;
        }
    }

    public string AdminSettingControl
    {
        get
        {
            return adminSettingControl;
        }

        set
        {
            adminSettingControl = value;
        }
    }

    public string UserSettingControl
    {
        get
        {
            return userSettingControl;
        }

        set
        {
            userSettingControl = value;
        }
    }

   
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!isValidRole()) {
       //     hideAllLinkButton();
            return;
        }
         
            

        defaultControlInstance = LoadControlObject(DefaultControl);
                 ICorePackageControl Idefault = (ICorePackageControl)defaultControlInstance;
                 phDefaultArea.Controls.Add(defaultControlInstance);
                 Idefault.SetBasePackageControl(this);
            
                 //enclose this in security pass of admin only for admin
           
        
            
 // enclose admin security enclose end.
            
            

           

       // }
    }

    private Control LoadControlObject(string path) {
        Control control = Page.LoadControl(path);
        ICorePackageControl CorePackageControl= (ICorePackageControl)control;
        CorePackageControl.BindData();
        return control;
    }




  

   

    
    public string getBasePackageClientID()
    {
        return this.ClientID;
    }

    public Boolean isValidRole() {

        if (AllowedRoles == null) {
            return true; //incase allowed roles not defined for any control then consider it as all
        }
       
        if (AllowedRoles.Contains(new ListItem("All","All"))) {
           return true;
        }
        
        if (AllowedRoles.Contains(new ListItem("Anonymous", "Anonymous")) && !Page.User.Identity.IsAuthenticated) {
            return true;
        }

        
        if (AllowedRoles.Contains(new ListItem("LoginUser", "LoginUser")) && Page.User.Identity.IsAuthenticated) {
            return true;
        }

        foreach (ListItem role in AllowedRoles) {
            if (Page.User.IsInRole(role.Value))
            {

                return true;
            }

        }


        return false;

    }

    public Control getDefaultControl()
    {
        return defaultControlInstance;
    }

    public string getBasePackageServerID()
    {
        return this.ID;
    }

    public string GetDefaultPackageControlName()
    {
        return this.defaultControl;
    }
}