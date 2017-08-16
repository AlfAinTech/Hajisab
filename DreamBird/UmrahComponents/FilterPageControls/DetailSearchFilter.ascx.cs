using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_FilterPageControls_DetailSearchFilter : System.Web.UI.UserControl, ISearch, ICoreDreamControl
{
     public event EventHandler DoSearch;
    protected void Page_Load(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        DreamUtil.SearchInterface = (ISearch)this;
        DoSearch += sudo_searcher;
        if (!IsPostBack)
        {
            //monthInput.Value = System.DateTime.Now.Date.ToString("yyyy-MM");
            control5.DataSource = db.AirLines.ToList();
            control5.DataBind();
            control5.Items.Insert(0, new ListItem("--Select--", ""));
            control5.SelectedIndex = 0;
            bindData(db.PackageDetails.ToList());
            if (db.PackageDetails.Count() != 0)
            {
                var data = db.PackageDetails.ToList();
                double max = getmaxPrice();
                control1.Attributes.Add("max", "" + max);
                control1.Attributes.Add("min", "" + 0);
                control1.Text = "0";
                max = int.Parse(data.Max(q => q.getTotelNights).ToString());
                control3.Attributes.Add("max", "" + max);
                control3.Attributes.Add("min", "" + 0);
                control3.Text = "0";
                max = data.Max(q => q.Hotel1.distance);
                control6.Attributes.Add("max", "" + max);
                control6.Attributes.Add("min", "" + 0);
                control6.Attributes.Add("step", "" + 50);
                control6.Text = "0";

            }

            if (Request.QueryString["minPrice"] != null )
            {
                control1.Text = Request.QueryString["minPrice"].ToString();
                
                price_range_TextChanged(sender, e);
            }
            if (Request.QueryString["rating"] != null )
            {
                control4.SelectedIndex = int.Parse(Request.QueryString["rating"].ToString());
                rating_Changed(sender, e);
            }
            if (Request.QueryString["totelNights"] != null )
            {
                control3.Text = Request.QueryString["totelNights"].ToString();
                duration_txt_TextChanged(sender, e);
            }
            
            
        }
       
    }
    public int getminPrice()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var data = db.PackageDetails.ToList();
        return int.Parse( data.Min(q => q.minAmount).ToString());

    }
    public int getmaxPrice()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var data = db.PackageDetails.ToList();
        return int.Parse(data.Max(q => q.minAmount).ToString());

    }
    protected void sudo_searcher(object sender, EventArgs e)
    {

    }
    public void bindData(List<PackageDetail> data)
    {
        //PackageListView.bindData(data);
        
    }
    protected void price_range_TextChanged(object sender, EventArgs e)
    {

        if (int.Parse(control1.Text) == 0)
        {
            delete_filter(btn1, EventArgs.Empty);
        }
        else
        { panel1.Visible = true; search(); ScriptManager.RegisterStartupScript(Page, typeof(Page), "myScript", "bindDataScript();", true); }
    }
        
    
    protected void package_month_TextChanged(object sender, EventArgs e)
    {
        if(control2.Text != "") { 
        DateTime dt = DateTime.Parse(control2.Text);
        panel2.Visible = true;
        search();
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "bindData", "bindDataScript();", true);
        }
        else
        {
            delete_filter(btn2, EventArgs.Empty);
        }
    }

    protected void duration_txt_TextChanged(object sender, EventArgs e)
    {
        if(int.Parse(control3.Text) != 0) { 
        panel3.Visible = true;
        search();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "bindData", "bindDataScript();", true);
        }
        else  {
            delete_filter(btn3, EventArgs.Empty);
        }
    }

    protected void airLine_list_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (control5.SelectedIndex != 0)
        {
            panel5.Visible = true;
            search();
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "bindData", "bindDataScript();", true);
        }
        else { delete_filter(btn5, EventArgs.Empty); }
    }

    protected void rating_Changed(object sender, EventArgs e)
    {
        if (control4.SelectedIndex != 0)
        {
        panel4.Visible = true;
        search();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "bindData", "bindDataScript();", true);
        }
         else { delete_filter(btn4, EventArgs.Empty); }
    }
    protected void distanceHaram_txt_TextChanged(object sender, EventArgs e)
    {
        if(int.Parse(control6.Text) != 0) { 
        panel6.Visible = true;
        search();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "bindData", "bindDataScript();", true);
        }
        else { delete_filter(btn6, EventArgs.Empty); }
    }

   
    protected void delete_filter(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        string id = "panel" + lk.CommandArgument;
        Control myControl1 = FindControl(id);
        myControl1.Visible = false;
        string controlID = "control" + lk.CommandArgument;
        Control myControl2 = FindControl(controlID);
        if (myControl2.GetType().Name == "TextBox")
        {
            TextBox tb = (TextBox)myControl2;
            tb.Text = tb.Attributes["min"];
        }
        else
        {
            DropDownList dp = (DropDownList)myControl2;
            dp.SelectedIndex = 0;
        }
        

        search();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "bindData", "bindDataScript();", true);
    }
    protected void search()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        List<PackageDetail> data = db.PackageDetails.ToList();
        if (panel1.Visible)
        { int budget = int.Parse(control1.Text);
        data = data.Where(q => q.minAmount <= budget).ToList();
        }
        if(panel2.Visible)
        {
            DateTime dt = DateTime.Parse(control2.Text);
            int month = dt.Month;
            data = data.Where(q => q.getStartMonth == month).ToList();
        }
        if(panel3.Visible)
        {
            int duration = int.Parse(control3.Text);
            data = data.Where(q => q.duration <= duration).ToList();
        }
        if(panel4.Visible)
        {
            int rating = int.Parse(control4.SelectedValue);
            data = data.Where(q => q.Hotel1.rating == rating || q.Hotel.rating == rating).ToList();
        }
        if(panel5.Visible)
        {
            int airLineID = int.Parse(control5.SelectedValue);
            data = data.Where(q => q.Flight1.airLineID == airLineID).ToList();
        }
        if(panel6.Visible)
        {
            float haramDistance = float.Parse(control6.Text);
            data = data.Where(q => q.Hotel1.distance <= haramDistance).ToList();

        }
        EventArgPackageSearch evt = new EventArgPackageSearch();
        foundRecord.Text = data.Count().ToString()+ " Records Found";
        evt.packageList = data;
        if(Request.QueryString.Count!=0)
        {
            
            Session["EventArgPackageSearch"] = evt;
          ScriptManager.RegisterStartupScript(Page, typeof(Page), "bindData", "bindDataScript();", true);
        }

        if (DoSearch != null)
        {
            DoSearch(this, evt);
        }
    }

    protected void clear_Click(object sender, EventArgs e)
    {
        panel1.Visible = panel2.Visible = panel3.Visible = panel4.Visible = panel5.Visible = panel6.Visible = false;
        search();
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "bindData", "bindDataScript()", true);
    }

   

    public void BindData()
    {
      //  throw new NotImplementedException();
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
       // throw new NotImplementedException();
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
       // throw new NotImplementedException();
    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {
        //throw new NotImplementedException();
    }
}