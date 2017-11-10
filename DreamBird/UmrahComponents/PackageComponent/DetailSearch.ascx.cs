using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_PackageComponent_DetailSearch : System.Web.UI.UserControl,ISearch,ICorePackageControl
{
    public event EventHandler DoSearch;
    protected void Page_Load(object sender, EventArgs e)
    {
        PackageEntities db = new PackageEntities();
        if (!IsPostBack)
        {
            monthInput.Value = System.DateTime.Now.Date.ToString("yyyy-MM");
            airLine_list.DataSource = db.AirLines.ToList();
            airLine_list.DataBind();
            bindData(db.PackageDetails.Take(10).ToList());
            if (db.PackageDetails.Count() != 0)
            {
                int max = getmaxPrice();
                int min = getminPrice();
                price_range.Attributes.Add("max", "" + max);
                price_range.Attributes.Add("min", "" + min);
                price_range.Text = price_txt.Text = min.ToString();
               
            }
        }
        PackageUtil.SearchInterface = (ISearch)this;
        DoSearch += sudo_searcher;
    }
    public int getminPrice()
    {
        PackageEntities db = new PackageEntities();
        var data = db.PackageDetails.ToList();
        return int.Parse( data.Min(q => q.minAmount).ToString());

    }
    public int getmaxPrice()
    {
        PackageEntities db = new PackageEntities();
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

        price_lbl.Text = price_filter.Text =price_txt.Text;
        panel1.Visible = true;
        search();

    }

    protected void package_month_TextChanged(object sender, EventArgs e)
    {
        if(package_month.Text != "") { 
        DateTime dt = DateTime.Parse(package_month.Text);
      //  int month = dt.ToString("Month");
        month_filter.Text = dt.ToString("MMMM");
        panel2.Visible = true;
        search();
    }
    }

    protected void duration_txt_TextChanged(object sender, EventArgs e)
    {
        dur_lbl.Text = duration_filter.Text = duration_lbl.Text;
        panel3.Visible = true;
        search();
    }

    protected void airLine_list_SelectedIndexChanged(object sender, EventArgs e)
    {
        flight_filter.Text = airLine_list.SelectedItem.Text;
        panel4.Visible = true;
        search();
    }

    protected void distanceHaram_txt_TextChanged(object sender, EventArgs e)
    {

        hd_lbl.Text =hd_filter.Text = haram_distance.Text;
        panel5.Visible = true;
        search();
    }

    protected void distanceMadina_txt_TextChanged(object sender, EventArgs e)
    {

        md_lbl.Text=md_filter.Text = madina_distance.Text;
        panel6.Visible = true;
        search();
    }
    protected void delete_filter(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        string id = "panel" + lk.CommandArgument;
        Control myControl1 = FindControl(id);
        myControl1.Visible = false;
        search();
    }
    protected void search()
    {
        PackageEntities db = new PackageEntities();
        List<PackageDetail> data = db.PackageDetails.ToList();
        if (panel1.Visible)
        { int budget = int.Parse(price_range.Text);
        data = data.Where(q => q.maxAmount == budget).ToList();
        }
        if(panel2.Visible)
        {
            DateTime dt = DateTime.Parse(package_month.Text);
            int month = dt.Month;
            data = data.Where(q => q.getVisaMonth == month).ToList();
        }
        if(panel3.Visible)
        {
            int duration = int.Parse(duration_txt.Text);
            data = data.Where(q => q.duration == duration).ToList();
        }
        if(panel4.Visible)
        {
            int airLineID = int.Parse(airLine_list.SelectedValue);
            data = data.Where(q => q.Flight1.airLineID == airLineID).ToList();
        }
        if(panel5.Visible)
        {
            float haramDistance = float.Parse(distanceHaram_txt.Text);
            data = data.Where(q => q.Hotel1.distance == haramDistance).ToList();
        }
        if(panel6.Visible)
        {

            float MadinaDistance = float.Parse(distanceMadina_txt.Text);
            data = data.Where(q => q.Hotel.distance == MadinaDistance).ToList();
        }
       
        //bindData(data_packages);
        EventArgPackageSearch evt = new EventArgPackageSearch();
        evt.packageList = data;
        if (DoSearch != null)
        {
            DoSearch(this, evt);
        }
    }

    protected void clear_Click(object sender, EventArgs e)
    {
        panel1.Visible = panel2.Visible = panel3.Visible = panel4.Visible = panel5.Visible = panel6.Visible = false;
        search();
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

    public void SetBasePackageControl(IBasePackageControl BasePackageControl)
    {
        //throw new NotImplementedException();
    }
}