using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_DragDropFramework_DD : DreamHomeCore
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public class Layouts
    {
        public int id { set; get; }
        public string Name { set; get; }
        public string Header { set; get; }
        public string Footer { set; get; }
        public string ContentRatio { set; get; }
    }

    //protected void Button6_Click(object sender, EventArgs e)
    //{
    //    string LayoutName = HttpContext.Current.Session["LayoutValue"].ToString();
    //    AddLayout(LayoutName, true);
    //}

    [WebMethod]
    public static string SessionSet(string SessionValue, string PageName, string PageID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        string Markup = null;
        string ListOfID = "";
        System.Web.UI.HtmlControls.HtmlGenericControl MainDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
        int id = Convert.ToInt32(SessionValue);
        var lst = db.DynamicLayouts.First(U => U.id == id);
        ContentPlaceHolder P1 = new ContentPlaceHolder();
        Layouts LI = new Layouts();
        LI.Name = lst.Name;
        LI.Header = lst.Header.ToString();
        LI.Footer = lst.Footer.ToString();
        LI.ContentRatio = lst.ContentRatio;



        string CRatio = LI.ContentRatio;
        string[] stringSeparators = new string[] { "/" };
        string[] Ratios = CRatio.Split(stringSeparators, StringSplitOptions.None);

        if (LI.Header.Equals("True"))
        {
            System.Web.UI.HtmlControls.HtmlGenericControl rowDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            rowDiv.Attributes.Add("class", "row");

            System.Web.UI.HtmlControls.HtmlGenericControl HeaderDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            HeaderDiv.Attributes.Add("class", "col-md-12 mainLayout");
            HeaderDiv.Attributes.Add("id", "header-wrap");
            HeaderDiv.ID = "header-wrap";
            //System.Web.UI.HtmlControls.HtmlGenericControl outerspan = new System.Web.UI.HtmlControls.HtmlGenericControl("SPAN");
            //outerspan.Attributes.Add("style", "float:right; margin-right:20px;");
            //System.Web.UI.HtmlControls.HtmlGenericControl closespan = new System.Web.UI.HtmlControls.HtmlGenericControl("SPAN");
            //closespan.Attributes.Add("id", "close");
            //closespan.Attributes.Add("class", "glyphicon glyphicon-remove");
            //closespan.Attributes.Add("aria-hidden", "true");
            //outerspan.Controls.Add(closespan);
            //HeaderDiv.Controls.Add(outerspan);
            System.Web.UI.HtmlControls.HtmlGenericControl ListDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            ListDiv.Attributes.Add("class", "sortable");
            ListDiv.Attributes.Add("id", "sortable-header");
            ListDiv.ID = "sortable-header";
            //System.Web.UI.HtmlControls.HtmlGenericControl ListInnerDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("LI");
            //ListInnerDiv.InnerHtml = "&nbsp;";
            //ListDiv.Controls.Add(ListInnerDiv);
            HeaderDiv.Controls.Add(ListDiv);
            rowDiv.Controls.Add(HeaderDiv);
            MainDiv.Controls.Add(rowDiv);
            if (ListOfID.Equals(""))
            {
                ListOfID = "#" + ListDiv.ID + ", ";
            }
            else
            {
                ListOfID = ListOfID + "#" + ListDiv.ID + ", ";
            }
        }
        int i = 2;
        System.Web.UI.HtmlControls.HtmlGenericControl OuterNewrowDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
        OuterNewrowDiv.Attributes.Add("class", "row");
        OuterNewrowDiv.Attributes.Add("style", "margin:0;");
        foreach (string Ratio in Ratios)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl NewrowDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            NewrowDiv.Attributes.Add("class", "row");
            string[] Seperator = new string[] { ":" };
            string[] IntRatios = Ratio.Split(Seperator, StringSplitOptions.None);
            foreach (string IRatio in IntRatios)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl Ratio_1_Div = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                Ratio_1_Div.Attributes.Add("class", "col-md-" + IRatio + " mainLayout");
                Ratio_1_Div.Attributes.Add("style", "padding-right:0;padding-left:0;");
                System.Web.UI.HtmlControls.HtmlGenericControl ListofDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                ListofDiv.Attributes.Add("class", "sortable");
                ListofDiv.Attributes.Add("id", "sortable" + i.ToString());
                ListofDiv.ID = "sortable" + i.ToString();
                //System.Web.UI.HtmlControls.HtmlGenericControl ListofInnerDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("LI");
                //ListofInnerDiv.InnerHtml = "&nbsp;";
                //ListofDiv.Controls.Add(ListofInnerDiv);
                Ratio_1_Div.Controls.Add(ListofDiv);
                //Ratio_1_Div.Attributes.Add("style", "height:250px;");
                //Ratio_1_Div.ID = "content-wrap-1";
                NewrowDiv.Controls.Add(Ratio_1_Div);
                OuterNewrowDiv.Controls.Add(NewrowDiv);
                if (ListOfID.Equals(""))
                {
                    ListOfID = "#" + ListofDiv.ID + ", ";
                }
                else
                {
                    ListOfID = ListOfID + "#" + ListofDiv.ID + ", ";
                }
                i++;
            }
            MainDiv.Controls.Add(OuterNewrowDiv);
        }

        if (LI.Footer.Equals("True"))
        {
            System.Web.UI.HtmlControls.HtmlGenericControl rowDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            rowDiv.Attributes.Add("class", "row");

            System.Web.UI.HtmlControls.HtmlGenericControl HeaderDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            HeaderDiv.Attributes.Add("class", "col-md-12 mainLayout");
            System.Web.UI.HtmlControls.HtmlGenericControl ListDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            ListDiv.Attributes.Add("class", "sortable");
            ListDiv.Attributes.Add("id", "sortable-footer");
            ListDiv.ID = "sortable-footer";
            //System.Web.UI.HtmlControls.HtmlGenericControl ListInnerDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("LI");
            //ListDiv.Controls.Add(ListInnerDiv);
            HeaderDiv.Controls.Add(ListDiv);
            HeaderDiv.Attributes.Add("id", "footer-wrap");
            //ListInnerDiv.InnerHtml = "&nbsp;";
            //ListDiv.Controls.Add(ListInnerDiv);
            HeaderDiv.Controls.Add(ListDiv);
            rowDiv.Controls.Add(HeaderDiv);
            MainDiv.Controls.Add(rowDiv);

            if (ListOfID.Equals(""))
            {
                ListOfID = "#" + ListDiv.ID + ", ";
            }
            else
            {
                ListOfID = ListOfID + "#" + ListDiv.ID + ", ";
            }
        }

        HttpContext.Current.Session["ListOfDivs"] = ListOfID;


        StringBuilder generatedHtml = new StringBuilder();
        using (var htmlStringWriter = new StringWriter(generatedHtml))
        {
            using (var htmlTextWriter = new HtmlTextWriter(htmlStringWriter))
            {
                MainDiv.RenderControl(htmlTextWriter);
                Markup = generatedHtml.ToString();
            }
        }

        return Markup;
    }

    [WebMethod]
    public static void SavePage(string PageName, string PageContent, string PageID)
    {

        string pdirective = "<%@ Register src = 'Components/Core/BaseDreamControl.ascx' tagname = 'BaseDreamControl' tagprefix = 'uc2' %>";
        string[] Seperator = new string[] { "/" };
        string[] IntRatios = PageID.Split(Seperator, StringSplitOptions.None);
        List<string> lst = new List<string>();
        PageContent = pdirective + PageContent;
        PageContent = WebUtility.HtmlDecode(PageContent);
        for (int i = 0; i < IntRatios.Count(); i++)
        {
            lst.Add(IntRatios[i]);
        }
        //Fetching Dream and Page Information
        string dreamName = lst[lst.Count - 2];
        string pageName = lst[lst.Count - 1];
        DreamBirdEntities db = new DreamBirdEntities();
        Dream dream = db.Dreams.Where(d => d.DreamName == dreamName).First();
        DreamLayout dl = db.DreamLayouts.Where(D => D.DreamID == dream.id).First();
        if (dl != null)
        {
            dl.Layout = PageContent;
        }
        else
        {
            //Populating Properties
            dl.DreamID = dream.id;
            dl.Page = pageName;
            dl.Layout = PageContent;
            db.DreamLayouts.Add(dl);
        }
        //Insertign
        db.SaveChanges();


        //Following will store the files in application memory so they can be recompiled
        ArrayList files;
        if (HttpContext.Current.Application["recompilation_layouts"] != null)
        {
            files = (ArrayList)HttpContext.Current.Application["recompilation_layouts"];

        }
        else
        {
            files = new ArrayList();
        }

        files.Add(dreamName);
        HttpContext.Current.Application["recompilation_layouts"] = files;

    }

    //[WebMethod]
    //public static string AddPage(string PageName)
    //{
    //    Page page = new Page();
    //    int i = (int)page.AddPagesID(PageName, "");
    //    return i.ToString();
    //}

    //[WebMethod]
    //public static string LoadPageMarkup(string id)
    //{
    //    Pages page = new Pages();
    //    string PageMarkup = null;
    //    int i = Convert.ToInt32(id);
    //    DataTable dt = page.GetPages(i);
    //    foreach (DataRow dr in dt.Rows)
    //    {
    //        PageMarkup = dr["content"].ToString();
    //    }
    //    return PageMarkup;
    //}

    //[WebMethod]
    //public static string RetrieveControl(string ControlName)
    //{
    //    DreamBirdEntities db = new DreamBirdEntities();
    //    Control H1 = new Control();
    //    var dt = db.Controls.ToList();
    //    System.Web.UI.HtmlControls.HtmlGenericControl innterlist = new System.Web.UI.HtmlControls.HtmlGenericControl("LI");
    //    foreach (DataRow dr in dt.Rows)
    //    {

    //        innterlist.Attributes.Add("class", "ui-state-default");
    //        //innterlist.Attributes.Add("style", "margin: 3px 3px 3px 0; padding: 1px; float: left; width: 100px; height: 90px; font-size: 4em; text-align: center;");
    //        innterlist.InnerHtml = dr["content"].ToString(); /*"<strong>Hello World</strong>"*/;
    //        innterlist.Attributes.Add("id", dr["Name"].ToString());
    //    }
    //    return innterlist.InnerHtml;

    //}

    [WebMethod]
    public static string GetEditableMarkup(string ControlName)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        HTMLControl H1 = new HTMLControl();
        H1 = db.HTMLControls.First(u => u.Name == ControlName);
        //string NormalMarkup = H1.OnEditMarkup;
        return "";
    }

    // Retrives and Renders all icons of the controls and creates the 
    [WebMethod]
    public static string GetAllIcons()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        string GeneratedHTML = null;
        System.Web.UI.HtmlControls.HtmlGenericControl Div = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
        ControlCategory cat = new ControlCategory();
        var dt1 = db.ControlCategories.ToList();
        System.Web.UI.HtmlControls.HtmlGenericControl TabMain = new System.Web.UI.HtmlControls.HtmlGenericControl("UL");
        TabMain.Attributes.Add("class", "nav nav-tabs");
        TabMain.Attributes.Add("role", "tablist");
        System.Web.UI.HtmlControls.HtmlGenericControl TabDIV = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
        TabDIV.Attributes.Add("class", "tab-content");
        foreach (var dr in dt1)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl MainTabLink = new System.Web.UI.HtmlControls.HtmlGenericControl("LI");
            MainTabLink.Attributes.Add("role", "presentation");
            System.Web.UI.HtmlControls.HtmlGenericControl PanelAnchor = new System.Web.UI.HtmlControls.HtmlGenericControl("A");
            PanelAnchor.Attributes.Add("data-toggle", "tab");
            PanelAnchor.Attributes.Add("aria-controls", dr.Name);
            PanelAnchor.Attributes.Add("href", "#" + dr.Name);
            PanelAnchor.Attributes.Add("role", "tab");
            PanelAnchor.InnerText = dr.Name;
            MainTabLink.Controls.Add(PanelAnchor);
            TabMain.Controls.Add(MainTabLink);

            System.Web.UI.HtmlControls.HtmlGenericControl PanelTab = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            PanelTab.Attributes.Add("class", "tab-pane fade");
            PanelTab.Attributes.Add("id", dr.Name);

            HTMLControl H1 = new HTMLControl();
            var dt = db.HTMLControls./*Where(u => u.Category == dr.Name)*/ToList();
            System.Web.UI.HtmlControls.HtmlGenericControl rowDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            rowDiv.Attributes.Add("id", "sortable1");
            rowDiv.Attributes.Add("class", "col-md-12 sortable;");
            rowDiv.Attributes.Add("style", "list-style-type: none; margin: 0; margin-bottom:20px; padding: 0;");
            foreach (var dti in dt)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl innterlist = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                innterlist.Attributes.Add("class", "col-md-2 ui-state-default");
                //innterlist.Attributes.Add("style", "margin: 3px 3px 3px 0; padding: 1px; float: left; width: 100px; height: 90px; font-size: 4em; text-align: center;");
                innterlist.InnerHtml = "<img src='../../Components/DragDropFramework/Uploads/" + dti.IconURL + "' width='100%'/>"; /*"<strong>Hello World</strong>"*/;
                innterlist.Attributes.Add("id", "0-" + dti.id);
                innterlist.Attributes.Add("names", dti.Name);
                //string adminControlName = dti.AdminControlName;
                string defaultControlName = dti.DefautControlName;
                string contents = "<span style='float:right; margin-right:20px; z-index:1 !important;'><span id='edit-" + dti.Name + "' class='glyphicon glyphicon-pencil controlsedit' aria-hidden='true' data-toggle='modal' data-target='#editModal' style='margin-left:5px;margin-right:5px;'></span><span id='close-" + dti.Name + "' class='glyphicon glyphicon-remove-circle controls' style='margin-left:5px;margin-right:5px;' aria-hidden='true'></span></span>" + dti.NormalMarkup;
                //innterlist.Attributes.Add("content", drs["NormalMarkup"].ToString());
                //H1.UpdateControlsOnEdit(drs["Name"].ToString(), contents);
                //innterlist.Attributes.Add("image-id", "<img src='./Content/" + drs["Name"].ToString() + ".jpg' width='100%'/>");
                string S = Convert.ToString('"');
                //innterlist.Attributes.Add("AdminDreamControl", adminControlName);
                innterlist.Attributes.Add("DefaultControlName", defaultControlName);
                innterlist.Attributes.Add("content", contents.Replace(S, "'"));
                rowDiv.Controls.Add(innterlist);
            }
            PanelTab.Controls.Add(rowDiv);
            TabDIV.Controls.Add(PanelTab);
            //accordion.Controls.Add(TabMain);
            //accordion.Controls.Add(TabDIV);
            Div.Controls.Add(TabMain);
            Div.Controls.Add(TabDIV);
            StringBuilder generatedHtml = new StringBuilder();
            using (var htmlStringWriter = new StringWriter(generatedHtml))
            {
                using (var htmlTextWriter = new HtmlTextWriter(htmlStringWriter))
                {
                    Div.RenderControl(htmlTextWriter);
                    GeneratedHTML = generatedHtml.ToString();
                }
            }

        }
        return HttpUtility.HtmlDecode(GeneratedHTML);
    }

    //[WebMethod]
    //public static string GetOnSaveMarkup(string ControlName)
    //{
    //    DreamBirdEntities db = new DreamBirdEntities();
    //    var dt = db.HTMLControls.First(u => u.Name == ControlName);
    //    string NormalMarkup = null;

    //    NormalMarkup = dt.OnSaveMarkup;
    //    return NormalMarkup;
    //}

    [WebMethod]
    public static string GetNormalMarkup(string ControlName)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var dt = db.HTMLControls.First(u => u.Name == ControlName);
        string NormalMarkup = null;

        NormalMarkup = dt.NormalMarkup;
        return NormalMarkup;

    }

    [WebMethod]
    public static string RenderLayout()
    {
        string GeneratedHTML = null;
        DreamBirdEntities db = new DreamBirdEntities();
        System.Web.UI.HtmlControls.HtmlGenericControl ModalDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
        DynamicLayout dl = new DynamicLayout();
        var dt1 = db.DynamicLayouts.ToList();
        ContentPlaceHolder P1 = new ContentPlaceHolder();
        List<Layouts> L1 = new List<Layouts>();

        foreach (var dr in dt1)
        {
            Layouts layout = new Layouts();
            layout.id = Convert.ToInt32(dr.id);
            layout.Name = dr.Name;
            layout.Header = dr.Header.ToString();
            layout.Footer = dr.Footer.ToString();
            layout.ContentRatio = dr.ContentRatio;
            L1.Add(layout);
        }
        foreach (Layouts LI in L1)
        {
            string CRatio = LI.ContentRatio;
            string[] stringSeparators = new string[] { "/" };
            string[] Ratios = CRatio.Split(stringSeparators, StringSplitOptions.None);
            ContentPlaceHolder CP1 = new ContentPlaceHolder();
            System.Web.UI.HtmlControls.HtmlGenericControl outerDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            outerDiv.Attributes.Add("class", "col-md-3 mainLayout");
            if (LI.Header.Equals("True"))
            {
                System.Web.UI.HtmlControls.HtmlGenericControl rowDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                rowDiv.Attributes.Add("class", "row");

                System.Web.UI.HtmlControls.HtmlGenericControl HeaderDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                HeaderDiv.Attributes.Add("class", "col-md-12 myLayout");
                //HeaderDiv.Attributes.Add("id", "header-wrap");
                //HeaderDiv.ID = "header-wrap";

                rowDiv.Controls.Add(HeaderDiv);
                outerDiv.Controls.Add(rowDiv);

            }


            System.Web.UI.HtmlControls.HtmlGenericControl OuterNewrowDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            OuterNewrowDiv.Attributes.Add("class", "row");
            OuterNewrowDiv.Attributes.Add("style", "margin:0;");
            foreach (string Ratio in Ratios)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl NewrowDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                NewrowDiv.Attributes.Add("class", "row");
                string[] Seperator = new string[] { ":" };
                string[] IntRatios = Ratio.Split(Seperator, StringSplitOptions.None);
                foreach (string IRatio in IntRatios)
                {
                    System.Web.UI.HtmlControls.HtmlGenericControl Ratio_1_Div = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    Ratio_1_Div.Attributes.Add("class", "col-md-" + IRatio + " myLayout");
                    Ratio_1_Div.Attributes.Add("style", "padding-right:0;padding-left:0;");
                    System.Web.UI.HtmlControls.HtmlGenericControl ListofDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    //ListofDiv.Attributes.Add("class", "sortable");
                    ////ListofDiv.Attributes.Add("id", "sortable" + i.ToString());
                    //ListofDiv.ID = "sortable" + i.ToString();
                    //System.Web.UI.HtmlControls.HtmlGenericControl ListofInnerDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("LI");
                    //ListofInnerDiv.InnerHtml = "&nbsp;";
                    //ListofDiv.Controls.Add(ListofInnerDiv);
                    Ratio_1_Div.Controls.Add(ListofDiv);
                    //Ratio_1_Div.Attributes.Add("style", "height:250px;");
                    //Ratio_1_Div.ID = "content-wrap-1";
                    NewrowDiv.Controls.Add(Ratio_1_Div);
                    OuterNewrowDiv.Controls.Add(NewrowDiv);
                }
                outerDiv.Controls.Add(OuterNewrowDiv);
            }
            if (LI.Footer.Equals("True"))
            {
                System.Web.UI.HtmlControls.HtmlGenericControl rowDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                rowDiv.Attributes.Add("class", "row");

                System.Web.UI.HtmlControls.HtmlGenericControl HeaderDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                HeaderDiv.Attributes.Add("class", "col-md-12 myLayout");
                //HeaderDiv.Attributes.Add("id", "footer-wrap");

                rowDiv.Controls.Add(HeaderDiv);
                outerDiv.Controls.Add(rowDiv);
            }
            RadioButton MyCB = new RadioButton();
            MyCB.ID = LI.id.ToString() + "-checkbox";
            MyCB.CssClass = "mycheck";
            MyCB.GroupName = "LayoutGroup";
            outerDiv.Controls.Add(MyCB);
            CP1.Controls.Add(outerDiv);
            ModalDiv.Controls.Add(CP1);
        }
        StringBuilder generatedHtml = new StringBuilder();
        using (var htmlStringWriter = new StringWriter(generatedHtml))
        {
            using (var htmlTextWriter = new HtmlTextWriter(htmlStringWriter))
            {
                ModalDiv.RenderControl(htmlTextWriter);
                GeneratedHTML = generatedHtml.ToString();
            }
        }
        return GeneratedHTML;
    }

    public void BindData()
    {
        throw new NotImplementedException();
    }
}