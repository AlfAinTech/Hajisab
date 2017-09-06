using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_ConfirmationModalUC : System.Web.UI.UserControl
{
    [Description("Modal Title"), Category("Data")]
    public string ModalTitle
    {
        get { return ViewState["ModalTitle"] == null ? "Warning" : ViewState["ModalTitle"].ToString(); }
        set { ViewState["ModalTitle"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}