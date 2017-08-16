using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgDreamEdit
/// </summary>
public class EventArgDreamEdit : EventArgs
{

    private int dreamEditID;
    public EventArgDreamEdit()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int DreamEditID
    {
        get
        {
            return dreamEditID;
        }

        set
        {
            dreamEditID = value;
        }
    }

    private bool isChecked;
    public bool IsChecked
    {
        get
        {
            return isChecked;
        }
        set
        {
            isChecked = value;
        }
    }
}