using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ICoreDreamControl
/// </summary>
public interface ICoreDreamControl
{

    void BindData();
    void OnShowAdminEvent(object sender, EventArgs e);
    void OnHideAdminEvent(object sender, EventArgs e);
    void SetBaseDreamControl(IBaseDreamControl baseDreamControl);
    
}