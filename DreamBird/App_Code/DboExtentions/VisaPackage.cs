using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for VisaPackage
/// </summary>
public partial class VisaPackage
{
    
    public String issueDateText
    {
        get
        {
            DateTime d = (DateTime)this.issueDate;
          return d.ToString("yyyy-MM-dd");// dup.DateOfBirth.ToShortDateString();
        
           
        }

        set
        {
            issueDateText = value;
        }
    }
    public String expireDateText
    {
        get
        {
            DateTime d = (DateTime)this.expireDate;
            return d.ToString("yyyy-MM-dd");// dup.DateOfBirth.ToShortDateString();


        }

        set
        {
            expireDateText = value;
        }
    }
    
}