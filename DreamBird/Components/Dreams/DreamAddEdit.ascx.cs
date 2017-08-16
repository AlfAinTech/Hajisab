using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_DreamAddEdit : System.Web.UI.UserControl,ICoreUserControl
{
    public event EventHandler DreamAdded;
    public int selectedDream;
    protected void Page_Load(object sender, EventArgs e)
    {
        ErrorMessage.Visible = false;
    }

    protected void dream_add_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db;
        db = new DreamBirdEntities();
       if(default_chk.Checked)
        {
             int default_dreams_count= db.Dreams.Where(q => q.IsDefault == true).Count();
            if(default_dreams_count != 0)
            {
                ShowError("Default Dream Already Exist");
                return;
            }
        }
        if (ViewState["SelectedDreamID"] == null)
        {
            var d = new Dream //Make sure you have a table called test in DB
            {
                DreamName = DreamName_txt.Text.ToString(),
                MediaItem_id = int.Parse(dreamImg_id.Text),
                Description = DereamDetail_txt.Text.ToString(),
                IsFeatured = feature_chk.Checked,
            };
            db.Dreams.Add(d);
            db.SaveChanges();
            this.clearControl();
            DreamAdded(this, EventArgs.Empty);

        }
        else
        {
            selectedDream = int.Parse(ViewState["SelectedDreamID"].ToString());
            Dream d = db.Dreams.Where(q => q.id == selectedDream).First();
            d.DreamName = DreamName_txt.Text;
            d.Description = DereamDetail_txt.Text;
            d.MediaItem_id = int.Parse(dreamImg_id.Text);
            d.IsFeatured = feature_chk.Checked;
            db.SaveChanges();
        }
       
      

    }
    //public void ClearControl(Control control)
    //{
    //    var textbox = control as TextBox;
    //    if (textbox != null)
    //        textbox.Text = string.Empty;

    //    //var dropDownList = control as DropDownList;
    //    //if (dropDownList != null)
    //    //    dropDownList.SelectedIndex = 0;
    //    //var radioButton = control as RadioButton;
    //    //if (radioButton != null)
    //    //    radioButton.Checked = false;
    //    var image = control as Image;
    //    if (image != null)
    //        image.ImageUrl = "";



    //    foreach (Control childControl in control.Controls)
    //    {
    //        ClearControl(childControl);
    //    }
    //}

    protected void cancel_Click(object sender, EventArgs e)
    {
        DreamAdded(this, EventArgs.Empty);

    }
    public void EditDataBind(int id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        Dream dr = db.Dreams.Where(q => q.id == id).First();
        DreamName_txt.Text = dr.DreamName;
        DereamDetail_txt.Text = dr.Description;

        MediaItem selected_dream_img = db.MediaItems.Where(q => q.id == dr.MediaItem_id).First();
        Dream_img.ImageUrl = selected_dream_img.PathWithResolution;
        MediaBankControl.setMediaItem(selected_dream_img.id);
        DreamPageEdit.BindEditPage_Data(dr.id);
        DreamPageEdit.Visible = true;
        ViewState["SelectedDreamID"] = id;
     //   PageEdit

    }
    protected void MediaBankControl1_MediaSelected(object sender, EventArgs e)
    {

        MediaItem media_item;
        media_item = MediaBankControl.SelectedMediaItem;

        Dream_img.ImageUrl = media_item.PathWithResolution;//.path;
        dreamImg_id.Text = media_item.id.ToString();
        ViewState["selectedImageID"] = media_item.id;
    }
    protected void MediaBankControl1_MyEvents(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();

    }

    protected void back_link_Click(object sender, EventArgs e)
    {
        DreamAdded(this, EventArgs.Empty);
    }
    public void ShowError(String errorMsg)
    {
        ErrorMessage.Text = errorMsg;
        ErrorMessage.Visible = true;
    }

   

    public void clearControl()
    {
        dreamImg_id.Text = "";
        DreamName_txt.Text = "";
        DereamDetail_txt.Text = "";
        
    }
}