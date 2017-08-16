using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DreamBird;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
public partial class Account_Loginsetting : System.Web.UI.Page
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
        if (!IsPostBack) {
    if(Request.QueryString["returnURL"] != null)
    {
        ViewState["returnURL"] = Request.QueryString["returnURL"].ToString();
        }
        ProviderName = IdentityHelper.GetProviderNameFromRequest(Request);
        if (!String.IsNullOrEmpty(ProviderName))
        {
          
            enableRegisterExternalLogin();
                return;
        }
        if(Request.QueryString["Page"] != null)
            {
                if (Request.QueryString["Page"].ToString() == "register")
                {
                    enableRegister();
                }
               
            }
            else
            {
                enableLogin();
            }

        }
    }
    protected override void OnPreInit(EventArgs e)
    {


    }



    protected void sign_in_Click(object sender, EventArgs e)
    {
        enableLogin();
    }

    protected void enableLogin()
    {
        this.FindControl("Login_panel").Visible = true;
        this.FindControl("Register_panel").Visible = false;
        this.FindControl("RegisterExternalLogin_panel").Visible = false;

    }
    protected void enableRegister()
    {
        this.FindControl("Login_panel").Visible = false;
        this.FindControl("Register_panel").Visible = true;
        this.FindControl("RegisterExternalLogin").Visible = false;

    }
    protected void enableRegisterExternalLogin()
    {
        this.FindControl("Login_panel").Visible = false;
        this.FindControl("Register_panel").Visible = false;
        RegisterExternalLogin.getLogin();
        this.FindControl("RegisterExternalLogin_panel").Visible = true;

    }
    protected void enableForgetPassword()
    {
        this.FindControl("Login_panel").Visible = false;
        this.FindControl("Register_panel").Visible = false;
        this.FindControl("ForgetPassword_panel").Visible = true;

    }

    protected void register_link_Click(object sender, EventArgs e)
    {
        enableRegister();
    }
    protected void forgetPassword_clicked(object sender, EventArgs e)
    {
        enableForgetPassword();
    }
}