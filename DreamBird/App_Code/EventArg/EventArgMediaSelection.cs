using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgMediaSelection
/// </summary>
public class EventArgMediaSelection : EventArgs
{
    public EventArgMediaSelection()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private int selectedMedia;
    public int SelectedMedia
    {
        get
        {
            return selectedMedia;
        }

        set
        {
            selectedMedia = value;
        }
    }

    private string resOptions;
    public string ResOptions
    {
        get
        {
            return resOptions;
        }
        set
        {
            resOptions = value;
        }
    }
}