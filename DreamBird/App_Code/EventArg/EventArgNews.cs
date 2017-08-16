using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgNews
/// </summary>
public class EventArgNews : EventArgs
{
    public EventArgNews()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private int NewsID;

    public int newsID
    {
        get
        {
            return NewsID;
        }

        set
        {
            NewsID = value;
        }
    }

    private List<News> news_list;
    public List<News> newsList
    {
        get
        {
            return news_list;
        }
        set
        {
            news_list = value;
        }
    }
}