using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Flight_AirLineList : System.Web.UI.UserControl
{
    public event EventHandler AddClicked;
    public event EventHandler AirLineCllicked;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            BindData();
        }

    }
    public void BindData()
    {
        //  String url = string.Format("{0}", Page.Request.Url.PathAndQuery);
        // String dream_name = PackageUtil.getPackageNameFromURL(url).ToString();

        PackageEntities db = new PackageEntities();

        //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;
        String uid = HttpContext.Current.User.Identity.GetUserId();
        AirLine_data_list.DataSource = db.AirLines.ToList();
        if (HttpContext.Current.User.IsInRole("UmrahAdmin")) { AirLine_data_list.DataSource = db.AirLines.Where(q => q.AspNetUserID == uid).ToList(); }
       
        AirLine_data_list.DataBind();




    }

    protected void airLine_btn_Click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int id = int.Parse(lk.CommandArgument);
        EventArgAirLineClicked evt = new EventArgAirLineClicked();
        evt.AirLineID = id;
        ViewState["SelectedAirLineID"] = id;
        //dreamEdit(this, evt);
        if (AirLineCllicked != null) {        AirLineCllicked(this, evt);
 }
        

    }

    protected void airLineSearch(object sender, EventArgs e)
    {
        PackageEntities db = new PackageEntities();

        //  int dream_id = db.Dreams.Where(dream => dream.DreamName == dream_name).First().id;
        EventArgAirLineSearch evt = (EventArgAirLineSearch)e;
        String searched_text = evt.SearcText;
        String uid = HttpContext.Current.User.Identity.GetUserId();
        List<AirLine> result = db.AirLines.Where(q => q.Name.Contains(searched_text)).ToList();
        if (HttpContext.Current.User.IsInRole("UmrahAdmin"))
        { result = db.AirLines.Where(q => q.Name.Contains(searched_text) && q.AspNetUserID == uid).ToList(); }
            if (result.Count() > 0)
        {
            AirLine_data_list.DataSource = result.ToList();
            AirLine_data_list.DataBind();
        }
        else
        { ShowError("No items match your search");
        }


    }

    protected void add_btn_Click(object sender, EventArgs e)
    {
        if (AddClicked != null) {        AddClicked(this, EventArgs.Empty);
 }
    }
    protected void ShowError(string errorMsg)
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "alert('" + errorMsg + "');", true);
    }
}