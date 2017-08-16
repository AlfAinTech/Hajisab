using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EventArgTextBankClik
/// </summary>
public class EventArgTextBankClik: EventArgs
{
   public int TextBankID
    {
        get;
        set;
    }
    public EventArgTextBankClik()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}