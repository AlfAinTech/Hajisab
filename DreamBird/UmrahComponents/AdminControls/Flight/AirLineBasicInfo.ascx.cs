using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Flight_AirLineBasicInfo : System.Web.UI.UserControl
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            bindData();
       
    }
    }
    protected void bindData()
    {
        if (Request.QueryString["airLineID"] != null)
        {
            String uid = HttpContext.Current.User.Identity.GetUserId();
            int aid = int.Parse(Request.QueryString["airLineID"].ToString());
            PackageEntities db = new PackageEntities();
            AirLine aa = db.AirLines.Where(q => q.id == aid ).First();
            name_txt.Text = aa.Name;
        }
    }
    protected void save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid) { 
        PackageEntities db = new PackageEntities();
        AirLine a = new AirLine();
            String uid = HttpContext.Current.User.Identity.GetUserId();
            var duplicateData = db.AirLines.Where(q => q.Name == name_txt.Text).ToList();
            if (duplicateData.Count() > 0)
            {
                ShowError("AirLine Already Exist");
                return;
            }
        if (Request.QueryString["airLineID"] != null)
        {
            int aid = int.Parse(Request.QueryString["airLineID"].ToString());
            
            a = db.AirLines.Where(q => q.id == aid).First();
            a.Name= name_txt.Text;
               
        }
        else
        {
            a.Name = name_txt.Text;
                a.AspNetUserID = uid;
                db.AirLines.Add(a);
        }
        db.SaveChanges();
        Response.Redirect("~/UmrahComponents/AdminPages/Flight/AirLineBasicInfo?airLineID=" + a.id);

    }
}
    public void ShowError(String errorMsg)
    {
        //ErrorMessage.Text = errorMsg;
        //ErrorMessage.Visible = true;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "alert('" + errorMsg + "');", true);
    }
}