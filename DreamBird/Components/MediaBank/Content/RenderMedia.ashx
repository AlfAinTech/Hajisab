<%@ WebHandler Language="C#" Class="RenderMedia" %>

using System;
using System.Web;
using System.Linq;
using System.Linq.Dynamic;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class RenderMedia : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string MediaCategory = context.Request.QueryString["MediaCategory"].ToString();
        string CurrentPage = context.Request.QueryString["Start"].ToString();
        string MediaName = context.Request.QueryString["Name"].ToString();
        string MediaType = context.Request.QueryString["MediaType"].ToString();
        DateTime DateAdded = Convert.ToDateTime(context.Request.QueryString["DateAdded"].ToString());
        int Current = Convert.ToInt32(CurrentPage);
        int Skip = 18 * (Current - 1);
        PackageEntities db = new PackageEntities();
        if (MediaType.Equals("All"))
        {
            MediaType = "";
        }
        if (MediaCategory.Equals("0"))
        {
            List<MediaItemMarkup> MediaItems = new List<MediaItemMarkup>();
            var MediaItem = db.MediaItems.Where(w => w.name.Contains(MediaName) && w.mediaType.Contains(MediaType) && w.DateAdded >= DateAdded).ToList().OrderBy(o => o.name).Skip(Skip).Take(18);
            foreach (var item in MediaItem)
            {
                if (item.mediaType == "Image")
                {
                    if (item.MediumType == "External")
                    {
                        MediaItemMarkup markup = new MediaItemMarkup(item.id, item.path, item.mediaType, "", item.MediumType);
                        MediaItems.Add(markup);
                    }
                    else
                    {
                        MediaItemMarkup markup = new MediaItemMarkup(item.id, item.Path100, item.mediaType);
                        MediaItems.Add(markup);
                    }

                }
                else if (item.mediaType == "video")
                {
                    if (item.MediumType == "External")
                    {
                        MediaItemMarkup markup = new MediaItemMarkup(item.id, "/Components/MediaBank/Content/Images/100x100/video.png", item.mediaType, item.path, item.MediumType);
                        MediaItems.Add(markup);
                    }
                    else
                    {
                        MediaItemMarkup markup = new MediaItemMarkup(item.id, "/Components/MediaBank/Content/Images/100x100/video.png", item.mediaType);
                        MediaItems.Add(markup);
                    }

                }
            }

            TotalMediaItems items = new TotalMediaItems();
            items.Items = MediaItems;
            items.TotalItems = db.MediaItems.Where(w => w.name.Contains(MediaName) && w.mediaType.Contains(MediaType) && w.DateAdded >= DateAdded).Count() / 18;
            context.Response.ContentType = "text/plain";
            context.Response.Write(new JavaScriptSerializer().Serialize(items));
        }
        else
        {
            int MediaCategoryID = Convert.ToInt32(MediaCategory);
            var MediaItem = db.MediaItems.Where(w => w.MediaCategory_id == MediaCategoryID && w.name.Contains(MediaName) && w.mediaType.Contains(MediaType) && w.DateAdded >= DateAdded).OrderBy(o => o.name).Skip(Skip).Take(18);
            List<MediaItemMarkup> MediaItems = new List<MediaItemMarkup>();
            foreach (var item in MediaItem)
            {
                if (item.mediaType == "Image")
                {
                    if (item.MediumType == "External")
                    {
                        MediaItemMarkup markup = new MediaItemMarkup(item.id, item.path, item.mediaType);
                        MediaItems.Add(markup);
                    }
                    else
                    {
                        MediaItemMarkup markup = new MediaItemMarkup(item.id, item.Path100, item.mediaType);
                        MediaItems.Add(markup);
                    }

                }
                else if (item.mediaType == "video")
                {
                    if (item.MediumType == "External")
                    {
                        MediaItemMarkup markup = new MediaItemMarkup(item.id, "/Components/MediaBank/Content/Images/100x100/video.png", item.mediaType, item.path);
                        MediaItems.Add(markup);
                    }
                    else
                    {
                        MediaItemMarkup markup = new MediaItemMarkup(item.id, "/Components/MediaBank/Content/Images/100x100/video.png", item.mediaType);
                        MediaItems.Add(markup);
                    }

                }


            }
            TotalMediaItems items = new TotalMediaItems();
            items.Items = MediaItems;
            items.TotalItems = db.MediaItems.Where(w => w.MediaCategory_id == MediaCategoryID && w.name.Contains(MediaName) && w.mediaType.Contains(MediaType) && w.DateAdded >= DateAdded).Count() / 18;
            context.Response.ContentType = "text/plain";
            context.Response.Write(new JavaScriptSerializer().Serialize(items));
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