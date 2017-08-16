using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PackageSearch
/// </summary>
public class EventArgPackageSearch:EventArgs
{
    public EventArgPackageSearch()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public String packageSearchText
    {
        get;
        set;
    }
    public List<PackageDetail> packageList
    {
        get;
        set;
    }
}