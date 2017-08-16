using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Hotel
/// </summary>
public partial class Hotel
{
    
    public int getServiceCount
    {
        set { }
        get
        {
            if(HotelFacilities != null) { return HotelFacilities.Count();}
            else { return 0; }
            
        }
    }
}