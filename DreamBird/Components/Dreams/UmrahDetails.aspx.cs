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
            DreamBirdEntities db = new DreamBirdEntities();
            int DreamID = Convert.ToInt32(Request.QueryString["DID"].ToString());
            var dr = db.Dreams.Where(w => w.id == DreamID).First();
            var dt = db.DreamTypes.Where(q => q.id == dr.dreamTypeID).ToList();
            if (dt.Count() != 0)
            {
                DreamType dtt = dt[0];
                if (dtt.DetailPath != null)
                {
                    DreamDetail.clear();
                    DreamDetail.bindData(dtt.DetailPath, dr.id);

                }
                else
                {
                }
            }
        }
    }
}