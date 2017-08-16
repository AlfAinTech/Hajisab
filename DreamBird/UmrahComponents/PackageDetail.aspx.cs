using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_PackageDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["packageID"] != null)
            {
                int pkgID = int.Parse(Request.QueryString["packageID"].ToString());
                DreamBirdEntities db = new DreamBirdEntities();
                var data = db.PackageDetails.Where(q => q.dreamID == pkgID).ToList();
                if (data.Count != 0)
                {
                    PackageDetail pd = data[0];
                    package_name.Text = pd.Dream.DreamName;
                }
            }
        }
    }
}