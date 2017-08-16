using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DreamEnrollment
/// </summary>
public partial class DreamEnrollment
{
    public float TotalDreamProgress
{
        get
        {
            return LessonProgressUtil.CalculateDreamProgress(this.Dream);
        }
    set
        {
            TotalDreamProgress= LessonProgressUtil.CalculateDreamProgress(this.Dream);
        }
}
}