using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgDreamSort
/// </summary>
public class EventArgDreamSort: EventArgs
{
    private String dreamSortField;
    public EventArgDreamSort()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public String DreamSortField
    {
        get
        {
            return dreamSortField;
        }

        set
        {
            dreamSortField = value;
        }
    }
}