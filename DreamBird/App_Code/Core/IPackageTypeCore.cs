using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PackageTypeCore
/// </summary>
public interface IPackageTypeCore
{
    event EventHandler SaveClicked;
    void BindData(int id);
}