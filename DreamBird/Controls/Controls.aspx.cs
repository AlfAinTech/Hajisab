using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_Controls : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        TextBox name = (TextBox)DetailsView1.FindControl("TextBox1");
        DropDownList ddl = (DropDownList)DetailsView1.FindControl("DropDownList1");
        FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload1");
        TextBox NormalMarkup = (TextBox)DetailsView1.FindControl("TextBox4");
        TextBox OnEditMarkup = (TextBox)DetailsView1.FindControl("TextBox5");
        TextBox OnSettingChanged = (TextBox)DetailsView1.FindControl("TextBox6");
        TextBox AdminControl = (TextBox)DetailsView1.FindControl("TextBox7");
        TextBox DefaultControl = (TextBox)DetailsView1.FindControl("TextBox8");


        HTMLControl control = new HTMLControl();
        control.Name = name.Text;
        //control.Category = ddl.SelectedItem.Value;
        //control.IconURL = fu.FileName;
        control.NormalMarkup = NormalMarkup.Text;
        //control.OnEditMarkup = OnEditMarkup.Text;
        //control.OnSettingChangedMarkup = OnSettingChanged.Text;
        //control.AdminControlName = AdminControl.Text;
        control.DefautControlName = DefaultControl.Text;

        fu.SaveAs(Server.MapPath("~/Components/DragDropFramework/Uploads/" + fu.FileName));

        DreamBirdEntities db = new DreamBirdEntities();
        db.HTMLControls.Add(control);
        db.SaveChanges();


    }

    protected void BtnClick(object sender, EventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.Insert);
    }
}