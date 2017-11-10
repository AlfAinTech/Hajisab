using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Dream
/// </summary>
public partial class  Package
{
    private Boolean isNotLikedByLoginUser;
    private Boolean isMediaItemImage;
    private Boolean isMediaItemVideo;



    public bool IsMediaItemImage
    {
        get
        {
            PackageEntities db;
            db = new PackageEntities();
            int count = db.Packages.Where(q => q.id == this.id && q.MediaItem.mediaType == "image").Count();
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
            PackageEntities db;
            db = new PackageEntities();
            int count = db.Packages.Where(q => q.id == this.id && q.MediaItem.mediaType == "video").Count();
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