<%@ WebHandler Language="C#" Class="UploadHandler" %>

using System;
using System.Web;
using ImageProcessor;
using ImageProcessor.Imaging;
using System.IO;
using System.Drawing;
using System.Web.Script.Serialization;

public class UploadHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        DreamBirdEntities db = new DreamBirdEntities();
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            MediaItem mi = new MediaItem();
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                //string fname = context.Server.MapPath("~/uploads/" + file.FileName); 

                string Extension = Path.GetExtension(file.FileName);
                if (Extension.Equals(".jpeg") || Extension.Equals(".jpg") || Extension.Equals(".JPG") || Extension.Equals(".JPEG") || Extension.Equals(".png") || Extension.Equals(".PNG") || Extension.Equals(".gif") || Extension.Equals(".GIF"))
                {
                    string imagePath = HttpContext.Current.Server.MapPath("~/Components/MediaBank/Content/Images/Original/") + file.FileName;
                    string[] savePath = new string[] { HttpContext.Current.Server.MapPath("~/Components/MediaBank/Content/Images/100x100/") + file.FileName, HttpContext.Current.Server.MapPath("~/Components/MediaBank/Content/Images/500x500/") + file.FileName, };
                    file.SaveAs(imagePath);
                    mi.name = file.FileName;
                    mi.path = "/Components/MediaBank/Content/Images";
                    mi.mediaType = "Image";
                    mi.DateAdded = DateTime.Now;
                    db.MediaItems.Add(mi);
                    db.SaveChanges();
                    byte[] photoBytes = File.ReadAllBytes(imagePath); // change imagePath with a valid image path
                    int quality = 70;
                    Size[] sizes = new Size[] { new Size(100,100), new Size(500,500) };

                    using (var inStream = new MemoryStream(photoBytes))
                    {
                        int counter = 0;
                        foreach(Size size in sizes)
                        {
                            using (var outStream = new MemoryStream())
                            {
                                // Initialize the ImageFactory using the overload to preserve EXIF metadata.
                                using (var imageFactory = new ImageFactory(preserveExifData: true))
                                {
                                    // Do your magic here
                                    imageFactory.Load(inStream)
                                        .Resize(size)
                                        .Quality(quality)
                                        .BackgroundColor(Color.White)
                                        .Save(savePath[counter]);
                                }
                            }
                            counter++;
                        }

                    }
                    string Message = "File uploaded successfully";
                    context.Response.ContentType = "text/plain";
                    context.Response.Write((new JavaScriptSerializer().Serialize(Message)));
                }
                else if(Extension.Equals(".mp3") || Extension.Equals(".MP3"))
                {
                    string mediaPath = HttpContext.Current.Server.MapPath("~/Components/MediaBank/Content/Audio/") + file.FileName;
                    file.SaveAs(mediaPath);
                    mi.name = file.FileName;
                    mi.path = "/Components/MediaBank/Content/Audio";
                    mi.mediaType = "audio";
                    mi.DateAdded = DateTime.Now;
                    db.MediaItems.Add(mi);
                    db.SaveChanges();
                    string Message = "File uploaded successfully";
                    context.Response.ContentType = "text/plain";
                    context.Response.Write((new JavaScriptSerializer().Serialize(Message)));
                }
                else if (Extension.Equals(".mpeg") || Extension.Equals(".avi") || Extension.Equals(".mp4") || Extension.Equals(".MPEG") || Extension.Equals(".AVI") || Extension.Equals(".MP4"))
                {
                    string mediaPath = HttpContext.Current.Server.MapPath("~/Components/MediaBank/Content/Video/") + file.FileName;
                    file.SaveAs(mediaPath);
                    mi.name = file.FileName;
                    mi.path = "/Components/MediaBank/Content/Video";
                    mi.mediaType = "video";
                    mi.DateAdded = DateTime.Now;
                    db.MediaItems.Add(mi);
                    db.SaveChanges();
                    string Message = "File uploaded successfully";
                    context.Response.ContentType = "text/plain";
                    context.Response.Write((new JavaScriptSerializer().Serialize(Message)));
                }
                else
                {
                    string Message = "File Cannot be uploaded";
                    context.Response.ContentType = "text/plain";
                    context.Response.Write((new JavaScriptSerializer().Serialize(Message)));
                }
            }

        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }



}