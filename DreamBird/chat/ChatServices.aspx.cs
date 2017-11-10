using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chat_ChatServices : System.Web.UI.Page
{
    public static List<BotConversation> bot = new List<BotConversation>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            PackageEntities db = new PackageEntities();
            bot = db.BotConversations.OrderBy(q=>q.id).ToList();
        }
    }
    [WebMethod(EnableSession =true)]
    public static string BotChatGet(string userMessage,string SessionID)
    {
        var jsonObj = new { };
        dynamic dd = new ExpandoObject();
        PackageEntities db = new PackageEntities();
        //get user state
        int index = 1;
        if (HttpContext.Current.Session["State"] != null)
        {
           index = int.Parse(HttpContext.Current.Session["State"].ToString());

        }else { HttpContext.Current.Session["State"] = index; }

        //set conversation
        if (bot.Count() == 0) { bot = db.BotConversations.ToList(); } 
        BotConversation bt = bot.Where(q=>q.id == index).First();

        //execute Response Fuunction
        if(bt.functionName != null  && bt.functionName != "")
        { 
            Page page = (Page)HttpContext.Current.Handler;
            Type type = typeof(chat_ChatServices);
               object instance = Activator.CreateInstance(type);
                MethodInfo theMethod = type.GetMethod(bt.functionName);
            object[] parametersArray = new object[] { userMessage };
      string context =  (string)theMethod.Invoke(instance, parametersArray);
            dd.context = context;
        }

        //user state after Response Function
        if (HttpContext.Current.Session["State"] != null)
        {
            index = int.Parse(HttpContext.Current.Session["State"].ToString());
            HttpContext.Current.Session["State"] = int.Parse(HttpContext.Current.Session["State"].ToString()) + 1;
           
        }

       
        //send Response
        bt = bot.Where(q => q.id == index).First();

        //set user Questions
        if (bt.question != null && bt.question != "")
        {
            Page page = (Page)HttpContext.Current.Handler;
            Type type = typeof(chat_ChatServices);
            object instance = Activator.CreateInstance(type);
            MethodInfo theMethod = type.GetMethod(bt.question);
            string questions = (string)theMethod.Invoke(instance, null);
            dd.quickReplies = questions;
        }

        var serializer = new JavaScriptSerializer();
        dd.msg = bt.answer;
        bot[bot.IndexOf(bot.Single(i => i.id == index))].answer = db.BotConversations.Where(q=>q.id == index).First().answer;
        string myresult =  serializer.Serialize(dd);
        String result = JsonConvert.SerializeObject(dd);
        if (index == 12 || index == 13) { HttpContext.Current.Session.Clear(); }
        return result;
       
    }
    public static string getResponse(string msg)
    {
        dynamic jdata = new { };
        if (msg == "no") { HttpContext.Current.Session["State"] = 13; }
        
        PackageEntities db = new PackageEntities();
        var context = string.Join(",", db.PackageDetails.Select(q => q.id).ToList());
        return context.ToString();
    }


    public static string getMonths(string month)
    {
        dynamic strMonth_Month = new { jan = 1, feb = 2, mar = 3, apr = 4, may = 5, jun = 6, jul = 7, aug = 8, sep = 9, oct = 10, nov = 11, dec = 12 };

        var nameOfProperty = month;
        var propertyInfo = strMonth_Month.GetType().GetProperty(nameOfProperty);
        var value = propertyInfo.GetValue(strMonth_Month, null);
        int val = Convert.ToInt32(value);
        dynamic jdata =new { };
        PackageEntities db = new PackageEntities();
       List<PackageDetail> packages =  db.PackageDetails.Where(q => q.startDate.Value.Month == val).ToList();
        HttpContext.Current.Session["month"] = val;
        if (packages.Count() != 0)
        {
            int index = int.Parse(HttpContext.Current.Session["State"].ToString());
            
            double min = packages.Select(q => q.minRange).Min();
            double max = packages.Select(q => q.maxRange).Max();
            string answer = bot.Where(q=>q.id == index).First().answer;
            answer = answer.Replace("pkgs", packages.Count().ToString());
            answer=answer.Replace("get_month", month.ToString());
            answer=answer.Replace("minRange", min.ToString());
            answer=answer.Replace("maxRange", max.ToString());
            bot[bot.IndexOf(bot.Single(i => i.id == index))].answer = answer;
        }
        else
        {
            HttpContext.Current.Session["State"] = 11;
        }
        var context = string.Join(",", packages.Select(q=>q.id).ToList());
        return context.ToString();
    }

    public static string getBudget(string budget)
    {
        double price = double.Parse(budget);
        dynamic jdata = new { };
        PackageEntities db = new PackageEntities();
        if(HttpContext.Current.Session["month"] != null) {
            int month = int.Parse(HttpContext.Current.Session["month"].ToString());
        List<PackageDetail> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month && q.minRange <= price).ToList();
        
        if (packages.Count() != 0)
        {
                HttpContext.Current.Session["get_budget"] = price;
            int index = int.Parse(HttpContext.Current.Session["State"].ToString());
            string answer = bot.Where(q => q.id == index).First().answer;
            answer = answer.Replace("budget_pkg", packages.Select(q=>q.nightsInMadina+q.nightsInMakkah).Distinct().Count().ToString());
            bot[bot.IndexOf(bot.Single(i => i.id == index))].answer = answer;
        }
        else
        {
            HttpContext.Current.Session["State"] = 11;
        }
        var context = string.Join(",", packages.Select(q=>q.id).ToList());
        return context.ToString();
    }
        return "";
    }
    public static string getNights(string nights)
    {
        int night = int.Parse(nights);
        dynamic jdata = new { };
        PackageEntities db = new PackageEntities();
        if (HttpContext.Current.Session["month"] != null && HttpContext.Current.Session["get_budget"] != null)
        {
            int month = int.Parse(HttpContext.Current.Session["month"].ToString());
            double price = double.Parse(HttpContext.Current.Session["get_budget"].ToString());
            List<PackageDetail> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month && q.minRange <= price && (q.nightsInMadina+q.nightsInMakkah) == night).ToList();

            if (packages.Count() != 0)
            {
                HttpContext.Current.Session["get_nights"] = night;
                int index = int.Parse(HttpContext.Current.Session["State"].ToString());
                string answer = bot.Where(q => q.id == index).First().answer;
                answer = answer.Replace("pkgs", packages.Count().ToString());
                bot[bot.IndexOf(bot.Single(i => i.id == index))].answer = answer;
            }
            else
            {
                HttpContext.Current.Session["State"] = 11;
            }
            var context = string.Join(",", packages.Select(q => q.id).ToList());
            return context.ToString();
        }
        return "";
    }
    public static string getRatings(string rating)
    {
        dynamic ratingData = new { economy=1,budget=2,three_star=3 , four_star=4,five_star=5};

        var nameOfProperty = rating;
        var propertyInfo = ratingData.GetType().GetProperty(nameOfProperty);
        var value = propertyInfo.GetValue(ratingData, null);
        int val = Convert.ToInt32(value);
        int ratings = Convert.ToInt32(val);
        dynamic jdata = new { };
        PackageEntities db = new PackageEntities();
        if (HttpContext.Current.Session["month"] != null && HttpContext.Current.Session["get_budget"] != null && HttpContext.Current.Session["get_nights"] != null)
        {
            int month = int.Parse(HttpContext.Current.Session["month"].ToString());
            double price = double.Parse(HttpContext.Current.Session["get_budget"].ToString());
            int night = int.Parse(HttpContext.Current.Session["get_nights"].ToString());
            List<PackageDetail> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month && q.minRange <= price && q.nightsInMadina+q.nightsInMakkah == night && q.Hotel1.rating == ratings).ToList();

            if (packages.Count() != 0)
            {
                HttpContext.Current.Session["get_ratings"] = ratings;
                int index = int.Parse(HttpContext.Current.Session["State"].ToString());
                string answer = bot.Where(q => q.id == index).First().answer;
                answer = answer.Replace("get_night ",night.ToString());
                bot[bot.IndexOf(bot.Single(i => i.id == index))].answer = answer;
            }
            else
            {
                HttpContext.Current.Session["State"] = 11;
            }
            var context = string.Join(",", packages.Select(q => q.id).ToList());
            return context.ToString();
        }
        return "";
    }
    public static string clearSession(string msg)
    {
        if(msg == "satisfied") { HttpContext.Current.Session["State"] = 12; }
        else { HttpContext.Current.Session["State"] = 13; }
        
        return "";
    }
    public static string getRooms(string room)
    {
        
        dynamic jdata = new { };
        PackageEntities db = new PackageEntities();
        if (HttpContext.Current.Session["month"] != null && HttpContext.Current.Session["get_budget"] != null && HttpContext.Current.Session["get_nights"] != null && HttpContext.Current.Session["get_ratings"]!= null )
        {
            int month = int.Parse(HttpContext.Current.Session["month"].ToString());
            double price = double.Parse(HttpContext.Current.Session["get_budget"].ToString());
            int night = int.Parse(HttpContext.Current.Session["get_nights"].ToString());
            int ratings = int.Parse(HttpContext.Current.Session["get_ratings"].ToString());
            List<PackageDetail> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month && q.minRange <= price && (q.nightsInMadina + q.nightsInMakkah) == night && q.Hotel1.rating == ratings && q.Hotel1.Accommodations.Where(x=>x.Name == room && x.availability == true).Count() != 0).ToList();

            if (packages.Count() != 0)
            {
                HttpContext.Current.Session["get_rooms"] = room;
                int index = int.Parse(HttpContext.Current.Session["State"].ToString());
                string answer = bot.Where(q => q.id == index).First().answer;
                answer = answer.Replace("count_room ", packages.Count().ToString());
                bot[bot.IndexOf(bot.Single(i => i.id == index))].answer = answer;
            }
            else
            {
                HttpContext.Current.Session["State"] = 11;
            }
            var context = string.Join(",", packages.Select(q => q.id).ToList());
            return context.ToString();
        }
        return "";
    }
    public static string getVisa(string visa)
    {
        dynamic visaData = new {with=true,without=false };

        var nameOfProperty = visa;
        var propertyInfo = visaData.GetType().GetProperty(nameOfProperty);
        var value = propertyInfo.GetValue(visaData, null);
        Boolean visamsg = Convert.ToBoolean(value);
        dynamic jdata = new { };
        PackageEntities db = new PackageEntities();
        if (HttpContext.Current.Session["month"] != null && HttpContext.Current.Session["get_budget"] != null && HttpContext.Current.Session["get_nights"] != null && HttpContext.Current.Session["get_ratings"] != null && HttpContext.Current.Session["get_nights"] != null && HttpContext.Current.Session["get_rooms"] != null)
        {
            int month = int.Parse(HttpContext.Current.Session["month"].ToString());
            double price = double.Parse(HttpContext.Current.Session["get_budget"].ToString());
            int night = int.Parse(HttpContext.Current.Session["get_nights"].ToString());
            int ratings = int.Parse(HttpContext.Current.Session["get_ratings"].ToString());
            string room = HttpContext.Current.Session["get_rooms"].ToString();
            List<PackageDetail> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month && q.minRange <= price && (q.nightsInMadina + q.nightsInMakkah) == night && q.Hotel1.rating == ratings && q.Hotel1.Accommodations.Where(x => x.Name == room).Count() != 0 && q.isVisaAvailable == visamsg).ToList();

            if (packages.Count() != 0)
            {
                HttpContext.Current.Session["get_visa"] = visamsg;
                int index = int.Parse(HttpContext.Current.Session["State"].ToString());
                string answer = bot.Where(q => q.id == index).First().answer;
                answer = answer.Replace("visaMsg ", visa);
                answer = answer.Replace("get_night", night.ToString());
                bot[bot.IndexOf(bot.Single(i => i.id == index))].answer = answer;
            }
            else
            {
                HttpContext.Current.Session["State"] = 11;
            }
            var context = string.Join(",", packages.Select(q => q.id).ToList());
            return context.ToString();
        }
        return "";
    }
    public static string getAirLineChk(string airLinechk)
    {
        dynamic ticketData = new { ticket = true, no_ticket = false };

        var nameOfProperty = airLinechk;
        var propertyInfo = ticketData.GetType().GetProperty(nameOfProperty);
        var value = propertyInfo.GetValue(ticketData, null);
        Boolean ticketmsg = Convert.ToBoolean(value);
        dynamic jdata = new { };
        PackageEntities db = new PackageEntities();
        if (HttpContext.Current.Session["month"] != null && HttpContext.Current.Session["get_budget"] != null && HttpContext.Current.Session["get_nights"] != null && HttpContext.Current.Session["get_ratings"] != null && HttpContext.Current.Session["get_nights"] != null && HttpContext.Current.Session["get_rooms"] != null && HttpContext.Current.Session["get_visa"] != null)
        {
            int month = int.Parse(HttpContext.Current.Session["month"].ToString());
            double price = double.Parse(HttpContext.Current.Session["get_budget"].ToString());
            int night = int.Parse(HttpContext.Current.Session["get_nights"].ToString());
            int ratings = int.Parse(HttpContext.Current.Session["get_ratings"].ToString());
            string room = HttpContext.Current.Session["get_rooms"].ToString();
            Boolean visamsg = Convert.ToBoolean( HttpContext.Current.Session["get_visa"].ToString());
            List<PackageDetail> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month && q.minRange <= price && (q.nightsInMadina + q.nightsInMakkah) == night && q.Hotel.rating == ratings && q.Hotel1.Accommodations.Where(x => x.Name == room).Count() != 0 && q.isVisaAvailable == visamsg && q.isAirLineAvailable == ticketmsg).ToList();

            if (packages.Count() != 0 && ticketmsg == true)
            {
                HttpContext.Current.Session["get_airlineChk"] = ticketmsg;
                int index = int.Parse(HttpContext.Current.Session["State"].ToString());
                string answer = bot.Where(q => q.id == index).First().answer;
                bot[bot.IndexOf(bot.Single(i => i.id == index))].answer = answer;
            }
            else
            {
                HttpContext.Current.Session["State"] = 11; return "";
            }
            var context = string.Join(",", packages.Select(q => q.id).ToList());
            return context.ToString();
        }
        return "";
    }
    public static string getAirLine(string airLine)
    {
        
        dynamic jdata = new { };
        PackageEntities db = new PackageEntities();
        if (HttpContext.Current.Session["month"] != null && HttpContext.Current.Session["get_budget"] != null && HttpContext.Current.Session["get_nights"] != null && HttpContext.Current.Session["get_ratings"] != null && HttpContext.Current.Session["get_nights"] != null && HttpContext.Current.Session["get_rooms"] != null && HttpContext.Current.Session["get_visa"] != null && HttpContext.Current.Session["get_airlineChk"] != null)
        {
            int month = int.Parse(HttpContext.Current.Session["month"].ToString());
            double price = double.Parse(HttpContext.Current.Session["get_budget"].ToString());
            int night = int.Parse(HttpContext.Current.Session["get_nights"].ToString());
            int ratings = int.Parse(HttpContext.Current.Session["get_ratings"].ToString());
            string room = HttpContext.Current.Session["get_rooms"].ToString();
            Boolean visamsg = Convert.ToBoolean(HttpContext.Current.Session["get_visa"].ToString());
            Boolean ticketmsg = Convert.ToBoolean(HttpContext.Current.Session["get_airlineChk"].ToString());
            List<PackageDetail> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month && q.minRange <= price && (q.nightsInMadina + q.nightsInMakkah) == night && q.Hotel.rating == ratings && q.Hotel1.Accommodations.Where(x => x.Name == room).Count() != 0 && q.isVisaAvailable == visamsg && q.isAirLineAvailable == ticketmsg && q.Flight1.AirLine.Name == airLine).ToList();

            if (packages.Count() != 0)
            {
                HttpContext.Current.Session["get_airline"] = airLine;
                int index = int.Parse(HttpContext.Current.Session["State"].ToString());
                string answer = bot.Where(q => q.id == index).First().answer;
                bot[bot.IndexOf(bot.Single(i => i.id == index))].answer = answer;
            }
            else
            {
                HttpContext.Current.Session["State"] = 11; return "";
            }
            var context = string.Join(",", packages.Select(q => q.id).ToList());
            return context.ToString();
        }
        return "";
    }

    //quick replies functions
    public static string setResponse()
    {
        return "Yes,No";
    }
    public static string setMonth()
    {
        List<string> monthData = new List<string> { "", "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC" };
        PackageEntities db = new PackageEntities();
        List<int> packages = db.PackageDetails.Select(q => q.startDate.Value.Month).Distinct().ToList();
        List<string> data = new List<string>();
        foreach (int i in packages) { data.Add( monthData[i]); }
       return string.Join(",", data);
       
    }
    public static string setBudget()
    {
        PackageEntities db = new PackageEntities();
        int month = int.Parse(HttpContext.Current.Session["month"].ToString());
        List<PackageDetail> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month).ToList();
        double min = packages.Select(q => q.minRange).Min();
        double max = packages.Select(q => q.maxRange).Max();
        double avgone = packages.Select(q => q.minRange).Average();
        double avgtwo = packages.Select(q => q.maxRange).Average();
        return min+","+Math.Round(avgone)+","+Math.Round(avgtwo)+","+max ;
    }
    public static string setNight()
    {
        PackageEntities db = new PackageEntities();
        int month = int.Parse(HttpContext.Current.Session["month"].ToString());
        double budget = double.Parse(HttpContext.Current.Session["get_budget"].ToString());
        List<PackageDetail> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month && (q.minRange <= budget)).ToList();
        return string.Join(",", packages.Select(q => (q.nightsInMadina + q.nightsInMakkah)).Distinct().ToList());
    }
    public static string setRating()
    {
        List<string> ratingData = new List<string> { "", "economy", "budget", "Three_Star", "Four_Star", "Five_Star" };
        PackageEntities db = new PackageEntities();
        int month = int.Parse(HttpContext.Current.Session["month"].ToString());
        double budget = int.Parse(HttpContext.Current.Session["get_budget"].ToString());
        double nights = int.Parse(HttpContext.Current.Session["get_nights"].ToString());
        List<int> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month && (q.minRange <= budget) && (q.nightsInMakkah+q.nightsInMadina) == nights).Select(q=>q.Hotel1.rating).ToList();
        List<string> data = new List<string>();
        foreach (int i in packages) { data.Add(ratingData[i]); }
        return string.Join(",", data);
    }
    public static string setRoom()
    {
        PackageEntities db = new PackageEntities();
        int month = int.Parse(HttpContext.Current.Session["month"].ToString());
        double budget = double.Parse(HttpContext.Current.Session["get_budget"].ToString());
        double nights = int.Parse(HttpContext.Current.Session["get_nights"].ToString());
        int rating = int.Parse(HttpContext.Current.Session["get_ratings"].ToString());
        List<PackageDetail> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month && (q.minRange <= budget) && (q.nightsInMakkah + q.nightsInMadina) == nights && q.Hotel1.rating == rating).ToList();
        List<int> hotels = packages.Select(q => q.Hotel1.id).Distinct().ToList();
        return string.Join(",", db.Accommodations.Where(q => hotels.Contains(q.hotelID) && q.availability == true).Select(p=>p.Name).ToList());
    }
    public static string setVisa()
    {
        PackageEntities db = new PackageEntities();
        int month = int.Parse(HttpContext.Current.Session["month"].ToString());
        double budget = double.Parse(HttpContext.Current.Session["get_budget"].ToString());
        double nights = int.Parse(HttpContext.Current.Session["get_nights"].ToString());
        int rating = int.Parse(HttpContext.Current.Session["get_ratings"].ToString());
        string room = HttpContext.Current.Session["get_rooms"].ToString();
        List<Boolean> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month && (q.minRange <= budget) && (q.nightsInMakkah + q.nightsInMadina) == nights && q.Hotel1.rating == rating && q.Hotel1.Accommodations.Where(x => x.Name == room && x.availability == true).Count() != 0).Select(q => q.isVisaAvailable).Distinct().ToList();
        string result = string.Join(",", packages);
        result = result.Replace("True", "With");
        result = result.Replace("False", "Without");
        return result;
    }
    public static string setAirlineChk()
    {
        PackageEntities db = new PackageEntities();
        int month = int.Parse(HttpContext.Current.Session["month"].ToString());
        double budget = double.Parse(HttpContext.Current.Session["get_budget"].ToString());
        double nights = int.Parse(HttpContext.Current.Session["get_nights"].ToString());
        int rating = int.Parse(HttpContext.Current.Session["get_ratings"].ToString());
        string room = HttpContext.Current.Session["get_rooms"].ToString();
        bool visa = Convert.ToBoolean( HttpContext.Current.Session["get_visa"].ToString());
        List<PackageDetail> pkgs = db.PackageDetails.Where(q => q.startDate.Value.Month == month && (q.minRange <= budget) && (q.nightsInMakkah + q.nightsInMadina) == nights && q.Hotel1.rating == rating && q.Hotel1.Accommodations.Where(x => x.Name == room && x.availability == true).Count() != 0 && q.isVisaAvailable == visa).ToList();
        List<Boolean> packages = pkgs.Select(q => q.isAirLineAvailable ).Distinct().ToList();
        string result = string.Join(",", packages);
        result = result.Replace("True", "Ticket");
        result = result.Replace("False", "No_Ticket");
        return result;
    }
    public static string setAirline()
    {
        PackageEntities db = new PackageEntities();
        int month = int.Parse(HttpContext.Current.Session["month"].ToString());
        double budget = double.Parse(HttpContext.Current.Session["get_budget"].ToString());
        double nights = int.Parse(HttpContext.Current.Session["get_nights"].ToString());
        int rating = int.Parse(HttpContext.Current.Session["get_ratings"].ToString());
        string room = HttpContext.Current.Session["get_rooms"].ToString();
        bool visa = Convert.ToBoolean(HttpContext.Current.Session["get_visa"].ToString());
        bool airlineChk = Convert.ToBoolean(HttpContext.Current.Session["get_airlineChk"].ToString());
        List<string> packages = db.PackageDetails.Where(q => q.startDate.Value.Month == month && (q.minRange <= budget) && (q.nightsInMakkah + q.nightsInMadina) == nights && q.Hotel1.rating == rating && q.Hotel1.Accommodations.Where(x => x.Name == room && x.availability == true).Count() != 0 && q.isVisaAvailable == visa && q.isAirLineAvailable == airlineChk).Select(q => q.Flight1.AirLine.Name).Distinct().ToList();
        string result = string.Join(",", packages);
        return result;
    }
    public static string setfeedBack()
    {
        return "Satisfied,Not Satisfied";
    }
}