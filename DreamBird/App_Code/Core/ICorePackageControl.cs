using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ICorePackageControl
/// </summary>
public interface ICorePackageControl
{

    void BindData();
    void OnShowAdminEvent(object sender, EventArgs e);
    void OnHideAdminEvent(object sender, EventArgs e);
    void SetBasePackageControl(IBasePackageControl BasePackageControl);
    
}