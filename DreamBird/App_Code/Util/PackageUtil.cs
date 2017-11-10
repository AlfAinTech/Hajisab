using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PackageUtil
/// </summary>
public class PackageUtil
{
    public PackageUtil()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static ISearch SearchInterface;
    public static ISubmit SubmitQuestion;
    //public static ILessonMenuMarkup Markup;
    public static string PackageSearch;
    public static List<PackageDetail> PackageList;
    public static string ServerUrl = "http://localhost:64671";//"http://s19390994.onlinehome-server.com/";
    public static String getPackageNameFromURL(String rawURL)
    {
        String[] parts = rawURL.Split('/');
        if (parts.Length > 2)
        {
            return parts[2];
        }
        return "";

    }
    public static String getPackageNameFromControlName(String controlName)
    {
        String[] parts = controlName.Split('_');
        return parts[1];

    }

    public static String getPageNameFromControlName(String controlName)
    {
        String[] parts = controlName.Split('_');
        return parts[2];

    }

    public static string getPageNumberFromControlName(string controlName)
    {
        string[] parts = controlName.Split('_');
        if(parts.Count() > 3)
        {
            return parts[3];
        }
        else
        {
            return "FullPage";
        }
        
    }

    public static String getPageNameFromURL(String rawURL)
    {
        String[] parts = rawURL.Split('/');
        if (parts.Length > 3)
        {
            if (parts[3].Contains('?'))
            {
                string[] subPart = parts[3].Split('?');
                return subPart[0];
            }
            return parts[3];

        }
        return "";
    }

    public static string getCleanPageWithoutQueryString(string rawURL)
    {
        string[] parts = rawURL.Split('?');
        return parts[0];
    }

    public static Boolean isContainDreamPage(String rawURL)
    {
        //add more specific logic to identify the dream
        String[] parts = rawURL.Split('/');
        return parts.Length == 4;
    }

    public static string directive = "<%@ Register src='Components/Core/BasePackageControl.ascx' tagname='BasePackageControl' tagprefix='uc2' %>";


    public static int getDifference(DateTime d)
    {
        return (int)(System.DateTime.Now - d).TotalDays;
    }



}

public class MediaItemMarkup
{
    public int MediaItemID;
    public string MediaPath;
    public string MediaType;
    public string EmbedCode;
    public string MediumType;
    public MediaItemMarkup(int id, string Path, string Type, string Code = "", string Medium = "")
    {
        MediaItemID = id;
        MediaPath = Path;
        MediaType = Type;
        EmbedCode = Code;
        MediumType = Medium;
    }
}

public class MediaItemSingle
{
    public int MediaItemID;
    public string Name;
    public string Path;
    public string Type;
    public string DateAdded;
    public string Resolution;
    public string Size;
    public int CategoryID;
    public string MediumType;
    public string EmbedCode;
}

public class Transcript
{
    public int Id;
    public string TranscriptText;
    public decimal TimeStamp;
}

public class TotalMediaItems
{
    public int TotalItems;
    public List<MediaItemMarkup> Items;
}