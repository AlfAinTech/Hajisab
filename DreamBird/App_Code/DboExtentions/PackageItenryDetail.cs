using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PackageDetail
/// </summary>
public partial class PackageItenryDetail
{
    public string getDateLimit
    {
        get {
            DreamBirdEntities db = new DreamBirdEntities();
           int spendNights = db.PackageItenryDetails.Where(p => p.alharmainUserID == this.alharmainUserID && p.id<this.id).OrderBy(q => q.id).Select(q => q.nights).DefaultIfEmpty(0).Sum();
            DateTime start = (PackageDetail.startDate.Value.AddDays(spendNights));
            DateTime EndDate = start.AddDays(nights-1);
            if(start.Month == EndDate.Month)
                return start.Day.ToString() + "-" + EndDate.Day.ToString() + " " + start.ToString("MMMM",CultureInfo.InvariantCulture);
            else
                return start.Day.ToString() + "-" + EndDate.Day.ToString() + " " + start.ToString("MMMM", CultureInfo.InvariantCulture)+", "+EndDate.ToString("MMMM", CultureInfo.InvariantCulture);
        }
        set { }
    }
}