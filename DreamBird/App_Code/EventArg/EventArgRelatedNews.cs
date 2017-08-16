using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgRelatedNews
/// </summary>
public class EventArgRelatedNews : EventArgs
{
    public EventArgRelatedNews()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private List<int> RelatedNewsIDs;
    public List<int> RelatedNewsId
    {
        set
        {
            RelatedNewsIDs = value;
        }
        get
        {
            return RelatedNewsIDs;
        }
    }
}