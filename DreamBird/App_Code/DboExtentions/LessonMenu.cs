using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;

/// <summary>
/// Summary description for LessonMenu
/// </summary>
/// 

public partial class LessonMenu
{
    
    public float video_progress
    {
        //get {
        //    String user_id = HttpContext.Current.User.Identity.GetUserId();
        //    return LessonProgressUtil.GetProgress(this, user_id, "video");
        //}
        //set
        //{
        //    video_progress = value;
        //}
        get;
        set;
    }
    public float reading_progress
    {
        //get
        //{
        //    String user_id = HttpContext.Current.User.Identity.GetUserId();
        //    return LessonProgressUtil.GetProgress(this, user_id, "multimedia");
        //}
        //set {
        //    reading_progress = value;
        //}
        get;
        set;
    }
    public float quiz_grade
    {
        get;
        set;
    }
    public Boolean OverdueTask
    {
        
        get;
        set;
    }
    public Boolean completedTask
    {
        
        get;
        set;
    }
    


}