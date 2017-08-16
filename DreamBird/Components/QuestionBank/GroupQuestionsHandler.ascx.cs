using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_GroupQuestionsHandler : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            if (db.QuestionCategories.Any())
            {
                ddl_cat.DataSource = db.QuestionCategories.ToList();
                ddl_cat.DataTextField = "CategoryName";
                ddl_cat.DataValueField = "id";
                ddl_cat.DataBind();
                int catid = Convert.ToInt32(ddl_cat.SelectedValue);
                if (db.QuestionSubCategories.Any(a => a.CategoryID == catid))
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

    protected void Save_Group_Click(object sender, EventArgs e)
    {

    }

    protected void ddl_sub_cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        save_prop_Click(this, e);
    }

    protected void ddl_btax_SelectedIndexChanged(object sender, EventArgs e)
    {
        save_prop_Click(this, e);
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

    protected void save_prop_Click(object sender, EventArgs e)
    {
        if (!(QuestionIdentifier.Value.Equals("")))
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

    protected void QuizAdmin_QuestionsSelectedForGroup(object sender, EventArgs e)
    {
        EventArgQuestionTypes evt = e as EventArgQuestionTypes;
        List<int> list = evt.QuestionTypeIDs;
        DreamBirdEntities db = new DreamBirdEntities();
        int QuestionID = Convert.ToInt32(QuestionIdentifier.Value);
        foreach(int id in list)
        {
            if(!(db.GroupQuestions.Any(a => a.PrimaryQuestionID == QuestionID && a.SecondaryQuestionID == id)))
            {
                GroupQuestion GQ = new GroupQuestion();
                GQ.PrimaryQuestionID = QuestionID;
                GQ.SecondaryQuestionID = id;
                db.GroupQuestions.Add(GQ);
            }
        }
        db.SaveChanges();
        if(db.GroupQuestions.Any(a => a.PrimaryQuestionID == QuestionID))
        {
            rptr_selectedQuestionPool.DataSource = db.GroupQuestions.Where(w => w.PrimaryQuestionID == QuestionID).ToList();
            rptr_selectedQuestionPool.DataBind();
        }

    }

    protected void Remove_group_Question_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        int GroupID = Convert.ToInt32(btn.Attributes["data-groupid"].ToString());
        DreamBirdEntities db = new DreamBirdEntities();
        var QuestionGroup = db.GroupQuestions.Where(w => w.id == GroupID).First();
        db.GroupQuestions.Remove(QuestionGroup);
        db.SaveChanges();
        int PrimaryQuestionID = Convert.ToInt32(btn.Attributes["data-pgroupid"].ToString());
        if (db.GroupQuestions.Any(a => a.PrimaryQuestionID == PrimaryQuestionID))
        {
            rptr_selectedQuestionPool.DataSource = db.GroupQuestions.Where(w => w.PrimaryQuestionID == PrimaryQuestionID).ToList();
            rptr_selectedQuestionPool.DataBind();
        }
    }

    public void BindData(int QuestionID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        QuestionBank qb = db.QuestionBanks.Where(w => w.id == QuestionID).First();
        if (db.QuestionHints.Any(a => a.QuestionID == QuestionID))
        {
            QuestionHint hint = db.QuestionHints.Where(w => w.QuestionID == QuestionID).First();
            HintText.Text = hint.HintText;
        }
        else
        {
            HintText.Text = " ";
        }
        if (db.QuestionExplanations.Any(a => a.QuestionID == QuestionID))
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

    public void BindOptions(int QuestionID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        rptr_selectedQuestionPool.DataSource = db.GroupQuestions.Where(w => w.PrimaryQuestionID == QuestionID).ToList();
        rptr_selectedQuestionPool.DataBind();
    }
}