using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ConversationObj
/// </summary>
public class ConversationObj
{
    public List<string> questions { get; set; }
    public string answer { get; set; }
    public string FunctionName { get; set; }
    public ConversationObj()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}