using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Package
/// </summary>
public partial class Package
{
    public PackageDetail PackageDetail
    {
        get
        {
            PackageDetail pd = new PackageDetail();
            DreamBirdEntities db = new DreamBirdEntities();
            var data =db.PackageDetails.Where(q => q.dreamID == this.id).ToList();
            if(data.Count()!=0)
            {
                 pd= data[0];
            }
            return pd;
        }
        set { PackageDetail = value; }
    }
    public Boolean IsDetailavailable
    {
        get
        {
            Boolean result = false;
            DreamBirdEntities db = new DreamBirdEntities();
            var data = db.PackageDetails.Where(q => q.dreamID == this.id).ToList();
            if (data.Count() != 0)
            {
                result = true;
            }
            return result;
        }
        set { IsDetailavailable = value; }
    }
}