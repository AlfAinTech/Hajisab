using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_AddControls : System.Web.UI.UserControl
{
    public event EventHandler ControlAdded;
    public event EventHandler ControlSaved;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            ddl_controlCat.DataSource = db.ControlCategories.ToList();
            ddl_controlCat.DataTextField = "Name";
            ddl_controlCat.DataValueField = "id";
            ddl_controlCat.DataBind();
        }
    }

    protected void MediaBankControl_MediaSelectedEvent(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        EventArgMediaSelection evt = e as EventArgMediaSelection;
        int MediaID = evt.SelectedMedia;
        MediaItem media_item = db.MediaItems.Where(W => W.id == MediaID).First();
        img_control.ImageUrl = media_item.PathWithResolution;//.path;
        Img_id.Text = media_item.id.ToString();
        popup_mediaBank.Hide();
        ViewState["selectedImageID"] = media_item.id;
        ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "script_show_modal", "$('#AddsControls').modal('show');", true);


        //ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "a_key", "OpenMainsTabs()", true);
    }

    protected void MediaBankControl_MyEvents(object sender, EventArgs e)
    {
        popup_mediaBank.Show();
        ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "script_showModal", "$('#AddsControls').modal('show');", true);
    }

    protected void MediaBankControl_SomeThindDone(object sender, EventArgs e)
    {
        popup_mediaBank.Show();
    }

    protected void save_Changes_Click(object sender, EventArgs e)
    {

        DreamBirdEntities db = new DreamBirdEntities();
        HTMLControl control = new HTMLControl();
        string controlname = controlName.Text;
        if(db.HTMLControls.Any(a => a.Name == controlname))
        {
            control = db.HTMLControls.Where(w => w.Name == controlname).First();
        }
        control.Name = controlName.Text;
        control.IconURL = int.Parse(ViewState["selectedImageID"].ToString());
        control.NormalMarkup = NormalMarkup.Text;
        control.isSeperateWindow = ch_seperate.Checked;
        control.DefautControlName = DefaultControlName.Text;
        control.AdminControlPath = AdminPagePath.Text;
        control.DeleteControlPath = DeletePagePath.Text;
        control.isProgress = isProgress.Checked;
        int catid = Convert.ToInt32(ddl_controlCat.SelectedItem.Value);
        control.ControlCategory_id = catid;
        if (!(db.HTMLControls.Any(a => a.Name == controlname)))
        {
            db.HTMLControls.Add(control);
        }
        db.SaveChanges();
        if (ControlAdded != null)
        {
            ControlAdded(this, EventArgs.Empty);
        }
        if(ControlSaved != null)
        {
            EventArgControlSearch evt = new EventArgControlSearch();
            evt.ControlCategory = control.id;
            ControlSaved(this, evt);
        }
        ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "script_show_modal", "$('.modal-backdrop').each(function(){ $(this).remove(); });;", true);

    }

    public void EditDataBind(HTMLControl control)
    {
        controlName.Text = control.Name;
        NormalMarkup.Text = control.NormalMarkup;
        AdminPagePath.Text = control.AdminControlPath;
        ch_seperate.Checked = Convert.ToBoolean(control.isSeperateWindow);
        DefaultControlName.Text = control.DefautControlName;
        ddl_controlCat.SelectedValue = control.ControlCategory_id.ToString();
        DeletePagePath.Text = control.DeleteControlPath;
        DreamBirdEntities db = new DreamBirdEntities();
        img_control.ImageUrl = control.MediaItem.Path500;
        ViewState["selectedImageID"] = control.MediaItem.id;
        Img_id.Text = control.MediaItem.id.ToString();
        isProgress.Checked = Convert.ToBoolean(control.isProgress);
    }

   
}