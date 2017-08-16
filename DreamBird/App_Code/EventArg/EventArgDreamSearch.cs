using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgDream
/// </summary>
public class EventArgDreamSearch : EventArgs
{
    private String searchDreamName;
    public EventArgDreamSearch()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public String SearchDreamName
    {
        get
        {
            return searchDreamName;
        }

        set
        {
            searchDreamName = value;
        }
    }

    private List<string> tags = new List<string>();
    public List<string> Tags
    {
        get
        {
            return tags;
        }
        set
        {
            tags = value;
        }
    }
}