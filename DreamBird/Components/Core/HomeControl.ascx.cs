using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Linq;
using System.Linq.Dynamic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

public partial class Components_Core_HomeControl : System.Web.UI.UserControl, IHomeControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void SetControls(Control layoutControl, string PageSize)
    {
        List<IBaseDreamControl> lst = new List<IBaseDreamControl>();
        foreach (Control control in layoutControl.Controls)
        {
            Type type = control.GetType();
            if (type.Name == "components_core_basedreamcontrol_ascx")
            {
                IBaseDreamControl Control = control as IBaseDreamControl;
                lst.Add(Control);
            }
        }
        string URL = Request.RawUrl;
        string DreamName = DreamUtil.getDreamNameFromURL(URL);
        string PageName = DreamUtil.getPageNameFromURL(URL);
        List<int> SeperatorIndex = new List<int>();
        lst.Where(w => w.GetDefaultDreamControlName() == "~/Components/Seperator.ascx").ToList().ForEach(s => SeperatorIndex.Add(lst.IndexOf(s)));
        if (SeperatorIndex.Count == 0 || PageSize == "FullPage")
        {
            if (HomePlace != null)
            {
                HomePlace.Controls.Add(layoutControl);
            }
        }
        else
        {
            AdditionalControls.Visible = true;
            int CurrentPage = Convert.ToInt32(PageSize);
            int TotalPages = SeperatorIndex.Count + 1;
            
            List<string> ArrayList = new List<string>();
            for (int i = 0; i < TotalPages; i++)
            {
                ArrayList.Add("../../dreamhome/" + DreamName + "/" + PageName + "?PageNumber=" + (i + 1));
            }
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script_add_array", "var MyArray = " + new JavaScriptSerializer().Serialize(ArrayList) + ";", true);
            if (!(CurrentPage > TotalPages))
            {
                if (CurrentPage == 1)
                {
                    int seperator = SeperatorIndex[0];
                    for (int i = seperator; i < lst.Count; i++)
                    {
                        var IllFatedControl = lst[i] as Control;
                        layoutControl.Controls.Remove(IllFatedControl);
                    }
                }
                else
                {
                    int seperator = SeperatorIndex[CurrentPage - 2];
                    for (int i = 0; i <= seperator; i++)
                    {
                        var IllFatedControl = lst[i] as Control;
                        layoutControl.Controls.Remove(IllFatedControl);
                    }
                    if (!(CurrentPage == TotalPages))
                    {
                        int SecondSeperator = SeperatorIndex[CurrentPage - 1];
                        for (int i = SecondSeperator; i < lst.Count; i++)
                        {
                            var IllFatedControl = lst[i] as Control;
                            layoutControl.Controls.Remove(IllFatedControl);
                        }
                    }
                }
            }
            //layoutControl.Controls.Remove(lst.Where("DefaultControl == ").First());
            if (HomePlace != null)
            {
                HomePlace.Controls.Add(layoutControl);
            }
        }
        DreamBirdEntities db = new DreamBirdEntities();
        var page = db.DreamLayouts.Where(w => w.Page == PageName && w.Dream.DreamName == DreamName).First();
        if(Convert.ToBoolean(page.IsActive))
        {
            Content_area.Attributes.Add("class", "Mask");
        }
        

    }

}