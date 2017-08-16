using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgHotelClicked
/// </summary>
public class EventArgHotelClicked: EventArgs
{
    public EventArgHotelClicked()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int hotelID
    {
        get;
        set;
    }
    
}