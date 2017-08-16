using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for IBaseDreamControl
/// </summary>
public interface IBaseDreamControl
{
    string getBaseDreamClientID();
    string getBaseDreamServerID();
    string GetDefaultDreamControlName();
    Control getDefaultControl();

}