using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgPackageClicked
/// </summary>
public class EventArgPackageClicked:EventArgs
{
    public EventArgPackageClicked()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int PackageID
    {
        get;
        set;
    }
}