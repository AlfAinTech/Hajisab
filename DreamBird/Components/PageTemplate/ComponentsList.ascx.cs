using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_ComponentsList : System.Web.UI.UserControl
{
    public event EventHandler thumb_clicked;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void BindData(int id)
    {
        lbl_message.Visible = false;
        DreamBirdEntities db = new DreamBirdEntities();
        rprt_controls.DataSource = db.HTMLControls.Where(w => w.ControlCategory_id == id).ToList();
        rprt_controls.DataBind();
    }

    public void BindData(string controlName)
    {
        lbl_message.Visible = false;
        DreamBirdEntities db = new DreamBirdEntities();
        rprt_controls.DataSource = db.HTMLControls.Where(w => w.Name.Contains(controlName)).ToList();
        rprt_controls.DataBind();
    }

    protected void img_thumb_Click(object sender, ImageClickEventArgs e)
    {
        EventArgControlSearch evt = new EventArgControlSearch();
        ImageButton imgb = (ImageButton)sender;
        DreamBirdEntities db = new DreamBirdEntities();
        int id = Convert.ToInt32(imgb.Attributes["control-id"].ToString());
        int cat_id = Convert.ToInt32(imgb.Attributes["cat-id"].ToString());
        HTMLControl control = db.HTMLControls.Where(w => w.id == id && w.ControlCategory_id == cat_id).First();
        AddControls.EditDataBind(control);
        ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "script_show_modal", "$('#AddsControls').modal('show');", true);
    }

    protected void ControlSaved(object sender, EventArgs e)
    {
        EventArgControlSearch evt = (EventArgControlSearch)e;
        int id = evt.ControlCategory;
        BindData(id);
    }
}