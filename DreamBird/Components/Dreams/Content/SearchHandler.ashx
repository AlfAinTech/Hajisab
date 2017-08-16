<%@ WebHandler Language="C#" Class="SearchHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNet.Identity;
using System.Web.Script.Serialization;

public class SearchHandler : IHttpHandler
{
    class DreamItem
    {
        public int DreamID;
        public string DreamName;
        public string DreamDescription;
        public int Likes;
        public bool isLiked;
        public string MediaPath;
        public bool isFeatured;
    }

    class FinalStatus
    {
        public List<DreamItem> item;
        public bool DisableButton;
    }
    public void ProcessRequest(HttpContext context)
    {
        string UserID = HttpContext.Current.User.Identity.GetUserId();
        string searched_text = context.Request["SearchKeyword"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        List<DreamItem> list = new List<DreamItem>();
        bool disableButton = false;
        List<Dream> result = new List<Dream>();
        List<int?> taglist = new List<int?>();
        List<int?> dreamTagList = new List<int?>();
        if (db.Tags.Any(a => a.Name == searched_text))
        {
            taglist = db.Tags.Where(w => w.Name == searched_text).Select<Tag, int?>(s => s.id).ToList();
        }
        if (taglist.Count > 0)
        {
            if (db.DreamTags.Any(a => taglist.Contains(a.Tag_id)))
            {
                dreamTagList = db.DreamTags.Where(w => taglist.Contains(w.Tag_id)).Select<DreamTag, int?>(s => s.Dream_id).ToList();
            }
        }
        if (db.Dreams.Any(a => a.DreamName == searched_text) || db.Dreams.Any(a => a.Description.Contains(searched_text)) || db.DreamTags.Any(a => taglist.Contains(a.Tag_id)))
        {
            result = db.Dreams.Where(w => (w.DreamName == searched_text) || (w.Description.Contains(searched_text)) || dreamTagList.Contains(w.id)).ToList();
        }
        foreach (var dream in result)
        {
            DreamItem dreamItem = new DreamItem();
            dreamItem.DreamID = dream.id;
            dreamItem.DreamName = dream.DreamName;
            dreamItem.DreamDescription = dream.Description.ToString().PadRight(100).Substring(0, 100).TrimEnd() + "...";
            dreamItem.MediaPath = dream.MediaItem.Path500;
            dreamItem.isFeatured = dream.IsFeatured;
            dreamItem.Likes = dream.DreamUserLikes.Count;
            if (db.DreamUserLikes.Any(a => a.AspNetUserId == UserID && a.DreamId == dream.id))
            {
                dreamItem.isLiked = true;
            }
            list.Add(dreamItem);
        }
        if (list.Count < 8)
        {
            disableButton = true;
        }
        else
        {
            if (db.Dreams.Count() == 8)
            {
                disableButton = true;
            }
        }
        FinalStatus final = new FinalStatus();
        final.item = list;
        final.DisableButton = disableButton;
        context.Response.ContentType = "text/plain";
        context.Response.Write(new JavaScriptSerializer().Serialize(final));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}