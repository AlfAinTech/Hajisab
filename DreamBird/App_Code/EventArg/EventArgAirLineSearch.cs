using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AirLineSearch
/// </summary>
public class EventArgAirLineSearch:EventArgs
{
    public EventArgAirLineSearch()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public String SearcText
    {
        get;
        set;
    }
}