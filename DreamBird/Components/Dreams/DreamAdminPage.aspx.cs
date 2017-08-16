using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamAdminPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void dream_clicked(object sender, EventArgs e)
    {
        EventArgDreamEdit evt = (EventArgDreamEdit)e;
        int id = evt.DreamEditID;
        enableDreamBasicInfo(id);

    }
    protected void dreamAdd_clicked(object sender, EventArgs e)
    {
        DreamBasicInfo.Visible = true;
        DreamBasicInfo.clearControl();
        DreamBasicInfo.enableInfo(false);



    }
   protected void enableDreamBasicInfo(int id)
    {
        DreamBasicInfo.EditDataBind(id);
        DreamBasicInfo.Visible = true;
        DreamBasicInfo.enableInfo(true);
    }
}