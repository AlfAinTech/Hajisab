using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ILessonMenuMarkup
/// </summary>
public interface ILessonMenuMarkup
{

    event EventHandler MenuClicked;
    event EventHandler MenuEdited;
    void bindMenu(int parentMenuID, int ParentLayoutID);
}