using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_News_NewControls_NewsSearch : System.Web.UI.UserControl
{
    public event EventHandler SearchClicked;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void search_news_Click(object sender, EventArgs e)
    {
        string newsTitle = news_title.Text;
        string fromDate = from_date.Text;
        string toDate = to_date.Text;

        DateTime from_Date = new DateTime();
        if(!(fromDate.Equals("")))
        from_Date = Convert.ToDateTime(fromDate);
        DateTime to_Date = new DateTime();
        if(!(toDate.Equals("")))
        to_Date = Convert.ToDateTime(toDate);
        DreamBirdEntities db = new DreamBirdEntities();
        List<News> newsList = new List<News>();
        if(!(newsTitle.Equals("")))
        {
            if((fromDate.Equals("")) && !toDate.Equals(""))
            {
                newsList = db.News.Where(w => (w.news_title.Contains(newsTitle) && (w.to_date <= to_Date))).ToList();
            }
            else if((toDate.Equals("")) && !fromDate.Equals(""))
            {
                newsList = db.News.Where(w => (w.news_title.Contains(newsTitle) && (w.from_date >= from_Date))).ToList();
            }
            else if((fromDate.Equals("")) && (toDate.Equals("")))
            {
                newsList = db.News.Where(w => (w.news_title.Contains(newsTitle))).ToList();
            }
        }
        else
        {
            if ((fromDate.Equals("")) && !toDate.Equals(""))
            {
                newsList = db.News.Where(w => (w.to_date <= to_Date)).ToList();
            }
            else if ((toDate.Equals("")) && !fromDate.Equals(""))
            {
                newsList = db.News.Where(w => (w.from_date >= from_Date)).ToList();
            }
        }
        if(SearchClicked != null)
        {
            EventArgNews evt = new EventArgNews();
            evt.newsList = newsList;
            SearchClicked(this, evt);
        }
    }
}