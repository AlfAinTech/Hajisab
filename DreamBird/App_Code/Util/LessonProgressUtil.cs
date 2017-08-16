using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;

/// <summary>
/// Summary description for LessonProgressUtil
/// </summary>
public class LessonProgressUtil
{
    public LessonProgressUtil()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    

    public static Boolean CalculateOverdueTask(LessonMenu Container)
    {
        Boolean result = false;
        DreamBirdEntities db = new DreamBirdEntities();
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            string user_id = HttpContext.Current.User.Identity.GetUserId();
            var enrollment = db.DreamEnrollments.Where(q => q.AspNetUserID == user_id && q.dreamID == Container.DreamLayout1.DreamID).ToList();
            if (enrollment.Count() != 0)
            {
                DreamEnrollment de = enrollment[0];
                if (Container.IsContainer)
                {
                    {
                        var data = db.LessonMenuAvailabilities.Where(q => q.MenuID == Container.id).ToList();
                        if (data.Count() != 0)
                        {
                            LessonMenuAvailability lma = data[0];
                        }
                    }

                }
            }
        }
        return result;

    }
    public static float CalculateDreamProgress(Dream dream)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var data = db.UserLessonProgresses.Where(q => q.LessonMenu.DreamLayout1.DreamID == dream.id).ToList();
        var lesson = db.LessonMenus.Where(q => q.DreamLayout1.DreamID == dream.id && q.menuType != "none" && q.LessonMenuAvailabilities.Where(s => s.AvailableFrom > System.DateTime.Now).Count() == 0).ToList();
        float total_lessons = lesson.Count();
        float result = 0;
        if (lesson.Count() !=0)
        {
            result =(int)  Math.Round((data.Count() / total_lessons)*100);
        }
        
        return result;

    }
    public static int GetProgress(LessonMenu menu, String user_id, string type)
    {
        decimal cumulative_progress = 0;
        decimal total_progress = 0;
        DreamBirdEntities db = new DreamBirdEntities();
        List<LessonMenu> lessons = db.LessonMenus.Where(q => q.parentMenu_id == menu.id).ToList();


        foreach (LessonMenu lesson in lessons)
        {
            if (lesson.IsContainer)
            {
                cumulative_progress += GetProgress(lesson, user_id, type);
                total_progress += 100;

            }
            if (lesson.menuType == type)
            {
                total_progress += 100;
                var userLessonProgree = db.UserLessonProgresses.Where(q => q.AspNetUser_id == user_id && q.menu_id == lesson.id).ToList();
                if (userLessonProgree.Count != 0)
                {
                    UserLessonProgress ulp = userLessonProgree[0];
                    cumulative_progress = cumulative_progress + ulp.progress;
                }
            }
        }

        decimal result = 0;
        if (total_progress != 0)
        { result = (cumulative_progress / total_progress) * 100; }
        else { result = -1; }
        return (int)Math.Round(result);
    }
    public static Boolean getCompletedStatus(LessonMenu container)
    {
        return ((container.video_progress < 0 || container.video_progress == 100) && (container.quiz_grade == 100 || container.quiz_grade < 0) && (container.reading_progress == 100 || container.reading_progress < 0));
    }

}