using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PackageSearch
/// </summary>
public class EventArgPackageSearch:EventArgs
{
    private String searchPackageName;
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
    public String SearchPackageName
    {
        get
        {
            return searchPackageName;
        }

        set
        {
            searchPackageName = value;
        }
    }

    private List<string> tags = new List<string>();
    public List<string> Tags
    {
        get
        {
            return tags;
        }
        set
        {
            tags = value;
        }
    }
}