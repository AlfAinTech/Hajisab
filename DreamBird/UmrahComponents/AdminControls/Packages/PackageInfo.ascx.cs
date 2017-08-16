using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminControls_Packages_PackageInfo : System.Web.UI.UserControl
{
    public event EventHandler packageAdded;
    public int selectedPackage;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

        }
    }



    protected void SomeThingElseDone(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_keys", "<script type='text/javascript'>Sys.Application.add_load(OpenCollapse);</script>", false);
    }

    protected void package_add_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DreamBirdEntities db;
            db = new DreamBirdEntities();
            Package d;
            if (ViewState["SelectedPackageID"] == null)
            {
                if (!(db.Packages.Any(w => w.name == Name_txt.Text)))
                {
                    d = new Package //Make sure you have a table called test in DB
                    {
                        name = Name_txt.Text.ToString(),
                        mediaID = int.Parse(packageImg_id.Text),
                        description = description_txt.InnerText.ToString(),
                        startDate = DateTime.Parse(startDate_txt.Text),
                        duration = int.Parse(duration_txt.Text)
                    };

                    db.Packages.Add(d);
                    db.SaveChanges();

                    ViewState["SelectedhotelID"] = Convert.ToInt32(d.id);
                    this.clearControl();

                }
                else
                {
                    ShowError("Dream Already Exist! Change the Name and try again");
                    return;
                }

            }
            else
            {
                selectedPackage = int.Parse(ViewState["SelectedPackageID"].ToString());
                d = db.Packages.Where(q => q.id == selectedPackage).First();
                d.name = Name_txt.Text;
                d.description = description_txt.InnerText.ToString();
                d.mediaID = int.Parse(packageImg_id.Text);
                d.duration = int.Parse(duration_txt.Text);
                d.startDate = DateTime.Parse(startDate_txt.Text);
                db.SaveChanges();

            }
            if (packageAdded != null)
            {
                EventArgPackageClicked evt = new EventArgPackageClicked();
                evt.PackageID = d.id;
                packageAdded(this, evt);
            }
            //TagControl.LoadScripts();
           // ScriptManager.RegisterStartupScript(Page, typeof(Page), "a_key", "OpenMainsTabs();", true);


        }
    }
    public void clearControl()
    {
        Name_txt.Text = "";
        startDate_txt.Text = "";
        description_txt.InnerText = "";
        packageImg_id.Text = "";
        package_video.Src = "";
        package_video.Visible = false;
        package_img.Visible = true;
        package_img.ImageUrl = "";
        ViewState.Clear();
        duration_txt.Text = "0";
        //navigation_chk_add.Checked = false;

        MediaBankControl.LoadScripts();

    }


    public void EditDataBind(int id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        Package dr = db.Packages.Where(q => q.id == id).First();
        Name_txt.Text = dr.name;
        description_txt.InnerText = dr.description;
        duration_txt.Text = dr.duration.ToString();
        DateTime dd = dr.startDate;
        startDate_txt.Text = dd.ToString("yyyy-MM-dd");
        MediaItem selected_pkg_img;
        if (dr.MediaItem != null)
        {
            selected_pkg_img = db.MediaItems.Where(q => q.id == dr.mediaID).First();

            MediaBankControl.setMediaItem(selected_pkg_img.id);
            ViewState["selectedImageID"] = selected_pkg_img.id;

            if (selected_pkg_img.mediaType == "Image")
            {
                package_img.ImageUrl = selected_pkg_img.Path100;
                package_video.Visible = false;
                package_img.Visible = true;
                package_img.Style.Add("display", "block");
                package_video.Style.Add("display", "none");
            }
            else if (selected_pkg_img.mediaType == "video")
            {
                package_img.Visible = false;
                package_video.Visible = true;
                package_img.Style.Add("display", "none");
                package_video.Style.Add("display", "block");
                package_video.Src = selected_pkg_img.Path480;
                package_video.Attributes.Add("controls", "");
            }
        }
        ViewState.Clear();
        ViewState["SelectedPackageID"] = id;

        //navigation_chk_add.Checked = false;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "a_key", "OpenMainsTabs();", true);

        //   PageEdit

    }


    protected void CloseMediaBank(object sender, EventArgs e)
    {
        ModalPopupExtender1.Hide();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "a_key", "OpenMainsTabs();", true);
    }
    protected void MediaBankControl1_MediaSelected(object sender, EventArgs e)
    {
        MediaItem media_item;
        media_item = MediaBankControl.SelectedMediaItem;
        if (media_item.mediaType == "image" || media_item.mediaType == "image")
        {
            package_img.ImageUrl = media_item.PathWithResolution;
            package_video.Visible = false;
            package_img.Visible = true;
            package_img.Style.Add("display", "block");
            package_video.Style.Add("display", "none");
        }
        else if (media_item.mediaType == "video")
        {
            package_img.Visible = false;
            package_video.Visible = true;
            package_video.Src = media_item.Path480;
            package_video.Attributes.Add("controls", "");
            package_img.Style.Add("display", "none");
            package_video.Style.Add("display", "block");
        }
        package_img.ImageUrl = media_item.PathWithResolution;//.path;
        packageImg_id.Text = media_item.id.ToString();
        ViewState["selectedImageID"] = media_item.id;
        ModalPopupExtender1.Hide();
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_key", "OpenMainsTabs();", true);

    }
    protected void MediaBankControl1_MyEvents(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }


    public void ShowError(String errorMsg)
    {
        //ErrorMessage.Text = errorMsg;
        //ErrorMessage.Visible = true;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "showError", "alert('" + errorMsg + "');", true);
    }

    protected void cmdSelectImage_Click(object sender, EventArgs e)
    {

    }
    protected void MediaBankControl_SomeThindDone(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "a_key", "OpenMainsTabs();", true);
    }
}