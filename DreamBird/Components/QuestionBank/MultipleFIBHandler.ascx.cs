using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_MultipleFIBHandler : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            if (db.QuestionCategories.Any())
            {
                ddl_cat.DataSource = db.QuestionCategories.ToList();
                ddl_cat.DataTextField = "CategoryName";
                ddl_cat.DataValueField = "id";
                ddl_cat.DataBind();
                ddl_cat.SelectedIndex = 0;
                int catid = Convert.ToInt32(ddl_cat.SelectedValue);
                if (db.QuestionSubCategories.Any(a => a.CategoryID == catid))
                {
                    ddl_sub_cat.DataSource = db.QuestionSubCategories.Where(w => w.CategoryID == catid).ToList();
                    ddl_sub_cat.DataTextField = "SubCategoryName";
                    ddl_sub_cat.DataValueField = "id";
                    ddl_sub_cat.DataBind();
                }
            }
            ddl_btax.DataSource = db.BloomsTaxonomies.ToList();
            ddl_btax.DataTextField = "TaxonomyName";
            ddl_btax.DataValueField = "id";
            ddl_btax.DataBind();
        }
    }

    public void BindData(int QuestionID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var MultiFIBMarkup = db.MultiFIBMarkups.Where(w => w.QuestionID == QuestionID).First();
        QuestionIdentifier.Value = QuestionID.ToString();
        mfib.InnerHtml = MultiFIBMarkup.QuestionMarkup;
        var qb = db.QuestionBanks.Where(w => w.id == QuestionID).First();
        ddl_cat.SelectedValue = qb.CategoryID.ToString();
        ddl_sub_cat.SelectedValue = qb.SubCategoryID.ToString();
        ddl_btax.SelectedValue = qb.Level.ToString();
        QuestionType.Value = qb.QuestionType.QTypeName;
    }

    protected void save_prop_Click(object sender, EventArgs e)
    {
        if(!(QuestionIdentifier.Value.Equals("")))
        {
            int QuestionID = Convert.ToInt32(QuestionIdentifier.Value);
            DreamBirdEntities db = new DreamBirdEntities();
            var question = db.QuestionBanks.Where(w => w.id == QuestionID).First();
            question.CategoryID = Convert.ToInt32(ddl_cat.SelectedValue);
            question.SubCategoryID = Convert.ToInt32(ddl_sub_cat.SelectedValue);
            question.Level = Convert.ToInt32(ddl_btax.SelectedValue);
            db.SaveChanges();
        }
        
    }

    protected void ddl_cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        int catid = Convert.ToInt32(ddl_cat.SelectedValue);
        DreamBirdEntities db = new DreamBirdEntities();
        if (db.QuestionSubCategories.Any(a => a.CategoryID == catid))
        {
            ddl_sub_cat.DataSource = db.QuestionSubCategories.Where(w => w.CategoryID == catid).ToList();
            ddl_sub_cat.DataTextField = "SubCategoryName";
            ddl_sub_cat.DataValueField = "id";
            ddl_sub_cat.DataBind();
        }
        save_prop_Click(this, e);

    }

    protected void ddl_sub_cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        save_prop_Click(this, e);
    }
}