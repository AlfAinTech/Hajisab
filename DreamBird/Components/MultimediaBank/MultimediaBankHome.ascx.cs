using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_MultimediaBank_MultimediaBankHome : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void MultimediaBasicInfo_BankSaved(object sender, EventArgs e)
    {
        MultimediaList.BindMedia();
    }

    protected void MultimediaList_ItemClicked(object sender, EventArgs e)
    {
        EventArgDreamEdit evt = e as EventArgDreamEdit;
        int bankID = evt.DreamEditID;
        MultimediaBasicInfo.BindData(bankID);
    }
}