using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgControlSearch
/// </summary>
public class EventArgControlSearch : EventArgs
{
    public EventArgControlSearch()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int ControlCategory
    {
        get;
        set;
    }

    public int DreamID
    {
        get;
        set;
    }

    //public HTMLControl control
    //{
    //    get;
    //    set;
    //}

    public string SearchKeyword
    {
        get;
        set;
    }
    public string LayoutName
    {
        get;
        set;
    }
}