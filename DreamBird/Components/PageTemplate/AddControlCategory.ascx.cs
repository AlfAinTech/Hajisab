using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_AddControlCategory : System.Web.UI.UserControl
{
    public event EventHandler CategoryAdded;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        if (!(cat_name.Text.Equals("")))
        {
            DreamBirdEntities db = new DreamBirdEntities();
            ControlCategory cc = new ControlCategory();
            string catname = cat_name.Text;
            if (db.ControlCategories.Any(a => a.Name == catname))
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "add_cat", "alert('Category Already Exists, Please Change the Name');", true);
            }
            else
            {
                cc.Name = cat_name.Text;
                cc.remarks = null;
                db.ControlCategories.Add(cc);
                db.SaveChanges();
                if (CategoryAdded != null)
                    CategoryAdded(this, EventArgs.Empty);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, typeof(UpdatePanel), "KeyCheck", "alert('Please Add Category Name');", true);
        }

    }
}