using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_Style : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if(HttpContext.Current.User.Identity.Name == "admin")
            {
                styler.Enabled = true;
                Button1.Enabled = true;
            }
            string text = System.IO.File.ReadAllText(Server.MapPath("~/Content/css/style.css"));
            styler.Text = text;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string text = styler.Text;
        System.IO.File.WriteAllText(Server.MapPath("~/Content/css/style.css"), text);
    }
}