using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_QuestionBankAdmin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void QuestionTypeList_TypeClicked(object sender, EventArgs e)
    {
        EventArgQuestionTypes evt = (EventArgQuestionTypes)e;
        List<int> QuestionIDs = evt.QuestionTypeIDs;
        QuestionGrid.BindData(QuestionIDs);
    }
}