using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PackageDetail
/// </summary>
public partial class PackageDetail
{
    public string GetDetails()
    {
        return "abc";
    }
    public String isAirLineText
    {
        get
        {
            string result = "";
            if (this.isAirLineAvailable)
            {
                result = " + AirLine";
            }
            return result;
        }
        set { isAirLineText = value; }
    }
    public String isVisaText
    {
        get
        {
            string result = "";
            if (this.isVisaAvailable)
            {
                result = " + Visa";
            }
            return result;
        }
        set { isVisaText = value; }
    }
    public int getVisaID
    {
        set { }
        get
        {
            int result = 0;
            if (this.visaID != null)
            {
                result = this.visaID.Value;
            }
            return result;
        }
    }
    public String getVisaTitle
    {
        set { }
        get
        {
            String result = "";
            if (VisaPackage != null)
            {
                result = this.VisaPackage.visaTitle;
            }
            return result;
        }
    }
    public String getDepCity
    {
        set { }
        get
        {
            String result = "";
            if (this.isAirLineAvailable)
            {
                result = this.Flight1.fromCity;
            }
            return result;
        }
    }
    public int getVisaMonth
    {
        set { }
        get
        {
            int result = 0;
            if (VisaPackage != null)
            {
                result = this.VisaPackage.issueDate.Month;
            }
            return result;
        }
    }
    public int getStartMonth
    {
        set { }
        get
        {
            int result = 0;
            if (this.startDate != null)
            {
                result = this.startDate.Value.Month;
            }
            return result;
        }
    }
    public int duration
    {
        set { }
        get
        {
            return this.nightsInMadina + this.nightsInMakkah;
        }
    }
    public double minAmount
    {
        set { }
        get
        {
            double result = 0;
            if (this.isAirLineAvailable) { if (this.returnFlight) { result += this.Flight1.price; } else { result += this.Flight1.price + this.Flight.price; } }
            if (isVisaAvailable && VisaPackage != null) { result += VisaPackage.amount; }
            if (Hotel != null || Hotel1 != null)
            {
                if (Hotel.Accommodations != null) { result += Hotel.Accommodations.Select(q => q.price).DefaultIfEmpty(0).Min() * nightsInMadina; }
                if (Hotel1.Accommodations != null) { result += Hotel1.Accommodations.Select(q => q.price).DefaultIfEmpty(0).Min() * nightsInMakkah; }
            }
            result += additionalExpense;
            return result;
        }
    }
    public double maxAmount
    {
        set { }
        get
        {
            double result = 0;
            if (this.isAirLineAvailable) { if (this.returnFlight) { result += this.Flight1.price; } else { result += this.Flight1.price + this.Flight.price; } }
            if (isVisaAvailable && VisaPackage != null) { result += VisaPackage.amount; }
            if (Hotel != null || Hotel1 != null)
            {
                if (Hotel.Accommodations != null) { result += Hotel.Accommodations.Select(q => q.price).DefaultIfEmpty(0).Max() * nightsInMadina; }
                if (Hotel1.Accommodations != null) { result += Hotel1.Accommodations.Select(q => q.price).DefaultIfEmpty(0).Max() * nightsInMakkah; }
            }
            result += additionalExpense;
            return result;
        }
    }

    public double getPriceWithout_accommodation
    {
        set { }
        get
        {
            double result = 0;
            if (this.isAirLineAvailable) { if (this.returnFlight) { result += this.Flight1.price; } else { result += this.Flight1.price + this.Flight.price; } }
            if (isVisaAvailable && VisaPackage != null) { result += VisaPackage.amount; }
            result += additionalExpense;
            return result;
        }
    }

    public string getMonth
    {
        set { }
        get
        {
            DreamBirdEntities db = new DreamBirdEntities();
            DateTime dt = this.startDate.Value;
            string month = dt.ToString("MMM", CultureInfo.InvariantCulture).ToLower();
            return month;
        }
    }
    public string getairLine
    {
        set { }
        get
        {
            DreamBirdEntities db = new DreamBirdEntities();
            if (this.isAirLineAvailable)
            {
                return this.Flight1.AirLine.Name;
            }
            else { return "None"; }
        }
    }
    public int getTotelNights
    {
        set { }
        get
        {
            return nightsInMadina + nightsInMakkah;
        }
    }
    public Boolean IsDiscount
    {
        set { }
        get
        {
            DreamBirdEntities db = new DreamBirdEntities();
            DateTime today = System.DateTime.Today;
            List<DiscountPackage> discounts = db.DiscountPackages.Where(q => q.packageDetailID == this.id && (q.availableFrom <= today && q.availableTill >= today)).OrderByDescending(q => q.discountPercent).ToList();
            if (discounts.Count() != 0)
            {
                return true;

            }
            else { return false; }
        }




    }
    public double getDiscountValue
    {
        set { }
        get
        {
            DreamBirdEntities db = new DreamBirdEntities();
            DateTime today = System.DateTime.Today;
            List<DiscountPackage> discounts = db.DiscountPackages.Where(q => q.packageDetailID == this.id && (q.availableFrom <= today && q.availableTill >= today)).OrderByDescending(q => q.discountPercent).ToList();
            if (discounts.Count() != 0)
            {
                DiscountPackage dp = discounts[0];
                return dp.discountPercent;
            }
            else { return 0; }
        }
    }
}