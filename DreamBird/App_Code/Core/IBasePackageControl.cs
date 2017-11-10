using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for IBasePackageControl
/// </summary>
public interface IBasePackageControl
{
    string getBasePackageClientID();
    string getBasePackageServerID();
    string GetDefaultPackageControlName();
    Control getDefaultControl();

}