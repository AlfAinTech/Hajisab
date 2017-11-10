<%@ WebHandler Language="C#" Class="RenderExternalMedia" %>

using System;
using System.Web;
using System.Linq;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public class RenderExternalMedia : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        //string MediaCategory = context.Request.QueryString["MediaCategory"].ToString();
        string CurrentPage = context.Request.QueryString["Start"].ToString();
        string MediaName = context.Request.QueryString["Name"].ToString();
        string MediaType = context.Request.QueryString["MediaType"].ToString();
        DateTime DateAdded = Convert.ToDateTime(context.Request.QueryString["DateAdded"].ToString());
        int Current = Convert.ToInt32(CurrentPage);
        int Skip = 10 * (Current - 1);
        PackageEntities db = new PackageEntities();
        List<MediaItemMarkup> MediaItems = new List<MediaItemMarkup>();
        var MediaItem = db.MediaItems.Where(w => w.name.Contains(MediaName) && w.mediaType.Contains(MediaType) && w.DateAdded >= DateAdded && w.MediumType == "External").ToList().OrderBy(o => o.name).Skip(Skip).Take(10);
        foreach (var item in MediaItem)
        {
            if (item.mediaType == "Image")
            {
                MediaItemMarkup markup = new MediaItemMarkup(item.id, item.path, item.mediaType);
                MediaItems.Add(markup);
            }
            else if (item.mediaType == "video")
            {
                string Iframe = item.path;
                string Source = "";
                string matchString = Regex.Match(Iframe, "<iframe.+?src=[\"'](.+?)[\"'].+?>", RegexOptions.IgnoreCase).Groups[1].Value;
                MediaItemMarkup markup = new MediaItemMarkup(item.id, "/Components/MediaBank/Content/Images/100x100/video.png", item.mediaType, matchString);
                MediaItems.Add(markup);
            }
        }

        TotalMediaItems items = new TotalMediaItems();
        items.Items = MediaItems;
        items.TotalItems = db.MediaItems.Where(w => w.name.Contains(MediaName) && w.mediaType.Contains(MediaType) && w.DateAdded >= DateAdded && w.MediumType == "External").Count() / 10;
        context.Response.ContentType = "text/plain";
        context.Response.Write(new JavaScriptSerializer().Serialize(items));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}