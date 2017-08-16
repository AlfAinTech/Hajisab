using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Tags_TagControl : System.Web.UI.UserControl
{
    public void setReadonlyTag(Boolean b)
    {
        texttag.Enabled = b;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadScripts();
        }
    }
    public List<string> GetTags()
    {
        string text = texttag.Text;
        List<string> newstring = JsonConvert.DeserializeObject<List<string>>(text);
        return newstring;
    }
    public void SetTags(List<string> list)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<script>");
        sb.Append("if(typeof(dataArray)  === 'undefined'){");
        sb.Append("var dataArray = new Array;}");
        sb.Append("dataArray.length = 0;");
        //sb.Append("var dataArray = new Array;");
        foreach (string str in list)
        {
            sb.Append("dataArray.push('" + str + "');");
        }
        sb.Append("</script>");
        //LoadScripts();
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "tag_key", "LoadTagScripts();", true);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "DataArrayScript", sb.ToString(), false);
        string clientid = texttag.ClientID;
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "settagsscript", "SetTags('"+clientid+"');", true);
    }

    public void DisableTags()
    {
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "tag_key", "LoadTagScripts();", true);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "tag_diable", "DisableTags();", true);
    }
    public void LoadScripts()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        List<string> tempString = new List<string>();
        var list = db.Tags.ToList();
        foreach (var lst in list)
        {
            tempString.Add(lst.Name);
        }

        StringBuilder sb = new StringBuilder();
        sb.Append("<script>");
        sb.Append("if(typeof(testArray)  === 'undefined'){");
        sb.Append("var testArray = new Array;}");
        foreach (string str in tempString)
        {
            sb.Append("testArray.push('" + str + "');");
        }
        sb.Append("</script>");

        sb.Append("<script>");
        sb.Append("var dataArray = new Array;");
        sb.Append("</script>");


        // Injecting the array into the page for binding
        Page.ClientScript.RegisterStartupScript(this.GetType(), "TestArrayScript", sb.ToString());
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "tag_key", "LoadTagScripts();", true);
    }
}