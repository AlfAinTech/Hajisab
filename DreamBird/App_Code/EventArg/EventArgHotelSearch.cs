using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgHotelSearch
/// </summary>
public class EventArgHotelSearch : EventArgs
{
    private String searchHotelName;
    public EventArgHotelSearch()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public String SearchHotelName
    {
        get
        {
            return searchHotelName;
        }

        set
        {
            searchHotelName = value;
        }
    }
}