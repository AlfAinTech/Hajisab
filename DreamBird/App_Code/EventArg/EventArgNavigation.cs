using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgNavigation
/// </summary>
public class EventArgNavigation: EventArgs
{
    private int selectedNavigationID;
    public EventArgNavigation()
    {
        //
        // TODO: Add constructor logic here
        //

    }

    public int SelectedNavigationID
    {
        get
        {
            return selectedNavigationID;
        }

        set
        {
            selectedNavigationID = value;
        }
    }
}