using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_MCQHandler : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            if(db.QuestionCategories.Any())
            {
                ddl_cat.DataSource = db.QuestionCategories.ToList();
                ddl_cat.DataTextField = "CategoryName";
                ddl_cat.DataValueField = "id";
                ddl_cat.DataBind();
                int catid = Convert.ToInt32(ddl_cat.SelectedValue);
                if(db.QuestionSubCategories.Any(a => a.CategoryID == catid))
                {
                    ddl_sub_cat.DataSource = db.QuestionSubCategories.Where(w => w.CategoryID == catid).ToList();
                    ddl_sub_cat.DataTextField = "SubCategoryName";
                    ddl_sub_cat.DataValueField = "id";
                    ddl_sub_cat.DataBind();
                }
                ddl_btax.DataSource = db.BloomsTaxonomies.ToList();
                ddl_btax.DataTextField = "TaxonomyName";
                ddl_btax.DataValueField = "id";
                ddl_btax.DataBind();
            }
            
            String path = Server.MapPath("~/components/TextBank/contents/js/custom.js");

            String script1 = File.ReadAllText(path);
            StringBuilder scriptBuilder = new StringBuilder();
            scriptBuilder.Append(script1);


            ClientScriptManager cs = Page.ClientScript;
            if (!cs.IsClientScriptBlockRegistered("script_textbank_admin"))
            {

                cs.RegisterClientScriptBlock(this.GetType(), "script_textbank_admin", scriptBuilder.ToString(), true);
                
                //Loading CKEditor 
                String ckeeditorPath = Server.MapPath("~/components/TextBank/ckeditor/ckeditor.js");
                String ckeEditorJS = File.ReadAllText(ckeeditorPath);
                //  cs.RegisterClientScriptBlock(this.GetType(), "script_CKEditor", ckeEditorJS, true);

                ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_CKEditor", "<script src='/components/TextBank/ckeditor/ckeditor.js'></script>", false);


                //String func = String.Format("setValue('{0}','#{1}');", txtEditor.ClientID, HiddenField1.ClientID);
                //cmdSave.OnClientClick = func;
                Hf1.Value = txtEditor.ClientID;
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "script2", "enableCKEditor();", true);
            }

        }

    }

    public void BindOptions(int QuestionID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        rptr_mcqOptions.DataSource = db.MCQOptions.Where(w => w.QuestionID == QuestionID).ToList();
        rptr_mcqOptions.DataBind();
        correctOption.DataSource = db.MCQOptions.Where(w => w.QuestionID == QuestionID).ToList();
        correctOption.DataTextField = "OptionText";
        correctOption.DataValueField = "id";
        correctOption.DataBind();
        foreach(ListItem lst in correctOption.Items)
        {
            int id = Convert.ToInt32(lst.Value);
            var mcqoptions = db.MCQOptions.Where(w => w.id == id).First();
            lst.Selected = mcqoptions.isCorrect;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int qid = Convert.ToInt32(QuestionIdentifier.Value);
        QuestionBank qb = db.QuestionBanks.Where(w => w.id == qid).First();
        qb.CategoryID = Convert.ToInt32(ddl_cat.SelectedValue);
        qb.SubCategoryID = Convert.ToInt32(ddl_sub_cat.SelectedValue);
        qb.Level = Convert.ToInt32(ddl_btax.SelectedValue);
        db.SaveChanges();
        BindOptions(qid);
    }

    public void BindData(int QuestionID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        QuestionBank qb = db.QuestionBanks.Where(w => w.id == QuestionID).First();
        if(db.QuestionHints.Any(a => a.QuestionID == QuestionID))
        {
            QuestionHint hint = db.QuestionHints.Where(w => w.QuestionID == QuestionID).First();
            HintText.Text = hint.HintText;
        }
        else
        {
            HintText.Text = " ";
        }
        if(db.QuestionExplanations.Any(a => a.QuestionID == QuestionID))
        {
            ExplanationText.Text = db.QuestionExplanations.Where(w => w.QuestionID == QuestionID).Select(s => s.ExplanationText).First();
        }
        else
        {
            ExplanationText.Text = "";
        }
        QuestionText1.Attributes.Add("qid", qb.id.ToString());
        QuestionText.Text = qb.QuestionText;
        QuestionIdentifier.Value = qb.id.ToString();
        ddl_cat.SelectedValue = qb.CategoryID.ToString();
        ddl_sub_cat.SelectedValue = qb.SubCategoryID.ToString();
        ddl_btax.SelectedValue = qb.Level.ToString();
        QuestionType.Value = qb.QuestionType.QTypeName;
        BindOptions(QuestionID);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "keyOpener", "$('#question_pan').css('display', '-webkit-box'); $('#addQuestion').css('display', 'none');", true);
    }

    protected void correctOption_SelectedIndexChanged(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        foreach (ListItem lst in correctOption.Items)
        {
            int id = Convert.ToInt32(lst.Value);
            MCQOption mcqo = db.MCQOptions.Where(w => w.id == id).First();
            mcqo.isCorrect = lst.Selected;
            db.SaveChanges();
        }
    }

    protected void ddl_cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        int catid = Convert.ToInt32(ddl_cat.SelectedValue);
        DreamBirdEntities db = new DreamBirdEntities();
        if(db.QuestionSubCategories.Any(a => a.CategoryID == catid))
        {
            ddl_sub_cat.DataSource = db.QuestionSubCategories.Where(w => w.CategoryID == catid).ToList();
            ddl_sub_cat.DataTextField = "SubCategoryName";
            ddl_sub_cat.DataValueField = "id";
            ddl_sub_cat.DataBind();
        }
        save_prop_Click(this, e);
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

    protected void remove_Option_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        int QuestionID = Convert.ToInt32(QuestionIdentifier.Value);
        int OptionID = Convert.ToInt32(btn.Attributes["OPID"].ToString());
        DreamBirdEntities db = new DreamBirdEntities();
        var option = db.MCQOptions.Where(w => w.QuestionID == QuestionID && w.id == OptionID).First();
        db.MCQOptions.Remove(option);
        db.SaveChanges();
        Button1_Click(sender, e);
    }

    protected void ddl_sub_cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        save_prop_Click(this, e);
    }

    protected void ddl_btax_SelectedIndexChanged(object sender, EventArgs e)
    {
        save_prop_Click(this, e);
    }
}