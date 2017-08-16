using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuizBank_QuizBankAdmin : System.Web.UI.UserControl
{
    private string QuizMode;
    public string quizMode
    {
        get
        {
            return QuizMode;
        }
        set
        {
            QuizMode = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            QuizGrid.gridMode = QuizMode;
        }
    }

    protected void QuizSearched(object sender, EventArgs e)
    {

    }
}