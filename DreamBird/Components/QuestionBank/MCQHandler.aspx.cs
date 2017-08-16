using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_MCQHandler : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString.HasKeys())
            {
                int questionID = Convert.ToInt32(Request.QueryString["QID"].ToString());
                MCQHandler.BindData(questionID);
            }
        }
    }
}