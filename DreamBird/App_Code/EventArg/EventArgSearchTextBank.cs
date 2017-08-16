using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgSearchTextBank
/// </summary>
public class EventArgSearchTextBank: EventArgs
{
    public string searchTextBank_text
    {
        get;
        set;
    }
    public EventArgSearchTextBank()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}