using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DreamTypeCore
/// </summary>
public interface IDreamTypeCore
{
    event EventHandler SaveClicked;
    void BindData(int id);
}