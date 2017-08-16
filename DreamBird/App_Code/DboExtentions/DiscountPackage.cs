using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DiscountPackage
/// </summary>
public partial class DiscountPackage
{
    public String availableFromText
    {
        get
        {
            DateTime d = (DateTime)this.availableFrom;
            return d.ToString("yyyy-MM-dd");// dup.DateOfBirth.ToShortDateString();


        }

        set
        {
            availableFromText = value;
        }
    }
    public String availableTillText
    {
        get
        {
            DateTime d = (DateTime)this.availableTill;
            return d.ToString("yyyy-MM-dd");// dup.DateOfBirth.ToShortDateString();


        }

        set
        {
            availableTillText = value;
        }
    }
}