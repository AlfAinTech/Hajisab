using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgRelatedNews
/// </summary>
public class EventArgQuestionTypes : EventArgs
{
    public EventArgQuestionTypes()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private List<int> questionTypeIDs;
    public List<int> QuestionTypeIDs
    {
        set
        {
            questionTypeIDs = value;
        }
        get
        {
            return questionTypeIDs;
        }
    }
}