using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_UmrahDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PackageEntities db = new PackageEntities();
            int DreamID = Convert.ToInt32(Request.QueryString["DID"].ToString());
            var dr = db.Packages.Where(w => w.id == DreamID).First();
            var dt = db.PackageTypes.Where(q => q.id == dr.PackageTypeID).ToList();
            if (dt.Count() != 0)
            {
                PackageType dtt = dt[0];
                if (dtt.DetailPath != null)
                {
                    PackageDetail.clear();
                    PackageDetail.bindData(dtt.DetailPath, dr.id);

                }
                else
                {
                }
            }
        }
    }
}