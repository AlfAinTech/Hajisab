using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Dynamic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_QuestionBank_Admin_QuizAdmin : System.Web.UI.UserControl
{
    public event EventHandler QuestionsSelectedForGroup;
    public class QuestionsIDS
    {
        public int QuestionID;
        public decimal totalQuestions;
        public decimal SelectedQuestions;
    }

    private string quizMode;
    public string QuizMode
    {
        get
        {
            return quizMode;
        }
        set
        {
            quizMode = value;
        }
    }
    private bool allowMulti;
    public bool AllowMulti
    {
        get
        {
            return allowMulti;
        }
        set
        {
            allowMulti = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            //questionGrid.DataSource = db.QuestionBanks.Where(w => w.QuestionType.QTypeName == "MCQ's").ToList();
            //questionGrid.DataBind();
            rptr_qtype.DataSource = db.QuestionTypes.ToList();
            rptr_qtype.DataBind();
            rptr_autoselection.DataSource = db.QuestionTypes.ToList();
            rptr_autoselection.DataBind();
            ddl_cat.DataSource = db.QuestionCategories.ToList();
            ddl_cat.DataTextField = "CategoryName";
            ddl_cat.DataValueField = "id";
            ddl_cat.DataBind();
            ListItem lst = new ListItem();
            lst.Text = "All";
            lst.Value = "0";
            ddl_cat.Items.Insert(0, lst);
            ddl_cat.SelectedIndex = 0;
            ddl_cat.Enabled = false;
            int catid = Convert.ToInt32(ddl_cat.SelectedValue);
            if (db.QuestionSubCategories.Any(a => a.CategoryID == catid))
            {
                ddl_sub_cat.DataSource = db.QuestionSubCategories.Where(w => w.CategoryID == catid).ToList();
                ddl_sub_cat.DataTextField = "SubCategoryName";
                ddl_sub_cat.DataValueField = "id";
                ddl_sub_cat.DataBind();
                ddl_sub_cat.Items.Insert(0, lst);
                ddl_sub_cat.SelectedIndex = 0;
                int subcatid = Convert.ToInt32(ddl_sub_cat.SelectedValue);
                if (db.QuestionBanks.Any(a => a.CategoryID == catid && a.SubCategoryID == subcatid))
                {
                    ddl_level.DataSource = db.QuestionBanks.Where(w => w.CategoryID == catid && w.SubCategoryID == subcatid).Join(db.BloomsTaxonomies.ToList(), j => j.Level, k => k.id, (j, k) => new { QuestionBank = j, BloomsTaxonomy = k }).Select(s => new { TaxonomyName = s.BloomsTaxonomy.TaxonomyName, Level = s.QuestionBank.Level }).Distinct().ToList();
                    ddl_level.DataTextField = "TaxonomyName";
                    ddl_level.DataValueField = "Level";
                    ddl_level.DataBind();
                    ddl_level.Items.Insert(0, lst);
                    ddl_level.SelectedIndex = 0;
                }
            }
            if (!AllowMulti || quizMode == "Question")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "script_disable_tab", "$('a[href=#autoSelection]').removeAttr('data-toggle').parent().addClass('disabled');", true);
            }
        }
    }

    protected void SelectQuestion_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        //DropDownList ddl_qopt = b.NamingContainer.FindControl("ddl_qopt") as DropDownList;
        //TextBox txt_marks = b.NamingContainer.FindControl("txt_marks") as TextBox;
        //CheckBox show_answer = b.NamingContainer.FindControl("show_answer") as CheckBox;
        string QID = b.Attributes["data-qid"].ToString();
        QuestionIDHidden.Value = QID;
        popup_QuestionOptions.Show();
        //DreamBirdEntities db = new DreamBirdEntities();
        //if (Request.QueryString["PID"] != null && Request.QueryString["CID"] != null && Request.QueryString["DID"] != null)
        //{
        //    int pid = int.Parse(Request.QueryString["PID"].ToString());
        //    String cid = Request.QueryString["CID"].ToString();
        //    int did = int.Parse(Request.QueryString["DID"].ToString());

        //    if (db.LessonQuestions.Any(a => a.BaseControlID == cid && a.Layout_id == pid))
        //    {
        //        var lessonQuiz = db.LessonQuestions.Where(w => w.BaseControlID == cid && w.Layout_id == pid).First();
        //        lessonQuiz.Question_id = QID;
        //        lessonQuiz.HintOption = ddl_qopt.SelectedValue;
        //        lessonQuiz.ShowAnswer = show_answer.Checked;
        //        if (ddl_qopt.Enabled == true)
        //        {
        //            if (ddl_qopt.SelectedValue == "Zero")
        //            {
        //                lessonQuiz.HintMarks = 0;
        //            }
        //            else
        //            {
        //                lessonQuiz.HintMarks = Convert.ToDecimal(txt_marks.Text);
        //            }
        //        }
        //        else
        //        {
        //            lessonQuiz.HintOption = "Disabled";
        //            lessonQuiz.HintMarks = 0;
        //        }
        //        db.SaveChanges();
        //    }
        //    else
        //    {
        //        LessonQuestion lessonQuiz = new LessonQuestion();
        //        lessonQuiz.Question_id = QID;
        //        lessonQuiz.Layout_id = pid;
        //        lessonQuiz.BaseControlID = cid;
        //        lessonQuiz.HintOption = ddl_qopt.SelectedValue;
        //        lessonQuiz.ShowAnswer = show_answer.Checked;
        //        if (ddl_qopt.Enabled == true)
        //        {
        //            if (ddl_qopt.SelectedValue == "Zero")
        //            {
        //                lessonQuiz.HintMarks = 0;
        //            }
        //            else
        //            {
        //                lessonQuiz.HintMarks = Convert.ToDecimal(txt_marks.Text);
        //            }
        //        }
        //        else
        //        {
        //            lessonQuiz.HintOption = "Disabled";
        //            lessonQuiz.HintMarks = 0;
        //        }
        //        db.LessonQuestions.Add(lessonQuiz);
        //        db.SaveChanges();
        //    }
        //}
    }

    protected void question_type_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        int typeid = Convert.ToInt32(lb.Attributes["data-typeid"].ToString());
        ViewState["QuestionID"] = typeid;
        DreamBirdEntities db = new DreamBirdEntities();
        ddl_cat.Enabled = true;
        ddl_cat.SelectedIndex = 0;
        questionGrid.DataSource = db.QuestionBanks.Where(w => w.TypeID == typeid).ToList();
        questionGrid.DataBind();
        if (!AllowMulti || quizMode == "Question")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "script_disable_tab", "$('a[href=#autoSelection]').removeAttr('data-toggle').parent().addClass('disabled');", true);
        }
    }

    protected void ddl_cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if (ddl_cat.SelectedValue != "0")
        {
            int catid = Convert.ToInt32(ddl_cat.SelectedValue);
            if (db.QuestionSubCategories.Any(a => a.CategoryID == catid))
            {
                ListItem lst = new ListItem();
                lst.Text = "All";
                lst.Value = "0";
                ddl_sub_cat.DataSource = db.QuestionSubCategories.Where(w => w.CategoryID == catid).ToList();
                ddl_sub_cat.DataTextField = "SubCategoryName";
                ddl_sub_cat.DataValueField = "id";
                ddl_sub_cat.DataBind();
                ddl_sub_cat.Items.Insert(0, lst);
                ddl_sub_cat.SelectedIndex = 0;
                int subcatid = Convert.ToInt32(ddl_sub_cat.SelectedValue);
                if (db.QuestionBanks.Any(a => a.CategoryID == catid && a.SubCategoryID == subcatid))
                {
                    ddl_level.DataSource = db.QuestionBanks.Where(w => w.CategoryID == catid && w.SubCategoryID == subcatid).Distinct().ToList().Join(db.BloomsTaxonomies.Distinct().ToList(), j => j.Level, k => k.id, (j, k) => new { j.Level, k.TaxonomyName }).Distinct();
                    ddl_level.DataTextField = "TaxonomyName";
                    ddl_level.DataValueField = "Level";
                    ddl_level.DataBind();
                }
                ddl_level.Items.Insert(0, lst);
                ddl_level.SelectedIndex = 0;
            }
            BindMedia();
        }
    }

    public List<int> GetSelectedQuestions()
    {
        List<int> SelectedQuestions = new List<int>();
        foreach (RepeaterItem item in questionGrid.Items)
        {
            CheckBox cbox = item.FindControl("SelectedQuestion") as CheckBox;
            if (cbox.Checked)
            {
                int QuestionID = Convert.ToInt32(cbox.Attributes["data-qid"].ToString());
                SelectedQuestions.Add(QuestionID);
            }
        }
        return SelectedQuestions;
    }

    private void BindMedia()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int typeid = Convert.ToInt32(ViewState["QuestionID"].ToString());
        if (ddl_cat.SelectedValue != "0" && ddl_cat.SelectedValue != null)
        {
            int catid = Convert.ToInt32(ddl_cat.SelectedValue);
            if (ddl_sub_cat.SelectedValue != "0" && ddl_sub_cat.SelectedValue != null)
            {
                int subcatid = Convert.ToInt32(ddl_sub_cat.SelectedValue);
                if (ddl_level.SelectedValue != "0" && ddl_level.SelectedValue != null)
                {
                    decimal level = Convert.ToDecimal(ddl_level.SelectedValue);
                    questionGrid.DataSource = db.QuestionBanks.Where(w => w.TypeID == typeid && w.CategoryID == catid && w.SubCategoryID == subcatid && w.Level == level).ToList();
                    questionGrid.DataBind();
                }
                else
                {
                    questionGrid.DataSource = db.QuestionBanks.Where(w => w.TypeID == typeid && w.CategoryID == catid && w.SubCategoryID == subcatid).ToList();
                    questionGrid.DataBind();
                }
            }
            else
            {
                questionGrid.DataSource = db.QuestionBanks.Where(w => w.TypeID == typeid && w.CategoryID == catid).ToList();
                questionGrid.DataBind();
            }
        }
        else
        {

            questionGrid.DataSource = db.QuestionBanks.Where(w => w.TypeID == typeid).ToList();
            questionGrid.DataBind();
        }
    }

    protected void ddl_sub_cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int catid = Convert.ToInt32(ddl_cat.SelectedValue);
        int subcatid = Convert.ToInt32(ddl_sub_cat.SelectedValue);
        if (db.QuestionBanks.Any(a => a.CategoryID == catid && a.SubCategoryID == subcatid))
        {
            if (db.QuestionBanks.Any(a => a.CategoryID == catid && a.SubCategoryID == subcatid))
            {
                ddl_level.DataSource = db.QuestionBanks.Where(w => w.CategoryID == catid && w.SubCategoryID == subcatid).Distinct().ToList().Join(db.BloomsTaxonomies.Distinct().ToList(), j => j.Level, k => k.id, (j, k) => new { j.Level, k.TaxonomyName }).Distinct();
                ddl_level.DataTextField = "TaxonomyName";
                ddl_level.DataValueField = "Level";
                ddl_level.DataBind();
            }
            ListItem lst = new ListItem();
            lst.Text = "All";
            lst.Value = "0";
            ddl_level.Items.Insert(0, lst);
            ddl_level.SelectedIndex = 0;
        }

        BindMedia();
    }

    protected void ddl_level_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindMedia();
    }



    protected void questionGrid_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            QuestionBank qb = e.Item.DataItem as QuestionBank;
            DreamBirdEntities db = new DreamBirdEntities();
            string SelectedHint = "N";
            decimal SelectedMarks = 0;
            bool IsProgress = false;
            if (Request.QueryString["PID"] != null && Request.QueryString["CID"] != null && Request.QueryString["DID"] != null)
            {
                int pageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
                string CID = Request.QueryString["CID"].ToString();
                if (db.DreamPageControls.Any(a => a.Layout_ID == pageID && a.BaseDreamServer_ID == CID))
                {
                    IsProgress = true;
                    if (db.LessonQuestions.Any(a => a.Question_id == qb.id && a.Layout_id == pageID && a.BaseControlID == CID))
                    {
                        var LessonQuestion = db.LessonQuestions.Where(w => w.Question_id == qb.id && w.Layout_id == pageID && w.BaseControlID == CID).First();
                        SelectedHint = LessonQuestion.HintOption;
                        SelectedMarks = Convert.ToDecimal(LessonQuestion.HintMarks);
                    }
                    else
                    {
                        SelectedHint = "O";
                        var Dreampagecontrol = db.DreamPageControls.Where(w => w.Layout_ID == pageID && w.BaseDreamServer_ID == CID).First();
                        SelectedMarks = Convert.ToDecimal(Dreampagecontrol.TotalProgress);
                    }
                }

            }
            if (allowMulti)
            {

                CheckBox cbox = e.Item.FindControl("SelectedQuestion") as CheckBox;
                cbox.Visible = true;
            }
            else
            {
                Button button = e.Item.FindControl("SelectQuestion") as Button;
                //DropDownList ddl = e.Item.FindControl("ddl_qopt") as DropDownList;
                //TextBox tbox = e.Item.FindControl("txt_marks") as TextBox;
                //ddl.Visible = true;
                //tbox.Visible = true;
                button.Visible = true;
                //tbox.Text = "0.000";
                if (IsProgress)
                {
                    //ddl.Enabled = true;
                    //tbox.Enabled = true;
                }
                if (SelectedHint != "N")
                {
                    //ddl.SelectedValue = SelectedHint;
                    //tbox.Text = SelectedMarks.ToString();
                }
            }

        }
    }

    protected void SelectMultiQuestions_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        DreamBirdEntities db = new DreamBirdEntities();
        if (quizMode == "Question")
        {
            List<int> questionlist = new List<int>();
            foreach (RepeaterItem item in questionGrid.Items)
            {
                CheckBox cbox = item.FindControl("SelectedQuestion") as CheckBox;
                if (cbox.Checked)
                {
                    int questionid = Convert.ToInt32(cbox.Attributes["data-qid"].ToString());
                    questionlist.Add(questionid);
                }
            }
            if (QuestionsSelectedForGroup != null)
            {
                EventArgQuestionTypes evt = new EventArgQuestionTypes();
                evt.QuestionTypeIDs = questionlist;
                QuestionsSelectedForGroup(this, evt);
                return;
            }
        }
        if (Request.QueryString["QID"] != null)
        {
            int qid = int.Parse(Request.QueryString["QID"].ToString());
            List<int> questionlist = new List<int>();
            foreach (RepeaterItem item in questionGrid.Items)
            {
                CheckBox cbox = item.FindControl("SelectedQuestion") as CheckBox;
                if (cbox.Checked)
                {
                    int questionid = Convert.ToInt32(cbox.Attributes["data-qid"].ToString());
                    questionlist.Add(questionid);
                }
            }
            foreach (int id in questionlist)
            {
                QuizBankQuestion qbq = new QuizBankQuestion();
                qbq.QuizID = qid;
                qbq.QuestionID = id;
                qbq.isActive = true;
                db.QuizBankQuestions.Add(qbq);
            }
            db.SaveChanges();
            Response.Redirect("~/Components/QuizBank/Admin/ManageQuiz.aspx?QID=" + qid);
        }
    }

    protected void rptr_autoselection_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DropDownList ddl_cat = e.Item.FindControl("ddl_cat_auto") as DropDownList;
            DropDownList ddl_sub_cat = e.Item.FindControl("ddl_sub_cat_auto") as DropDownList;
            DropDownList max_value = e.Item.FindControl("max_level") as DropDownList;
            DropDownList min_value = e.Item.FindControl("min_level") as DropDownList;
            TextBox no_of_questons = e.Item.FindControl("no_of_questions") as TextBox;
            TextBox totalQuestions = e.Item.FindControl("TotalQuestions") as TextBox;
            Label QuestionID = e.Item.FindControl("question_type_name") as Label;

            int typeid = Convert.ToInt32(QuestionID.Attributes["data-qtypeid"].ToString());
            List<int?> list = new List<int?>();
            DreamBirdEntities db = new DreamBirdEntities();
            if (db.QuestionBanks.Any(a => a.QuestionType.id == typeid))
            {
                list = db.QuestionBanks.Where(w => w.QuestionType.id == typeid).Select(s => s.CategoryID).ToList();
            }

            if (db.QuestionCategories.Any(a => list.Contains(a.id)))
            {
                ddl_cat.DataSource = db.QuestionCategories.Where(w => list.Contains(w.id)).ToList();
                ddl_cat.DataTextField = "CategoryName";
                ddl_cat.DataValueField = "id";
                ddl_cat.DataBind();
                ListItem lst = new ListItem();
                lst.Text = "All";
                lst.Value = "0";
                ddl_cat.Items.Insert(0, lst);
                ddl_cat.SelectedIndex = 0;
                int catid = Convert.ToInt32(ddl_cat.SelectedValue);
                if (db.QuestionSubCategories.Any(a => a.CategoryID == catid))
                {
                    ddl_sub_cat.DataSource = db.QuestionSubCategories.Where(w => w.CategoryID == catid).ToList();
                    ddl_sub_cat.DataTextField = "SubCategoryName";
                    ddl_sub_cat.DataValueField = "id";
                    ddl_sub_cat.DataBind();

                    int subcatid = Convert.ToInt32(ddl_sub_cat.SelectedValue);
                }
                ddl_sub_cat.Items.Insert(0, lst);
                ddl_sub_cat.SelectedIndex = 0;
                decimal maxvalue = Convert.ToDecimal(db.QuestionBanks.Where(w => w.TypeID == typeid).Select(s => s.Level).Max());
                decimal minvalue = Convert.ToDecimal(db.QuestionBanks.Where(w => w.TypeID == typeid).Select(s => s.Level).Min());
                decimal total = Convert.ToDecimal(db.QuestionBanks.Where(w => w.TypeID == typeid).Count());
                max_value.DataSource = db.BloomsTaxonomies.Where(w => w.id <= maxvalue && w.id >= minvalue).ToList();
                max_value.DataTextField = "TaxonomyName";
                max_value.DataValueField = "id";
                max_value.DataBind();
                max_value.SelectedValue = maxvalue.ToString();
                min_value.DataSource = db.BloomsTaxonomies.Where(w => w.id <= maxvalue && w.id >= minvalue).ToList();
                min_value.DataTextField = "TaxonomyName";
                min_value.DataValueField = "id";
                min_value.DataBind();
                min_value.SelectedValue = minvalue.ToString();
                no_of_questons.Attributes.Add("max", total.ToString());
                no_of_questons.Attributes.Add("min", "0");
                no_of_questons.Text = total.ToString();
                totalQuestions.Text = total.ToString();
                max_value.Text = maxvalue.ToString();
                min_value.Text = minvalue.ToString();
            }

        }
    }

    protected void ddl_cat_auto_SelectedIndexChanged(object sender, EventArgs e)
    {
        RepeaterItem row = (RepeaterItem)((sender) as Control).NamingContainer;
        DreamBirdEntities db = new DreamBirdEntities();
        // get the value from the first dropdownlist
        DropDownList ddlCategory = ((sender) as DropDownList);
        DropDownList ddl_sub_cat = row.FindControl("ddl_sub_cat_auto") as DropDownList;
        DropDownList max_value = row.FindControl("max_level") as DropDownList;
        DropDownList min_value = row.FindControl("min_level") as DropDownList;
        TextBox no_of_questons = row.FindControl("no_of_questions") as TextBox;
        TextBox totalQuestions = row.FindControl("TotalQuestions") as TextBox;

        if (ddlCategory.SelectedValue != "0")
        {
            int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);

            // Get Second dropdown and data for second dropdown passing the first selected value.


            //Get data for second ddl and bind it.
            ListItem lst = new ListItem();
            lst.Text = "All";
            lst.Value = "0";
            ddl_sub_cat.DataSource = db.QuestionSubCategories.Where(w => w.CategoryID == categoryId).ToList();
            ddl_sub_cat.DataTextField = "SubCategoryName";
            ddl_sub_cat.DataValueField = "id";
            ddl_sub_cat.DataBind();
            ddl_sub_cat.Items.Insert(0, lst);
            ddl_sub_cat.SelectedIndex = 0;
            decimal maxvalue = Convert.ToDecimal(db.QuestionBanks.Where(w => w.CategoryID == categoryId).Select(s => s.Level).Max());
            decimal minvalue = Convert.ToDecimal(db.QuestionBanks.Where(w => w.CategoryID == categoryId).Select(s => s.Level).Min());
            decimal total = Convert.ToDecimal(db.QuestionBanks.Where(w => w.CategoryID == categoryId).Count());
            max_value.DataSource = db.BloomsTaxonomies.Where(w => w.id <= maxvalue && w.id >= minvalue).ToList();
            max_value.DataTextField = "TaxonomyName";
            max_value.DataValueField = "id";
            max_value.DataBind();
            max_value.SelectedValue = maxvalue.ToString();
            min_value.DataSource = db.BloomsTaxonomies.Where(w => w.id <= maxvalue && w.id >= minvalue).ToList();
            min_value.DataTextField = "TaxonomyName";
            min_value.DataValueField = "id";
            min_value.DataBind();
            min_value.SelectedValue = minvalue.ToString();
            no_of_questons.Attributes.Add("max", total.ToString());
            no_of_questons.Attributes.Add("min", "0");
            no_of_questons.Text = total.ToString();
            totalQuestions.Text = total.ToString();
            max_value.Text = maxvalue.ToString();
            min_value.Text = minvalue.ToString();
        }
        else
        {
            DataTable dt = new DataTable();
            ddl_sub_cat.DataSource = dt;
            ddl_sub_cat.DataBind();
            ListItem lst = new ListItem();
            lst.Text = "All";
            lst.Value = "0";
            ddl_sub_cat.Items.Insert(0, lst);
            ddl_sub_cat.SelectedIndex = 0;
            ddl_sub_cat_auto_SelectedIndexChanged(ddl_sub_cat, EventArgs.Empty);
        }

        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_apply", "$('.active').each(function(){$(this).removeClass('active');}); $('a[href=#autoSelection]').parent().addClass('active'); $('#autoSelection').addClass('active');", true);
    }

    protected void ddl_sub_cat_auto_SelectedIndexChanged(object sender, EventArgs e)
    {
        RepeaterItem row = (RepeaterItem)((sender) as Control).NamingContainer;
        DreamBirdEntities db = new DreamBirdEntities();

        DropDownList ddlCategory = row.FindControl("ddl_cat_auto") as DropDownList;
        DropDownList ddl_sub_cat = ((sender) as DropDownList);
        DropDownList max_value = row.FindControl("max_level") as DropDownList;
        DropDownList min_value = row.FindControl("min_level") as DropDownList;
        TextBox no_of_questons = row.FindControl("no_of_questions") as TextBox;
        TextBox totalQuestions = row.FindControl("TotalQuestions") as TextBox;
        Label QuestionID = row.FindControl("question_type_name") as Label;

        int typeid = Convert.ToInt32(QuestionID.Attributes["data-qtypeid"].ToString());

        int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);
        int subcategoryId = Convert.ToInt32(ddl_sub_cat.SelectedValue);

        if (subcategoryId != 0)
        {
            decimal maxvalue = Convert.ToDecimal(db.QuestionBanks.Where(w => w.CategoryID == categoryId && w.SubCategoryID == subcategoryId).Select(s => s.Level).Max());
            decimal minvalue = Convert.ToDecimal(db.QuestionBanks.Where(w => w.CategoryID == categoryId && w.SubCategoryID == subcategoryId).Select(s => s.Level).Min());
            decimal total = Convert.ToDecimal(db.QuestionBanks.Where(w => w.CategoryID == categoryId && w.SubCategoryID == subcategoryId).Count());
            max_value.DataSource = db.BloomsTaxonomies.Where(w => w.id <= maxvalue && w.id >= minvalue).ToList();
            max_value.DataTextField = "TaxonomyName";
            max_value.DataValueField = "id";
            max_value.DataBind();
            max_value.SelectedValue = maxvalue.ToString();
            min_value.DataSource = db.BloomsTaxonomies.Where(w => w.id <= maxvalue && w.id >= minvalue).ToList();
            min_value.DataTextField = "TaxonomyName";
            min_value.DataValueField = "id";
            min_value.DataBind();
            min_value.SelectedValue = minvalue.ToString();
            no_of_questons.Attributes.Add("max", total.ToString());
            no_of_questons.Attributes.Add("min", "0");
            no_of_questons.Text = total.ToString();
            max_value.Text = maxvalue.ToString();
            min_value.Text = minvalue.ToString();
        }
        else
        {
            if (ddl_cat.SelectedValue != "0")
            {
                decimal maxvalue = Convert.ToDecimal(db.QuestionBanks.Where(w => w.CategoryID == categoryId).Select(s => s.Level).Max());
                decimal minvalue = Convert.ToDecimal(db.QuestionBanks.Where(w => w.CategoryID == categoryId).Select(s => s.Level).Min());
                decimal total = Convert.ToDecimal(db.QuestionBanks.Where(w => w.CategoryID == categoryId).Count());
                max_value.DataSource = db.BloomsTaxonomies.Where(w => w.id <= maxvalue && w.id >= minvalue).ToList();
                max_value.DataTextField = "TaxonomyName";
                max_value.DataValueField = "id";
                max_value.DataBind();
                max_value.SelectedValue = maxvalue.ToString();
                min_value.DataSource = db.BloomsTaxonomies.Where(w => w.id <= maxvalue && w.id >= minvalue).ToList();
                min_value.DataTextField = "TaxonomyName";
                min_value.DataValueField = "id";
                min_value.DataBind();
                min_value.SelectedValue = minvalue.ToString();
                no_of_questons.Attributes.Add("max", total.ToString());
                no_of_questons.Attributes.Add("min", "0");
                no_of_questons.Text = total.ToString();
                totalQuestions.Text = total.ToString();
                max_value.Text = maxvalue.ToString();
                min_value.Text = minvalue.ToString();
            }
            else
            {
                decimal maxvalue = Convert.ToDecimal(db.QuestionBanks.Where(w => w.TypeID == typeid).Select(s => s.Level).Max());
                decimal minvalue = Convert.ToDecimal(db.QuestionBanks.Where(w => w.TypeID == typeid).Select(s => s.Level).Min());
                decimal total = Convert.ToDecimal(db.QuestionBanks.Where(w => w.TypeID == typeid).Count());
                max_value.DataSource = db.BloomsTaxonomies.Where(w => w.id <= maxvalue && w.id >= minvalue).ToList();
                max_value.DataTextField = "TaxonomyName";
                max_value.DataValueField = "id";
                max_value.DataBind();
                max_value.SelectedValue = maxvalue.ToString();
                min_value.DataSource = db.BloomsTaxonomies.Where(w => w.id <= maxvalue && w.id >= minvalue).ToList();
                min_value.DataTextField = "TaxonomyName";
                min_value.DataValueField = "id";
                min_value.DataBind();
                min_value.SelectedValue = minvalue.ToString();
                no_of_questons.Attributes.Add("max", total.ToString());
                no_of_questons.Attributes.Add("min", "0");
                no_of_questons.Text = total.ToString();
                totalQuestions.Text = total.ToString();
                max_value.Text = maxvalue.ToString();
                min_value.Text = minvalue.ToString();
            }


        }
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_apply", "$('.active').each(function(){$(this).removeClass('active');}); $('a[href=#autoSelection]').parent().addClass('active'); $('#autoSelection').addClass('active');", true);
    }

    protected void max_level_TextChanged(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_apply", "$('.active').each(function(){$(this).removeClass('active');}); $('a[href=#autoSelection]').parent().addClass('active'); $('#autoSelection').addClass('active');", true);
        RepeaterItem row = (RepeaterItem)((sender) as Control).NamingContainer;
        DropDownList max_level = sender as DropDownList;
        DropDownList min_level = row.FindControl("min_level") as DropDownList;
        DropDownList ddlCategory = row.FindControl("ddl_cat_auto") as DropDownList;
        DropDownList ddl_sub_cat = row.FindControl("ddl_sub_cat_auto") as DropDownList;
        TextBox no_of_questons = row.FindControl("no_of_questions") as TextBox;
        TextBox totalQuestions = row.FindControl("TotalQuestions") as TextBox;

        int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);
        int subcategoryId = Convert.ToInt32(ddl_sub_cat.SelectedValue);
        if (Convert.ToDecimal(max_level.SelectedValue) < Convert.ToDecimal(min_level.SelectedValue))
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_alert", "alert('Maximum level cannot be less than the minimum level');", true);
            max_level.Text = min_level.Text;
        }
        else
        {
            decimal maxlevel = Convert.ToDecimal(max_level.SelectedValue);
            decimal minlevel = Convert.ToDecimal(min_level.SelectedValue);
            if (db.QuestionBanks.Any(a => a.CategoryID == categoryId && a.SubCategoryID == subcategoryId && a.Level <= maxlevel && a.Level >= minlevel))
            {
                decimal count = Convert.ToDecimal(db.QuestionBanks.Where(a => a.CategoryID == categoryId && a.SubCategoryID == subcategoryId && a.Level <= maxlevel && a.Level >= minlevel).Count());
                no_of_questons.Text = count.ToString();
                totalQuestions.Text = count.ToString();
            }
        }
    }

    protected void finalizeSelection_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["QID"] != null)
        {
            Random rand = new Random();
            int quid = int.Parse(Request.QueryString["QID"].ToString());
            DreamBirdEntities db = new DreamBirdEntities();
            List<QuestionsIDS> lst = new List<QuestionsIDS>();
            foreach (RepeaterItem item in rptr_autoselection.Items)
            {
                Label qid = item.FindControl("question_type_name") as Label;
                TextBox QuestionNumber = item.FindControl("no_of_questions") as TextBox;
                TextBox totalQuestions = item.FindControl("TotalQuestions") as TextBox;

                int QuestionID = Convert.ToInt32(qid.Attributes["data-qtypeid"].ToString());

                decimal NumberofQuestions = 0;
                if (Decimal.TryParse(QuestionNumber.Text, out NumberofQuestions))
                {
                    NumberofQuestions = Convert.ToDecimal(QuestionNumber.Text);
                    decimal totalquestions = Convert.ToDecimal(totalQuestions.Text);
                    if (NumberofQuestions != 0)
                    {
                        QuestionsIDS quesid = new QuestionsIDS();
                        quesid.QuestionID = QuestionID;
                        quesid.SelectedQuestions = NumberofQuestions;
                        quesid.totalQuestions = totalquestions;
                        lst.Add(quesid);
                    }

                }
            }
            foreach (var item in lst)
            {
                var questionids = db.QuestionBanks.Where(w => w.TypeID == item.QuestionID).OrderBy(o => o.id).Select(s => s.id).ToList();

                if (item.totalQuestions == item.SelectedQuestions)
                {
                    if (questionids.Count > 0)
                    {
                        foreach (var questionid in questionids)
                        {
                            if (!(db.QuizBankQuestions.Any(a => a.QuestionID == questionid && a.QuizID == quid)))
                            {
                                QuizBankQuestion qbq = new QuizBankQuestion();
                                qbq.QuestionID = questionid;
                                qbq.QuizID = quid;
                                qbq.isActive = true;
                                db.QuizBankQuestions.Add(qbq);
                                db.SaveChanges();
                            }
                        }
                    }
                }
                else if (item.totalQuestions > item.SelectedQuestions)
                {
                    for (int i = 0; i < item.SelectedQuestions; i++)
                    {
                        int random = rand.Next(0, questionids.Count - 1);
                        int QuestionID = questionids[random];
                        questionids.RemoveAt(random);
                        if (!(db.QuizBankQuestions.Any(a => a.QuestionID == QuestionID && a.QuizID == quid)))
                        {
                            QuizBankQuestion qbq = new QuizBankQuestion();
                            qbq.QuestionID = QuestionID;
                            qbq.QuizID = quid;
                            qbq.isActive = true;
                            db.QuizBankQuestions.Add(qbq);
                            db.SaveChanges();
                        }
                    }
                }
            }
            Response.Redirect("~/Components/QuizBank/Admin/ManageQuiz.aspx?QID=" + quid);
        }
    }

    protected void select_question_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        int QID = Convert.ToInt32(QuestionIDHidden.Value);
        if (Request.QueryString["PID"] != null && Request.QueryString["CID"] != null && Request.QueryString["DID"] != null)
        {
            int pid = int.Parse(Request.QueryString["PID"].ToString());
            String cid = Request.QueryString["CID"].ToString();
            int did = int.Parse(Request.QueryString["DID"].ToString());

            if (db.LessonQuestions.Any(a => a.BaseControlID == cid && a.Layout_id == pid))
            {
                var lessonQuiz = db.LessonQuestions.Where(w => w.BaseControlID == cid && w.Layout_id == pid).First();
                lessonQuiz.Question_id = QID;
                lessonQuiz.HintOption = ddl_qopt.SelectedValue;
                lessonQuiz.ShowAnswer = show_question_answer.Checked;
                lessonQuiz.TotalTime = Convert.ToInt32(duration.Text);
                if (ddl_qopt.Enabled == true)
                {
                    if (ddl_qopt.SelectedValue == "Zero")
                    {
                        lessonQuiz.HintMarks = 0;
                    }
                    else
                    {
                        lessonQuiz.HintMarks = Convert.ToDecimal(hint_marks.Text);
                    }
                }
                else
                {
                    lessonQuiz.HintOption = "Disabled";
                    lessonQuiz.HintMarks = 0;
                }
                db.SaveChanges();
            }
            else
            {
                LessonQuestion lessonQuiz = new LessonQuestion();
                lessonQuiz.Question_id = QID;
                lessonQuiz.Layout_id = pid;
                lessonQuiz.BaseControlID = cid;
                lessonQuiz.HintOption = ddl_qopt.SelectedValue;
                lessonQuiz.ShowAnswer = show_question_answer.Checked;
                lessonQuiz.TotalTime = Convert.ToInt32(duration.Text);

                if (ddl_qopt.Enabled == true)
                {
                    if (ddl_qopt.SelectedValue == "Zero")
                    {
                        lessonQuiz.HintMarks = 0;
                    }
                    else
                    {
                        lessonQuiz.HintMarks = Convert.ToDecimal(hint_marks.Text);
                    }
                }
                else
                {
                    lessonQuiz.HintOption = "Disabled";
                    lessonQuiz.HintMarks = 0;
                }
                db.LessonQuestions.Add(lessonQuiz);
                db.SaveChanges();
            }
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "show_q_indication", "window.close();", true);
    }
}