using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class User_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HttpContext.Current.User.Identity.IsAuthenticated)
        {

            Response.Redirect("~/DreamHome.aspx");
        }
        else
        {
            DreamBirdEntities db = new DreamBirdEntities();
            string user_id = HttpContext.Current.User.Identity.GetUserId();
            if (db.DreamEnrollments.Any(a => a.AspNetUserID == user_id))
            {
                List<int> enrolled_dreams = db.DreamEnrollments.Where(q => q.AspNetUserID == user_id).Select(s => s.dreamID).ToList();
                Random rand = new Random();
                int randomID = rand.Next(1, enrolled_dreams.Count);
                RelatedDreams.BindData1(randomID);
            }


            //resume_btn_clicked
        }
        //DreamEnrollment = db.DreamEnrollments.Where()

    }
}