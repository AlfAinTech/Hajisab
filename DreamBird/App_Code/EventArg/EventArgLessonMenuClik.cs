using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgLessonMenuClik
/// </summary>
public class EventArgLessonMenuClik: EventArgs
{
    public int LessonMenuID
    {
        get;
        set;
    }
    public EventArgLessonMenuClik()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}