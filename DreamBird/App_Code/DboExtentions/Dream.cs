using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Dream
/// </summary>
public partial class  Dream
{
    private Boolean isNotLikedByLoginUser;
    private Boolean isMediaItemImage;
    private Boolean isMediaItemVideo;

    public bool IsNotLikedByLoginUser
    {
        get
        {
            DreamBirdEntities db;
            db = new DreamBirdEntities();
           String name =  HttpContext.Current.User.Identity.Name;
           int count = db.DreamUserLikes.Where(q => q.DreamId == this.id && q.AspNetUser.UserName == name).Count();
           if(count ==0)
           {
                return true;
           }
            return false;
            
        }

        set
        {
            isNotLikedByLoginUser = value;
        }
    }

    public bool IsMediaItemImage
    {
        get
        {
            DreamBirdEntities db;
            db = new DreamBirdEntities();
            int count = db.Dreams.Where(q => q.id == this.id && q.MediaItem.mediaType == "image").Count();
            if (count != 0)
            {
                return true;
            }
            return false;
        }

        set
        {
            isMediaItemImage = value;
        }
    }

    public bool IsMediaItemVideo
    {
        get
        {
            DreamBirdEntities db;
            db = new DreamBirdEntities();
            int count = db.Dreams.Where(q => q.id == this.id && q.MediaItem.mediaType == "video").Count();
            if (count != 0)
            {
                return true;
            }
            return false;
        }

        set
        {
            isMediaItemVideo = value;
        }
    }
}