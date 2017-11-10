using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgPackageEdit
/// </summary>
public class EventArgPackageEdit : EventArgs
{

    private int packageEditID;
    public EventArgPackageEdit()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int PackageEditID
    {
        get
        {
            return packageEditID;
        }

        set
        {
            packageEditID = value;
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