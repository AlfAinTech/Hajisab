<%@ WebHandler Language="C#" Class="MediaItemControl" %>

using System;
using System.Web;
using System.Linq;
using System.Web.Script.Serialization;
using System.IO;
using System.Text.RegularExpressions;


public class MediaItemControl : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        int MediaItemID = Convert.ToInt32(context.Request.QueryString["MIID"].ToString());
        PackageEntities db = new PackageEntities();
        var MediaItem = db.MediaItems.Where(w => w.id == MediaItemID).First();
        MediaItemSingle Item = new MediaItemSingle();
        Item.MediaItemID = MediaItem.id;
        Item.Name = MediaItem.name;
        Item.DateAdded = MediaItem.DateAdded.Value.ToString();
        Item.CategoryID = Convert.ToInt32(MediaItem.MediaCategory_id);
        Item.Type = MediaItem.mediaType;
        Item.MediumType = MediaItem.MediumType;
        if (MediaItem.mediaType == "Image")
        {
            if (MediaItem.MediumType == "External")
            {
                Item.Path = MediaItem.path;
                //System.Drawing.Image image = System.Drawing.Image.FromFile(new Uri(MediaItem.path).AbsolutePath);
                Item.Resolution = /*image.Width + " x " + image.Height*/"Online Image";
                Item.Size = /*(Convert.ToDecimal((new FileInfo(Item.Path).Length.ToString())) / Convert.ToDecimal(1000)).ToString() + " kb"*/ "Size not available";
            }
            else
            {
                Item.Path = MediaItem.Path500;
                System.Drawing.Image image = System.Drawing.Image.FromFile(HttpContext.Current.Server.MapPath("~" + MediaItem.PathOriginal));
                Item.Resolution = image.Width + " x " + image.Height;
                Item.Size = (Convert.ToDecimal((new FileInfo(HttpContext.Current.Server.MapPath("~" + MediaItem.PathOriginal)).Length.ToString())) / Convert.ToDecimal(1000)).ToString() + " kb";

            }

        }
        else if (MediaItem.mediaType == "video")
        {
            if (MediaItem.MediumType == "External")
            {
                Item.Path = MediaItem.path;
                Item.EmbedCode = Regex.Match(MediaItem.path, "<iframe.+?src=[\"'](.+?)[\"'].+?>", RegexOptions.IgnoreCase).Groups[1].Value;
            }
            else
            {
                Item.Path = MediaItem.path + "/" + Item.Name;
            }

        }
        else if (MediaItem.mediaType == "audio")
        {
            Item.Path = MediaItem.path;
        }

        context.Response.ContentType = "text/plain";
        context.Response.Write(new JavaScriptSerializer().Serialize(Item));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}