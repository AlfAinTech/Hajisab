<%@ WebHandler Language="C#" Class="LayoutSave" %>

using System;
using System.Web;
using HtmlAgilityPack;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
public class LayoutSave : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string jsonString = string.Empty;

        context.Request.InputStream.Position = 0;
        using (var inputStream = new System.IO.StreamReader(context.Request.InputStream))
        {
            jsonString = inputStream.ReadToEnd();
        }
        DreamBirdEntities db = new DreamBirdEntities();
        string[] separators = { "SPLIT" };
        string[] words = jsonString.Split(separators, StringSplitOptions.RemoveEmptyEntries);
        string S = Convert.ToString('"');
        if (words[2].Equals("Layout"))
        {
            string layoutName = words[1];
            ClientLayout cl = new ClientLayout();
            if (db.ClientLayouts.Any(a => a.layoutName == layoutName))
            {
                cl = db.ClientLayouts.Where(w => w.layoutName == layoutName).First();
                cl.layoutContent = words[0].Replace(S, "'");
                db.SaveChanges();
            }
            else
            {
                cl.layoutName = words[1];
                cl.layoutContent = words[0].Replace(S, "'");
                db.ClientLayouts.Add(cl);
                db.SaveChanges();
            }

        }
        else if (words[2].Equals("Page"))
        {
            List<string> lst = new List<string>();
            List<bool> blst = new List<bool>();
            List<string> dlst = new List<string>();
            HtmlDocument html = new HtmlDocument();
            html.LoadHtml(words[0].Replace(S, "'"));
            var root = html.DocumentNode;
            var links = root.Descendants("a");
            ClientPage cp = new ClientPage();
            int dreamid = Convert.ToInt32(words[3]);
            string dreamName = db.Dreams.Where(w => w.id == dreamid).Select(s => s.DreamName).First();
            string pagename = words[1];
            DreamLayout dl = db.DreamLayouts.Where(w => w.DreamID == dreamid && w.Page == pagename).First();
            int dreamlayoutid = dl.id;
            if (db.ClientPages.Any(a => a.DreamLayout_id == dreamid && a.Page == pagename))
            {
                cp = db.ClientPages.Where(a => a.DreamLayout_id == dreamid && a.Page == pagename).First();
            }
            cp.Page = pagename;
            cp.DreamLayout_id = dreamid;
            cp.pageContent = root.OuterHtml;
            if (!(db.ClientPages.Any(a => a.DreamLayout_id == dreamid && a.Page == pagename)))
            {
                db.ClientPages.Add(cp);
            }
            var outerlayouts = root.Descendants("div").Where(w => !(w.Attributes.Contains("data-name"))).ToList();
            CleanHTML(outerlayouts, context, db, lst, blst, dlst, dreamid, dreamlayoutid);


            root.PrependChild(HtmlNode.CreateNode(DreamUtil.directive));
            dl.Layout = root.OuterHtml;
            HtmlDocument newhtml = new HtmlDocument();
            newhtml.LoadHtml(cp.pageContent);
            var newroot = newhtml.DocumentNode;
            var newlinks = newroot.Descendants("a");
            var removeLinks = newroot.Descendants("div").Where(w => w.Attributes.Contains("data-name"));
            int i = 0;
            foreach (var link in newlinks)
            {
                //link.Attributes.Remove("href");
                link.Attributes["href"].Value = lst[i];
                link.Attributes.Add("attrTo", lst[i]);
                link.Attributes.Remove("style");
                link.Attributes.Remove("target");
                link.Attributes.Remove("onclick");
                link.Attributes.Add("target", "page_frame");
                if(link.ParentNode.Attributes["data-name"] != null)
                {
                    string name = link.ParentNode.Attributes["data-name"].Value;
                    if(name.Equals("Lesson Menu"))
                    {
                        link.Attributes["target"].Value = "_blank";
                    }
                }
                link.Attributes.Add("target", "page_frame");
                link.Attributes.Add("onclick", "SetIFrame('"+lst[i]+"');");

                //if (blst[i] == true)
                //{
                //    link.Attributes.Add("onclick", "window.open(this.href, 'mywin','left=20,top=20,width=500,height=500,toolbar=1,resizable=0'); return false;");
                //}
                i++;
            }
            int j = 0;
            foreach (var removelink in removeLinks)
            {
                if (!dlst[j].Equals("NoLink"))
                {
                    var remove = removelink.Descendants("span").Where(w => w.Attributes["class"].Value == "glyphicon glyphicon-remove remove").First();
                    remove.Attributes.Add("data-remove", dlst[j]);
                }

                j++;
            }
            cp.pageContent = newroot.OuterHtml;
            db.SaveChanges();
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
            context.Response.ContentType = "text/html";
            context.Response.Write(cp.pageContent);

        }


    }

    private void CleanHTML(List<HtmlNode> List, HttpContext context, DreamBirdEntities db, List<string> lst, List<bool> blst, List<string> dlst, int dreamid, int dreamlayoutid)
    {

        foreach (var layout in List)
        {

            var innerLayouts = layout.Descendants("div").Where(w => !(w.Attributes.Contains("data-name"))).ToList();
            if (innerLayouts.Count > 0)
            {
                CleanHTML(innerLayouts, context, db, lst, blst, dlst, dreamid, dreamlayoutid);
            }
            var ComponentChilds = layout.Descendants("div").Where(w => w.Attributes.Contains("data-name"));
            HtmlNodeCollection col = new HtmlNodeCollection(layout);
            foreach (var child in ComponentChilds)
            {
                string dataname = child.Attributes["data-name"].Value;
                string BaseDreamID = child.Attributes["data-basedreamserverid"].Value;
                int ComponentID = db.HTMLControls.Where(w => w.Name == dataname).Select(s => s.id).First();
                var subchilds = child.Descendants("input");
                if (subchilds.Count() > 0)
                {
                    var checkbox = child.Descendants("input").Where(w => w.Attributes["type"].Value == "checkbox").First();
                    if (checkbox.Attributes.Any(a => a.Name == "checked"))
                    {
                        var textbox = child.Descendants("input").Where(w => w.Attributes["type"].Value == "number").First();
                        string weightage = textbox.Attributes["value"].Value;
                        string baseserverid = "BaseDreamControl" + BaseDreamID;
                        DreamPageControl dpc = new DreamPageControl();
                        if (db.DreamPageControls.Any(a => a.Layout_ID == dreamlayoutid && a.Component_ID == ComponentID && a.BaseDreamServer_ID == baseserverid))
                        {
                            dpc = db.DreamPageControls.Where(a => a.Layout_ID == dreamlayoutid && a.Component_ID == ComponentID && a.BaseDreamServer_ID == baseserverid).First();
                            dpc.TotalProgress = Convert.ToDecimal(weightage);

                        }
                        else
                        {
                            dpc.Layout_ID = dreamlayoutid;
                            dpc.Component_ID = ComponentID;
                            dpc.BaseDreamServer_ID = baseserverid;
                            dpc.TotalProgress = Convert.ToDecimal(weightage);
                            db.DreamPageControls.Add(dpc);
                        }
                        db.SaveChanges();
                    }
                    else
                    {
                        string baseserverid = "BaseDreamControl" + BaseDreamID;
                        if (db.DreamPageControls.Any(a => a.Layout_ID == dreamlayoutid && a.BaseDreamServer_ID == baseserverid))
                        {
                            DreamPageControl pagecontrol = db.DreamPageControls.Where(w => w.Layout_ID == dreamlayoutid && w.BaseDreamServer_ID == baseserverid).First();
                            db.DreamPageControls.Remove(pagecontrol);
                            db.SaveChanges();
                        }
                    }
                }
                HTMLControl control = db.HTMLControls.Where(w => w.Name == dataname).First();
                if (control.DeleteControlPath != null)
                {
                    string deleteurl = context.Request.Url.GetLeftPart(UriPartial.Authority) + control.DeleteControlPath + "?DID=" + dreamid + "&PID=" + dreamlayoutid + "&CID=BaseDreamControl" + BaseDreamID;
                    dlst.Add(deleteurl);
                }
                else
                {
                    dlst.Add("NoLink");
                }
                string url = context.Request.Url.GetLeftPart(UriPartial.Authority) + control.AdminControlPath + "?DID=" + dreamid + "&PID=" + dreamlayoutid + "&CID=BaseDreamControl" + BaseDreamID;
                lst.Add(url);
                if (Convert.ToBoolean(control.isSeperateWindow))
                {
                    blst.Add(true);
                }
                else
                {
                    blst.Add(false);
                }
                string originalcontrol = "<uc2:BaseDreamControl ID='BaseDreamControl" + BaseDreamID + "' runat='server' DefaultControl='" + control.DefautControlName + "' />";
                col.Add(HtmlNode.CreateNode(originalcontrol));

                //controlID++;
            }
            if (layout.Attributes.Contains("data-size"))
            {
                var styles = layout.Descendants("input").First();
                var classes = layout.Descendants("input").ElementAt(1);
                var spans = layout.Descendants().Where(w => w.Name == "span").ToList();
                layout.Attributes["class"].Remove();
                //string cssclass = layout.Attributes["data-size"].Value;
                layout.Attributes["data-size"].Remove();
                layout.Attributes.Add("class", classes.Attributes["value"].Value);
                layout.Attributes["style"].Remove();
                layout.Attributes.Add("style", styles.Attributes["value"].Value);

                if (layout.ChildNodes.Any(a => a.Name == "span"))
                {
                    var children = layout.SelectNodes("span");
                    foreach (var child in children)
                    {
                        child.Remove();
                    }
                }
                if (layout.ChildNodes.Any(a => a.Name == "div"))
                {
                    var components = layout.SelectNodes("div").Where(w => w.Attributes.Contains("data-name"));
                    foreach (var child in components)
                    {
                        child.Remove();
                    }
                }
                if (layout.ChildNodes.Any(a => a.Name == "input"))
                {
                    var inputs = layout.SelectNodes("input");
                    foreach (var child in inputs)
                    {
                        child.Remove();
                    }
                }
                layout.AppendChildren(col);
            }



            //if(layout.Attributes.Contains("data-name"))
            //{

            //}

            //layout.RemoveAllChildren();
            //}

        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}