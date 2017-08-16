using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgAirLineClicked
/// </summary>
public class EventArgAirLineClicked: EventArgs
{
    public EventArgAirLineClicked()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int AirLineID
    {
        get;
        set;
    }
   
}