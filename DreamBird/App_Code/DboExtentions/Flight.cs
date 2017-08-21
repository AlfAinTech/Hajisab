using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Flight
/// </summary>
public partial class Flight
{
    
    public bool IsOneWay
    {
        get
        {
            DreamBirdEntities db;
            db = new DreamBirdEntities();
            
            if (this.flightType == 1)
            {
                return true;
            }
            return false;

        }

        set
        {
            IsOneWay = value;
        }
    }
    public bool IsRoundTrip
    {
        get
        {
            DreamBirdEntities db;
            db = new DreamBirdEntities();

            if (this.flightType == 2)
            {
                return true;
            }
            return false;

        }

        set
        {
            IsRoundTrip = value;
        }
    }
    public string getDepartureDate
    {
        set
        {
            getDepartureDate = value;
        }
        get
        {
            return departureDate.ToShortDateString().ToString();
        }
    }
}