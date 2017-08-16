using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Navigation_NavigationControl : CoreDreamControlAdapter
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        DreamBirdEntities db;
        db = new DreamBirdEntities();
        if (!Page.IsPostBack)
        {

            BindData();
        }
    }

    private void BindContent(int dreamID)
    {
       // DreamLayout dreamLayout = db.DreamLayouts.First(d => d.DreamID == dreamID);
        //txtContents.Text = dreamLayout.Layout;

    }

    protected void Img_dd_SelectedIndexChanged(object sender, EventArgs e)
    {
    //String path = "D:/DreamBird/DreamBird" + Img_dd.SelectedValue.ToString();
      //  icon.ImageUrl = path;
       // HyperLink1.Text = path;
       // HyperLink1.NavigateUrl = path;
       // lbl.Text = path;
    }

    override
    public void BindData()
    {
        String url = string.Format("{0}", Page.Request.Url.PathAndQuery);
        String dream_name = DreamUtil.getDreamNameFromURL(url).ToString();
        String page_name = DreamUtil.getPageNameFromURL(url).ToString();
        DreamBirdEntities db = new DreamBirdEntities();

        int layout_id = db.DreamLayouts.Where(d => d.Dream.DreamName == dream_name && d.Page == page_name).First().id;
        Nav_data_list.DataSource = db.Navigations.Where(q=> q.Layout_id == layout_id).ToList();
        Nav_data_list.DataBind();

    }

    //protected void load_Click(object sender, EventArgs e)
    //{
    //    //String path =  ddlImg.SelectedValue.ToString();
    //    //icon.ImageUrl = path;


    //}


}