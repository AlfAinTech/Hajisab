using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MediaItem
/// </summary>
public partial class MediaItem
{
    private string pathWithResolution;
    private string path500;
    private string path100;
    private string pathOriginal;
    private string path480;
    private string path720;
    private string path1080;

    public string Path480
    {
        get
        {
            return path + "/480p/" + name;
        }
    }

    public string Path720
    {
        get
        {
            return path + "/720p/" + name;
        }
    }

    public string Path1080
    {
        get
        {
            return path + "/1080p/" + name;
        }
    }

    public string PathWithResolution
    {
        get
        {
            return pathWithResolution;
        }

        set
        {
            pathWithResolution = value;
        }
    }

    public string Path500
    {
        get
        {
            return path + "/500x500/" + name;
        }

       
    }

    public string Path100
    {
        get
        {
            return path+"/100x100/"+name;
        }

      
    }

    public string PathOriginal
    {
        get
        {
        return path + "/Original/" + name; ;
        }

    }
    public bool IsMediaItemImage
    {
        get
        {
            Boolean result = false;
            if(this.mediaType == "Image")
            {
                result = true;
            }
            return result;
        }

        set
        {
            IsMediaItemImage = value;
        }
    }

    public bool IsMediaItemVideo
    {
        get
        {
            Boolean result = false;
            if (this.mediaType == "video")
            {
                result = true;
            }
            return result;
        }

        set
        {
            IsMediaItemVideo = value;
        }
    }

    public string PathOrigional { get; set; }
}