using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_TextBank_CustomTextBank_DeleteCustomTextBank : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            if(Request.QueryString["CID"] != null && Request.QueryString["DID"] != null && Request.QueryString["PID"] != null)
            {
                String control_id = Request.QueryString["CID"].ToString();
                int did = int.Parse(Request.QueryString["DID"]);
                int pid = int.Parse(Request.QueryString["PID"]);
                var data =  db.LayoutTextBanks.Where(q => q.IsShared == false && q.LayoutID == pid && q.ControlName == control_id).ToList();
                if(data.Count() !=0)
                {
                    LayoutTextBank ltb = data[0];
                    TextBank tb = db.TextBanks.Where(q => q.id == ltb.TextID).First();
                    db.LayoutTextBanks.Remove(ltb);
                    db.TextBanks.Remove(tb);
                    db.SaveChanges();
                    
                }
            }
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "", "window.close();", true);
        }
    }
}