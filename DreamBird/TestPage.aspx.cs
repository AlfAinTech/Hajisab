using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DreamBird;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
public partial class TestPage : System.Web.UI.Page
{
    protected string ProviderName
    {
        get { return (string)ViewState["ProviderName"] ?? String.Empty; }
        private set { ViewState["ProviderName"] = value; }
    }

    protected string ProviderAccountKey
    {
        get { return (string)ViewState["ProviderAccountKey"] ?? String.Empty; }
        private set { ViewState["ProviderAccountKey"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    
        //ProviderName = IdentityHelper.GetProviderNameFromRequest(Request);
       // if (String.IsNullOrEmpty(ProviderName))
       // {
           // enableRegister();
       // }
       // else
        //{
        //  //  enableRegisterExternalLogin();
        //}
    
    }
    protected override void OnPreInit(EventArgs e)
    {

     
    }



    protected void sign_in_Click(object sender, EventArgs e)
    {
      //  enableLogin();
    }

    //protected void enableLogin()
    //{
    //    this.FindControl("Login1").Visible = true;
    //    this.FindControl("Register1").Visible = false;
    //    this.FindControl("RegisterExternalLogin1").Visible = false;

    //}
    //protected void enableRegister()
    //{
    //    this.FindControl("Login1").Visible = false;
    //    this.FindControl("Register1").Visible = true;
    //    this.FindControl("RegisterExternalLogin1").Visible = false;

    //}
    //protected void enableRegisterExternalLogin()
    //{
    //    this.FindControl("Login").Visible = false;
    //    this.FindControl("Register").Visible = false;
    //    RegisterExternalLogin.getLogin();
    //   // RegisterExternalLogin1 rg =   this.FindControl("RegisterExternalLogin1");
    //    this.FindControl("RegisterExternalLogin1).Visible = true;

    //}
}