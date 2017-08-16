<%@ WebHandler Language="C#" Class="GridPopulator" %>

using System;
using System.Web;
using System.Linq;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using Microsoft.AspNet.Identity;

public class GridPopulator : IHttpHandler
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
        int counter = Convert.ToInt32(context.Request["Counter"].ToString());
        string Mode = context.Request["Mode"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        if (Mode.Equals("Render"))
        {
            List<DreamItem> list = new List<DreamItem>();
            int skip = (counter - 1) * 8;
            int take = counter * 8;
            bool disableButton = false;
            var dreamList = db.Dreams.OrderByDescending(o => o.IsFeatured).Skip(skip).Take(take).ToList();
            foreach (var dream in dreamList)
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
            if(list.Count < 8)
            {
                disableButton = true;
            }
            else
            {
                if(db.Dreams.Count() == 8)
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
        else if (Mode.Equals("Like"))
        {
            if (UserID == null)
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("Invalid");
            }
            else
            {
                string status = context.Request["Status"].ToString();
                int DreamID = Convert.ToInt32(context.Request["DID"].ToString());
                if (status.Equals("Disabled"))
                {
                    DreamUserLike like = new DreamUserLike();
                    like.AspNetUserId = UserID;
                    like.DreamId = DreamID;
                    db.DreamUserLikes.Add(like);
                    db.SaveChanges();
                    int LikeCount = 0;
                    if (db.DreamUserLikes.Any(a => a.DreamId == DreamID))
                    {
                        LikeCount = db.DreamUserLikes.Where(w => w.DreamId == DreamID).Count();
                    }
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Yes>" + LikeCount);
                }
                else if (status.Equals("Enabled"))
                {
                    DreamUserLike like = db.DreamUserLikes.Where(w => w.AspNetUserId == UserID && w.DreamId == DreamID).First();
                    db.DreamUserLikes.Remove(like);
                    db.SaveChanges();
                    int LikeCount = 0;
                    if (db.DreamUserLikes.Any(a => a.DreamId == DreamID))
                    {
                        LikeCount = db.DreamUserLikes.Where(w => w.DreamId == DreamID).Count();
                    }
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("No>"+LikeCount);
                }

            }

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