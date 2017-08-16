using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Connect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void cmdConnect_Click(object sender, EventArgs e)
    {
        if (Page.IsValid) { 
        Session["token"] = txtToken.Text;
        Session["pythonServer"] = txtPythonServer.Text;
        if (Request.QueryString["PID"] != null)
        {
            int pid = int.Parse(Request.QueryString["PID"].ToString());
            DreamBirdEntities db = new DreamBirdEntities();
            var data = db.ChatAdmins.Where(q => q.layoutID == pid).ToList();
            if(data.Count()==0)
            {
                ChatAdmin c = new ChatAdmin
                {
                    tokenID = txtToken.Text,
                    serverID = txtPythonServer.Text,
                    layoutID = pid,
                };
                db.ChatAdmins.Add(c);

            }
            else
                { ChatAdmin c = data[0];
                c.tokenID = txtToken.Text;
                c.serverID = txtPythonServer.Text;
            }
            db.SaveChanges();
        }
        }
    }
}