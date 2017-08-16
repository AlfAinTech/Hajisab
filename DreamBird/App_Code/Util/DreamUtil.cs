using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DreamUtil
/// </summary>
public class DreamUtil
{
    public DreamUtil()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static ISearch SearchInterface;
    public static ISubmit SubmitQuestion;
    public static ILessonMenuMarkup Markup;
    public static string DreamSearch;
    public static List<PackageDetail> PackageList;
    public static string ServerUrl = "http://localhost:64671";//"http://s19390994.onlinehome-server.com/";
    public static String getDreamNameFromURL(String rawURL)
    {
        String[] parts = rawURL.Split('/');
        if (parts.Length > 2)
        {
            return parts[2];
        }
        return "";

    }
    public static String getDreamNameFromControlName(String controlName)
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

    public static string directive = "<%@ Register src='Components/Core/BaseDreamControl.ascx' tagname='BaseDreamControl' tagprefix='uc2' %>";

    public static List<LessonMenu> GetOverDue_ToDoList(int dream_id, string user_id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        List<LessonMenu> overDueTask_menus;
        DreamEnrollment enrollment = db.DreamEnrollments.Where(q => q.dreamID == dream_id && q.AspNetUserID == user_id).First();
        int timespan = getDifference(enrollment.enroll_Date);
        List<int> ids = db.LessonMenuAvailabilities.Where(q => q.LessonMenu.DreamLayout1.Dream.id == dream_id && ((q.DeadLine < System.DateTime.Now) || (q.TimeLimit < timespan))).Select(q => q.LessonMenu.id).ToList();
        overDueTask_menus = db.LessonMenus.Where(q => ids.Contains(q.id)).ToList();
        for (int i = 0; i < overDueTask_menus.Count; i++)
        {

            LessonMenu Container = overDueTask_menus[0];
            Container.video_progress = LessonProgressUtil.GetProgress(Container, user_id, "video");
            Container.reading_progress = LessonProgressUtil.GetProgress(Container, user_id, "multimedia");
            Container.quiz_grade = LessonProgressUtil.GetProgress(Container, user_id, "quiz");
            Container.completedTask = LessonProgressUtil.getCompletedStatus(Container);
            if (Container.completedTask)
            {

                overDueTask_menus.Remove(Container);
            }
            //Boolean nodata = ((Container.video_progress >= 0 && Container.video_progress < 100) || (Container.quiz_grade < 100 && Container.quiz_grade >= 0) || (Container.reading_progress < 100 && Container.reading_progress >= 0));

        }


        return overDueTask_menus;
    }
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