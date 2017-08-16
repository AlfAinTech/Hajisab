using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBVirtualFile
/// </summary>
public class DBVirtualFile : System.Web.Hosting.VirtualFile

{

    private byte[] viewContent;

    public DBVirtualFile(string viewName, byte[] viewContent) : base(viewName)
    {
        this.viewContent = viewContent;
    }

    public override Stream Open()
    {
        return new MemoryStream(viewContent);
    }
}