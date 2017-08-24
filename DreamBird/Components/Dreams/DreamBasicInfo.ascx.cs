using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamBasicInfo : System.Web.UI.UserControl, IDreamEdit
{

    class Authorization
    {
        public int page_layout_id
        {
            get;
            set;
        }
        public string role_name
        {
            get; set;
        }
        public bool isAllowed
        {
            get;
            set;
        }
    }

    public event EventHandler DreamAdded;
    private int navigation_selectedID;
    public int selectedDream;
    private bool allowDelete = false;
    public int dreamID;
    public bool Allowdelete
    {
        get
        {
            return allowDelete;
        }
        set
        {
            allowDelete = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ErrorMessage.Visible = false;
        //if(!IsPostBack)
        //{
        //    EditDataBind(0);
        //}
        if (!IsPostBack)
        {
            //DreamBirdEntities db = new DreamBirdEntities();
            //if (db.Dreams.Any(a => a.IsDefault))
            //{
            //    var dream = db.Dreams.Where(w => w.IsDefault).First();
            //    EditDataBind(dream.id);
            //}
            //dreamType_list.DataSource= db.DreamTypes.ToList();
            //dreamType_list.DataBind();
            //if (dreamType_list.Items.Count != 0) { dreamType_list.SelectedIndex = 0; }
            //userRoles.DataSource = db.AspNetRoles.Where(w => w.Name != "Admin").ToList();
            //userRoles.DataTextField = "Name";
            //userRoles.DataValueField = "Name";
            //userRoles.DataBind();
            DreamBirdEntities db = new DreamBirdEntities();
            String uid = HttpContext.Current.User.Identity.GetUserId();
            dreamType_list.DataSource = db.DreamTypes.ToList();
            if (HttpContext.Current.User.IsInRole("UmrahAdmin") && !HttpContext.Current.User.IsInRole("Admin"))
            {
                dreamType_list.DataSource = db.DreamTypes.Where(q => q.Name == "UmrahDetail").ToList();
            }
           
            dreamType_list.DataTextField = "Name";
            dreamType_list.DataValueField = "id";
            dreamType_list.DataBind();
        }
    }

    public void LoadScripts()
    {
        TagControl.LoadScripts();
    }

    protected void dream_add_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DreamBirdEntities db;
            db = new DreamBirdEntities();
            string userid = HttpContext.Current.User.Identity.GetUserId();
            List<string> taglist = new List<string>();
            if (default_chk.Checked)
            {
                //int default_dreams_count = db.Dreams.Where(q => q.IsDefault == true).Count();
                if (db.Dreams.Any(q => q.IsDefault))
                {
                    if (!(db.Dreams.Where(w => w.IsDefault).Select(s => s.DreamName).First().Equals(DreamName_txt.Text)))
                    {
                        ShowError("Default Package Already Exist");
                        return;
                    }
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenMainsTabs();", true);
                }
            }
            if (ViewState["SelectedDreamID"] == null)
            {
                if (!(db.Dreams.Any(w => w.DreamName == DreamName_txt.Text)))
                {
                    var d = new Dream //Make sure you have a table called test in DB
                    {
                        DreamName = DreamName_txt.Text.ToString(),
                        MediaItem_id = int.Parse(dreamImg_id.Text),
                        Description = DereamDetail_txt.Text.ToString(),
                        IsFeatured = feature_chk.Checked,
                        IsPublished = isPublished_chk.Checked,
                        LikeSeed = Convert.ToInt32(LikeSeed.Text),
                        dreamTypeID = int.Parse(dreamType_list.SelectedValue),
                        AspNetUserID = userid,
                        EditedBy = userid,
                        EditedOn = System.DateTime.Now
                    };

                    db.Dreams.Add(d);
                    db.SaveChanges();
                    //if(ddl_public_default.Items.Count != 0 && ddl_user_default.Items.Count != 0)
                    //{
                    //    int publicDefaultPage = Convert.ToInt32(ddl_public_default.SelectedValue);
                    //    int userDefaultPage = Convert.ToInt32(ddl_user_default.SelectedValue);
                    //    db.DreamLayouts.Where(w => w.DreamID == d.id && w.id != publicDefaultPage && w.IsPublicDefaultPage == true).ToList().ForEach(f => f.IsPublicDefaultPage = false);
                    //    db.DreamLayouts.Where(w => w.DreamID == d.id && w.id == publicDefaultPage).First().IsPublicDefaultPage = true;
                    //    db.DreamLayouts.Where(w => w.DreamID == d.id && w.id != userDefaultPage && w.IsUserDefaultPage == true).ToList().ForEach(f => f.IsUserDefaultPage = false);
                    //    db.DreamLayouts.Where(w => w.DreamID == d.id && w.id == userDefaultPage).First().IsUserDefaultPage = true;
                    //}
                    taglist = TagControl.GetTags();
                    if (taglist.Count > 0)
                    {
                        List<int> tagidlist = new List<int>();
                        foreach (string tag in taglist)
                        {
                            if (db.Tags.Any(w => w.Name == tag))
                            {
                                tagidlist.Add(db.Tags.Where(w => w.Name == tag).Select<Tag, int>(s => s.id).First());
                            }
                            else
                            {
                                Tag newtag = new Tag();
                                newtag.Name = tag;
                                db.Tags.Add(newtag);
                                db.SaveChanges();
                                tagidlist.Add(newtag.id);
                            }
                        }
                        foreach (int i in tagidlist)
                        {
                            //if (!(db.DreamTags.Any(a => a.Tag_id == i)))
                            //{
                            DreamTag dt = new DreamTag();
                            dt.Tag_id = i;
                            dt.Dream_id = d.id;
                            db.DreamTags.Add(dt);
                            db.SaveChanges();
                            //}
                        }
                    }
                    ViewState["SelectedDreamID"] = Convert.ToInt32(d.id);
                    this.clearControl();
                    if (DreamAdded != null)
                    {
                        EventArgDreamEdit evt = new EventArgDreamEdit();
                        evt.DreamEditID = d.id;
                        DreamAdded(this, evt);
                    }
                }
                else
                {
                    ShowError("Dream Already Exist! Change the Name and try again");
                    return;
                }

            }
            else
            {

                selectedDream = int.Parse(ViewState["SelectedDreamID"].ToString());
                Dream d = db.Dreams.Where(q => q.id == selectedDream).First();
                d.DreamName = DreamName_txt.Text;
                d.Description = DereamDetail_txt.Text;
                d.MediaItem_id = int.Parse(dreamImg_id.Text);
                d.IsFeatured = feature_chk.Checked;
                d.IsDefault = default_chk.Checked;
                d.IsPublished = isPublished_chk.Checked;
                d.LikeSeed = Convert.ToInt32(LikeSeed.Text);
                d.dreamTypeID = int.Parse(dreamType_list.SelectedValue);
                //if (ddl_public_default.SelectedValue != "")
                //{
                //    int publicDefaultPage = Convert.ToInt32(ddl_public_default.SelectedValue);

                //    db.DreamLayouts.Where(w => w.DreamID == selectedDream && w.id != publicDefaultPage && w.IsPublicDefaultPage == true).ToList().ForEach(f => f.IsPublicDefaultPage = false);
                //    db.DreamLayouts.Where(w => w.DreamID == selectedDream && w.id == publicDefaultPage).First().IsPublicDefaultPage = true;

                //}
                //if(ddl_user_default.SelectedValue!="")
                //{
                //    int userDefaultPage = Convert.ToInt32(ddl_user_default.SelectedValue);
                //    db.DreamLayouts.Where(w => w.DreamID == selectedDream && w.id != userDefaultPage && w.IsUserDefaultPage == true).ToList().ForEach(f => f.IsUserDefaultPage = false);
                //    db.DreamLayouts.Where(w => w.DreamID == selectedDream && w.id == userDefaultPage).First().IsUserDefaultPage = true;

                //}
                db.SaveChanges();

                //dreamname.Text = DreamName_txt.Text;
                //dreamLink.NavigateUrl = "~/DreamHome.aspx/" + DreamName_txt;
                taglist = TagControl.GetTags();
                if (taglist.Count > 0)
                {
                    List<int> tagidlist = new List<int>();
                    foreach (string tag in taglist)
                    {
                        if (db.Tags.Any(w => w.Name == tag))
                        {
                            tagidlist.Add(db.Tags.Where(w => w.Name == tag).Select<Tag, int>(s => s.id).First());
                        }
                        else
                        {
                            Tag newtag = new Tag();
                            newtag.Name = tag;
                            db.Tags.Add(newtag);
                            db.SaveChanges();
                            tagidlist.Add(newtag.id);
                        }
                    }
                    foreach (int i in tagidlist)
                    {
                        //if (!(db.DreamTags.Any(a => a.Tag_id == i)))
                        //{
                        DreamTag dt = new DreamTag();
                        dt.Tag_id = i;
                        dt.Dream_id = d.id;
                        db.DreamTags.Add(dt);
                        db.SaveChanges();
                        //}
                    }
                }

                if(DreamAdded != null)
                {
                    EventArgDreamEdit evt = new EventArgDreamEdit();
                    evt.DreamEditID = d.id;
                    DreamAdded(this, evt);
                }
            }
            TagControl.LoadScripts();
            TagControl.SetTags(taglist);
            //ScriptManager.RegisterStartupScript(Page, typeof(Page), "a_key", "OpenMainsTabs();", true);
            //ModalPopupExtender1.Hide();

        }
    }
    public void clearControl()
    {
        DreamName_txt.Text = "";
        DereamDetail_txt.Text = "";
        dreamImg_id.Text = "";
        dream_video.Src = "";
        dream_video.Visible = false;
        Dream_img.Visible = true;
        Dream_img.ImageUrl = "";
        default_chk.Checked = false;
        feature_chk.Checked = false;
        isPublished_chk.Checked = false;
        //Dream_pages_list.DataSource = null;
        //Dream_pages_list.DataBind();
        //ViewState.Clear();
        //dreamname.Text = "";
        //addNewPage_btn.Visible = true;
        //addPage_panel.Visible = false;
        //PageName_add.Text = "";
        //LikeSeed.Text = "0";
        //dreamname.Text = "Add New Dream";
        //userDefault_chk_add.Checked = false;
        //publicDefault_chk_add.Checked = false;
        //publish_chk_add.Checked = false;
        //navigation_chk_add.Checked = false;

        //MediaBankControl.LoadScripts();

    }


    public void EditDataBind(int id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        ViewState["SelectedDreamID"] = id;
        Dream dr = db.Dreams.Where(q => q.id == id).First();
        DreamName_txt.Text = dr.DreamName;
        DereamDetail_txt.Text = dr.Description;
        isPublished_chk.Checked = dr.IsPublished;
        LikeSeed.Text = dr.LikeSeed.ToString();
        //if(db.DreamLayouts.Any(a => a.DreamID == dr.id && a.IsPublicDefaultPage == true))
        //{
        //    ddl_public_default.SelectedValue = db.DreamLayouts.Where(w => w.DreamID == dr.id && w.IsPublicDefaultPage == true).First().id.ToString();
        //}
        //if (db.DreamLayouts.Any(a => a.DreamID == dr.id && a.IsUserDefaultPage == true))
        //{
        //    ddl_user_default.SelectedValue = db.DreamLayouts.Where(w => w.DreamID == dr.id && w.IsUserDefaultPage == true).First().id.ToString();
        //}
        dreamType_list.SelectedValue = dr.dreamTypeID.ToString();
        MediaItem selected_dream_img;
        if (dr.MediaItem_id != null)
        {
            selected_dream_img = db.MediaItems.Where(q => q.id == dr.MediaItem_id).First();

            //MediaBankControl.setMediaItem(selected_dream_img.id);
            ViewState["selectedImageID"] = selected_dream_img.id;

            if (selected_dream_img.mediaType == "Image")
            {
                Dream_img.ImageUrl = selected_dream_img.Path500;
                dreamImg_id.Text = selected_dream_img.id.ToString();
                dream_video.Visible = false;
                Dream_img.Visible = true;
            }
            else if (selected_dream_img.mediaType == "video")
            {
                Dream_img.Visible = false;
                dream_video.Visible = true;
                dreamImg_id.Text = selected_dream_img.id.ToString();
                dream_video.Src = selected_dream_img.path + "/" + selected_dream_img.name;
                dream_video.Attributes.Add("controls", "");
            }
        }
        //dreamname.Text = dr.DreamName;
        //dreamLink.NavigateUrl = "~/DreamHome.aspx/" + dr.DreamName;
        default_chk.Checked = dr.IsDefault;
        feature_chk.Checked = dr.IsFeatured;
        ListItem lst = new ListItem();
        lst.Value = "0";
        lst.Text = "Default";
        dreamType_list.Items.Insert(0, lst);
        // DreamPageEdit.BindEditPage_Data(dr.id);
        //  DreamPageEdit.Visible = true;
        var pageids = db.DreamLayouts.Where(w => w.DreamID == dr.id).Select<DreamLayout, int?>(s => s.id).ToList();
        var lessonMenuPages = db.LessonMenus.Where(w => pageids.Contains(w.ParentLayoutID)).Select<LessonMenu, int?>(s => s.DreamLayoutID).ToList();
        //ddl_user_default.DataSource = ddl_public_default.DataSource = db.DreamLayouts.Where(q => q.DreamID == dr.id && !lessonMenuPages.Contains(q.id)).ToList();
        //ddl_user_default.DataTextField = ddl_public_default.DataTextField = "Page";
        //ddl_user_default.DataValueField = ddl_public_default.DataValueField = "id";
        //ddl_public_default.DataBind();
        //ddl_user_default.DataBind();
        // ViewState.Clear();
        // ViewState["SelectedDreamID"] = id;
        // basicInfo_link_Click(this, EventArgs.Empty);
        // var dreamtags = db.DreamTags.Where(w => w.Dream_id == id).Select<DreamTag, int?>(s => s.Tag_id).ToList();
        // List<string> taglist = db.Tags.Where(w => dreamtags.Contains(w.id)).Select<Tag, string>(s => s.Name).ToList();
        // TagControl.LoadScripts();
        // //TagControl.SetTags(taglist);
        // PageTemplate.LoadTemplateString();
        // addNewPage_btn.Visible = true;
        // addPage_panel.Visible = false;
        // PageName_add.Text = "";
        // userDefault_chk_add.Checked = false;
        // publicDefault_chk_add.Checked = false;
        // publish_chk_add.Checked = false;
        // //navigation_chk_add.Checked = false;
        // ScriptManager.RegisterStartupScript(Page, typeof(Page), "a_key", "OpenMainsTabs();", true);

        // //   PageEdit
        // //bind detail component
        // dreamID = dr.id;
        //var dt =  db.DreamTypes.Where(q => q.id == dr.dreamTypeID).ToList();
        // if(dt.Count()!=0)
        // {
        //     DreamType dtt = dt[0];
        //     if (dtt.DetailPath != null) {
        //         DreamDetail1.clear();
        //         DreamDetail1.bindData(dtt.DetailPath,dr.id);
        //         Detail_Link.Text = dtt.Name; Detail_Link.Visible = true;

        //     }
        //     else { Detail_Link.Text = dtt.Name;DreamDetail1.clear();
        //         Detail_Link.Visible = false;
        //     }
        // }
    }

    public void ShowError(String errorMsg)
    {
        //ErrorMessage.Text = errorMsg;
        //ErrorMessage.Visible = true;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "alert('" + errorMsg + "');", true);
    }

    protected void basicInfo_link_Click(object sender, EventArgs e)
    {
        //basicInfo_link.ForeColor = System.Drawing.Color.White;
        //Detail_panel.Visible = true;
        //Pages_link.ForeColor= System.Drawing.Color.Gray;
        //Pages_panel.Visible = false;
    }

    protected void addNewPage_btn_Click(object sender, EventArgs e)
    {
        //addPage_panel.Visible = true;
        //addNewPage_btn.Visible = false;
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "OpenPageTab();", true);
        //if (ViewState["SelectedDreamID"] != null)
        //{
        //    ViewState["SelectedDreamID"] = ViewState["SelectedDreamID"].ToString();
        //}
    }

    protected void add_Page_Click(object sender, EventArgs e)
    {

        //DreamBirdEntities db = new DreamBirdEntities();
        //if (PageName_add.Text.Equals(""))
        //{
        //    ShowError("Page Name Cannot be Empty");
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "OpenPageTab();", true);
        //    PageName_add.Focus();
        //    return;
        //}
        //if (ViewState["SelectedDreamID"] != null)
        //{
        //    ViewState["SelectedDreamID"] = ViewState["SelectedDreamID"].ToString();
        //}
        //int dream_id = int.Parse(ViewState["SelectedDreamID"].ToString());
        //if (userDefault_chk_add.Checked)
        //{
        //    int count = db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsUserDefaultPage == true).Count();
        //    if (count != 0)
        //    {
        //        ShowError("Default Page Already Exist");
        //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "OpenPageTab();", true);
        //        return;
        //    }

        //}
        //if (publicDefault_chk_add.Checked)
        //{
        //    int count = db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsPublicDefaultPage == true).Count();
        //    if (count != 0)
        //    {
        //        ShowError("Default Page Already Exist");
        //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "OpenPageTab();", true);
        //        return;
        //    }

        //}
        //if (db.DreamLayouts.Where(q => q.DreamID == dream_id && q.Page == PageName_add.Text).Count() != 0)
        //{
        //    ShowError("Page Already Exist");
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "OpenPageTab();", true);
        //    return;
        //}
        //DreamLayout t = new DreamLayout
        //{
        //    DreamID = dream_id,
        //    IsUserDefaultPage = userDefault_chk_add.Checked,
        //    IsPublicDefaultPage = publicDefault_chk_add.Checked,
        //    IsPublished = publish_chk_add.Checked,
        //    //NavEnable = navigation_chk_add.Checked,
        //    Page = PageName_add.Text,
        //};
        //db.DreamLayouts.Add(t);
        //db.SaveChanges();
        //foreach (ListItem item in userRoles.Items)
        //{
        //    DreamPageAuthorization auth = new DreamPageAuthorization();
        //    auth.DreamLayout_id = t.id;
        //    auth.PageRole = item.Text;
        //    auth.isAllowed = item.Selected;
        //    db.DreamPageAuthorizations.Add(auth);
        //}
        //db.SaveChanges();
        //Dream_pages_list.DataSource = db.DreamLayouts.Where(q => q.DreamID == dream_id).ToList();
        //Dream_pages_list.DataBind();
        //ViewState["SelectedDreamID"] = dream_id;
        //// addPage_panel.clearControl();
        //PageName_add.Text = "";
        //userDefault_chk_add.Checked = false;
        //publicDefault_chk_add.Checked = false;
        //publish_chk_add.Checked = false;
        ////navigation_chk_add.Checked = false;
        //addPage_panel.Visible = false;
        //addNewPage_btn.Visible = true;
        //PageTemplate.LoadTemplateString();
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "OpenPageTab();", true);
    }

    protected void Pages_link_Click(object sender, EventArgs e)
    {
        //basicInfo_link.ForeColor = System.Drawing.Color.Gray;
        //Pages_link.ForeColor= System.Drawing.Color.White;
        //Pages_panel.Visible = true;
        //Detail_panel.Visible = false;
    }

    protected void save_page_btn_Click(object sender, EventArgs e)
    {


    }
    
    protected void MediaSelectedEvent(object sender, EventArgs e)
    {
        EventArgMediaSelection evt = (EventArgMediaSelection)e;
        int media_id = evt.SelectedMedia;
        string ResOptions = evt.ResOptions;
        DreamBirdEntities db = new DreamBirdEntities();
        MediaItem item = db.MediaItems.Where(w => w.id == media_id).First();
        if (item.mediaType == "Image")
        {
            if(ResOptions.Equals("500"))
                Dream_img.ImageUrl = item.Path500;
            else if (ResOptions.Equals("100"))
                Dream_img.ImageUrl = item.Path100;
            else if (ResOptions.Equals("Original"))
                Dream_img.ImageUrl = item.PathOriginal;
            
            dream_video.Visible = false;
            Dream_img.Visible = true;
        }
        else if (item.mediaType == "video")
        {
            Dream_img.Visible = false;
            dream_video.Visible = true;
            dream_video.Src = item.path + "/" + item.name;
            dream_video.Attributes.Add("controls", "");
        }
        //Dream_img.ImageUrl = item.PathWithResolution;//.path;
        dreamImg_id.Text = item.id.ToString();
        ViewState["selectedImageID"] =item.id;
        ModalPopupExtender1.Hide();
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenMainsTabs();", true);

    }

    protected void default_chk_CheckedChanged(object sender, EventArgs e)
    {

        //string type = sender.GetType().ToString();

        //if (sender.GetType().ToString() != "System.Web.UI.WebControls.CheckBoxList")
        //{
        //    CheckBox checked_id = (CheckBox)sender;
        //    if (checked_id.Checked == true)
        //    {
        //        foreach (RepeaterItem dli in Dream_pages_list.Items)
        //        {
        //            if (checked_id.ID == "user_default_chk")
        //            {
        //                CheckBox default_page = (CheckBox)dli.FindControl("user_default_chk");
        //                if (default_page != checked_id)
        //                {
        //                    default_page.Checked = !checked_id.Checked;
        //                }
        //            }
        //            else
        //            {
        //                CheckBox default_page = (CheckBox)dli.FindControl("public_default_chk");
        //                if (default_page != checked_id)
        //                {
        //                    default_page.Checked = !checked_id.Checked;
        //                }
        //            }

        //        }


        //    }
        //}


        //saveData_onchange(sender);
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "OpenPageTab();", true);
        //PageTemplate.LoadTemplateString();
        //TagControl.LoadScripts();
    }

    public void saveData_onchange(object sender)
    {

    //    int page_id;
    //    if (sender.GetType().ToString() != "System.Web.UI.WebControls.CheckBoxList")
    //    {
    //        CheckBox chk = (CheckBox)sender;
    //        DreamBirdEntities db = new DreamBirdEntities();

    //        foreach (RepeaterItem dli in Dream_pages_list.Items)
    //        {


    //            Label id = (Label)dli.FindControl("id");

    //            CheckBox default_page = (CheckBox)dli.FindControl("user_default_chk");
    //            CheckBox public_default_page = (CheckBox)dli.FindControl("public_default_chk");
    //            CheckBox published_page = (CheckBox)dli.FindControl("publish_chk");
    //            CheckBox navigation_page = (CheckBox)dli.FindControl("navigation_chk");
    //            page_id = int.Parse(id.Text.ToString());
    //            if (default_page == chk && default_page.Checked)
    //            {
    //                public_default_page.Checked = !default_page.Checked;
    //            }
    //            else
    //            {
    //                if (public_default_page == chk && public_default_page.Checked)
    //                {
    //                    default_page.Checked = !public_default_page.Checked;
    //                }
    //            }
    //            DreamLayout dl = db.DreamLayouts.Where(q => q.id == page_id).First();
    //            dl.IsUserDefaultPage = default_page.Checked;
    //            //dl.NavEnable = navigation_page.Checked;
    //            dl.IsPublished = published_page.Checked;
    //            dl.IsPublicDefaultPage = public_default_page.Checked;
    //            db.SaveChanges();
    //        }
    //    }
    //    else
    //    {
    //        CheckBoxList cbl = (CheckBoxList)sender;
    //        page_id = Convert.ToInt32(cbl.Items[0].Value);
    //        DreamBirdEntities db = new DreamBirdEntities();
    //        var authorizations = db.DreamPageAuthorizations.Where(w => w.DreamLayout_id == page_id).ToList();
    //        foreach (ListItem lst in cbl.Items)
    //        {
    //            foreach (var authorization in authorizations)
    //            {
    //                if (authorization.PageRole == lst.Text)
    //                {
    //                    authorization.isAllowed = lst.Selected;
    //                }
    //            }
    //        }
    //        db.SaveChanges();
    //    }

    //}
    //protected void public_default_chk_CheckedChanged(object sender, EventArgs e)
    //{

    //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "OpenPageTab();", true);
    }






    protected void cmdSelectImage_Click(object sender, EventArgs e)
    {

    }

    protected void delete_page_Click(object sender, EventArgs e)
    {
        int dreamid = Convert.ToInt32(ViewState["SelectedDreamID"].ToString());
        Button btn = (Button)sender;
        string pageName = btn.Attributes["data-pageName"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        DreamLayout dl = new DreamLayout();
        ClientPage cp = new ClientPage();
        if (db.DreamLayouts.Any(a => a.DreamID == dreamid && a.Page == pageName))
        {
            dl = db.DreamLayouts.Where(a => a.DreamID == dreamid && a.Page == pageName).First();
            db.DreamLayouts.Remove(dl);
        }
        if (db.ClientPages.Any(a => a.DreamLayout_id == dreamid && a.Page == pageName))
        {
            cp = db.ClientPages.Where(a => a.DreamLayout_id == dreamid && a.Page == pageName).First();
            db.ClientPages.Remove(cp);
        }
        db.SaveChanges();
        var pageids = db.DreamLayouts.Where(w => w.DreamID == dreamid).Select<DreamLayout, int?>(s => s.id).ToList();
        var lessonMenuPages = db.LessonMenus.Where(w => pageids.Contains(w.ParentLayoutID)).Select<LessonMenu, int?>(s => s.DreamLayoutID).ToList();
        //Dream_pages_list.DataSource = db.DreamLayouts.Where(q => q.DreamID == dreamid && !lessonMenuPages.Contains(q.id)).ToList();
        //Dream_pages_list.DataBind();
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "OpenPageTab()", true);
        //TagControl.LoadScripts();
        //PageTemplate.LoadTemplateString();
    }

    protected void Dream_pages_list_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Button b = (Button)e.Item.FindControl("delete_page");
            if (!allowDelete)
            {
                b.Visible = false;
            }
            CheckBoxList cbl = e.Item.FindControl("userRoles") as CheckBoxList;
            DreamBirdEntities db = new DreamBirdEntities();
            LinkButton lb = e.Item.FindControl("PageName") as LinkButton;
            string PageName = lb.Text;
            int dreamid = Convert.ToInt32(lb.Attributes["data-dreamID"].ToString());
            int layoutid = db.DreamLayouts.Where(w => w.DreamID == dreamid && w.Page == PageName).Select(s => s.id).First();
            var lst = db.DreamPageAuthorizations.Where(w => w.DreamLayout_id == layoutid).ToList();
            cbl.DataSource = lst;
            cbl.DataTextField = "PageRole";
            cbl.DataValueField = "DreamLayout_id";
            cbl.DataBind();
            foreach (ListItem list in cbl.Items)
            {
                foreach (var item in lst)
                {
                    if (list.Text == item.PageRole)
                    {
                        list.Selected = Convert.ToBoolean(item.isAllowed);
                    }
                }
            }
            //Components_Dreams_PageAuthorization item = (Components_Dreams_PageAuthorization)e.Item.FindControl("PageAuthorization");
            //DreamBirdEntities db = new DreamBirdEntities();
            //LinkButton lb = e.Item.FindControl("PageName") as LinkButton;
            //string PageName = lb.Text;
            //int dreamid = Convert.ToInt32(lb.Attributes["data-dreamID"].ToString());
            //int layoutid = db.DreamLayouts.Where(w => w.DreamID == dreamid && w.Page == PageName).Select(s => s.id).First();
            //if(db.DreamPageAuthorizations.Any(a => a.DreamLayout_id == layoutid))
            //{
            //    List<string> lst = db.DreamPageAuthorizations.Where(w => w.DreamLayout_id == layoutid).Select(s => s.PageRole).ToList();
            //    item.setRoles(lst);
            //}
        }
    }
    public void enableInfo(Boolean b)
    {
        //TabNave.Visible = b;

    }
    public void Generalchk_CheckedChanged(object sender, EventArgs e)
    {
        saveData_onchange(sender);
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_keys", "OpenPageTab()", true);
        //PageTemplate.LoadTemplateString();
        TagControl.LoadScripts();

    }

    protected void MediaSelection_closeMediaBank(object sender, EventArgs e)
    {
        ModalPopupExtender1.Hide();
    }

    protected void MediaSelection_MyEvents(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }

    protected void ddl_public_default_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddl_user_default_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}