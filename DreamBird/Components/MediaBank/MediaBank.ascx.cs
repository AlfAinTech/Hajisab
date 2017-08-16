using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_MediaBank_MediaBank : System.Web.UI.UserControl
{
    public event EventHandler MediaSelected;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            ddl_mediaType.DataSource = db.MediaItems.Select(s => s.mediaType).Distinct().ToList();
            ddl_mediaType.DataBind();
            //Eddl_mediaType.DataSource = db.MediaItems.Select(s => s.mediaType).Distinct().ToList();
            //Eddl_mediaType.DataBind();
            ListItem lst = new ListItem();
            lst.Value = "All";
            lst.Text = "All";
            ddl_mediaType.Items.Insert(0, lst);
            ddl_media_cat.DataSource = db.MediaCategories.ToList();
            ddl_media_cat.DataValueField = "id";
            ddl_media_cat.DataTextField = "CategoryName";
            ddl_media_cat.DataBind();
            existing_groups.DataSource = db.MediaCategories.ToList();
            existing_groups.DataValueField = "id";
            existing_groups.DataTextField = "CategoryName";
            existing_groups.DataBind();
        }
    }

    protected void select_media_Click(object sender, EventArgs e)
    {
        int ItemID = Convert.ToInt32(MediaItemID.Value);
        EventArgMediaSelection evt = new EventArgMediaSelection();
        evt.SelectedMedia = ItemID;
        evt.ResOptions = ddl_res.SelectedValue;
        if(MediaSelected != null)
        {
            MediaSelected(this, evt);
        }
    }

    protected void GroupMediaItems_Click(object sender, EventArgs e)
    {
        var MediaIDS = group_items_ids.Value.Split('|');
        string GroupName = new_group_name.Text;
        DreamBirdEntities db = new DreamBirdEntities();
        if(db.MediaCategories.Any(a => a.CategoryName == GroupName))
        {
            int MediaCategoryID = db.MediaCategories.Where(w => w.CategoryName == GroupName).Select(s => s.id).First();
            foreach(string MediaID in MediaIDS)
            {
                int MediaItemID = Convert.ToInt32(MediaID);
                db.MediaItems.Where(w => w.id == MediaItemID).First().MediaCategory_id = MediaCategoryID;
            }
            db.SaveChanges();
        }
        else
        {
            MediaCategory category = new MediaCategory();
            category.CategoryName = GroupName;
            db.MediaCategories.Add(category);
            db.SaveChanges();
            int MediaCategoryID = category.id;
            foreach (string MediaID in MediaIDS)
            {
                int MediaItemID = Convert.ToInt32(MediaID);
                db.MediaItems.Where(w => w.id == MediaItemID).First().MediaCategory_id = MediaCategoryID;
            }
            db.SaveChanges();
        }
        ddl_media_cat.DataSource = db.MediaCategories.ToList();
        ddl_media_cat.DataValueField = "id";
        ddl_media_cat.DataTextField = "CategoryName";
        ddl_media_cat.DataBind();
        existing_groups.DataSource = db.MediaCategories.ToList();
        existing_groups.DataValueField = "id";
        existing_groups.DataTextField = "CategoryName";
        existing_groups.DataBind();

    }

    protected void Save_External_Video_Click(object sender, EventArgs e)
    {
        string VideoName = Video_Name.Text;
        string EmbedCode = Video_Embed_Code.Text;
        MediaItem item = new MediaItem();
        item.name = "";
        item.name = VideoName;
        item.path = EmbedCode;
        item.mediaType = "video";
        item.MediumType = "External";
        item.MediaCategory_id = 1;
        item.DateAdded = System.DateTime.Now;
        DreamBirdEntities db = new DreamBirdEntities();
        db.MediaItems.Add(item);
        db.SaveChanges();
    }

    protected void save_external_img_Click(object sender, EventArgs e)
    {
        string ImageName = img_name.Text;
        string ImageURL = img_url.Text;
        MediaItem item = new MediaItem();
        item.name = ImageName;
        item.path = ImageURL;
        item.mediaType = "Image";
        item.MediumType = "External";
        item.MediaCategory_id = 1;
        item.DateAdded = System.DateTime.Now;
        DreamBirdEntities db = new DreamBirdEntities();
        db.MediaItems.Add(item);
        db.SaveChanges();
    }
}