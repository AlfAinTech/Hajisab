using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_QuestionGrid : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void BindData(List<int> QuestionTypeIDS)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        questionGrid.DataSource = db.QuestionBanks.Where(w => QuestionTypeIDS.Contains(w.TypeID)).OrderBy(o => o.QuestionType.id).ToList();
        questionGrid.DataBind();
    }
}