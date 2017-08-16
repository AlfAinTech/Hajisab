using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for IVideoTranscript
/// </summary>

public interface IVideoTranscript
{
    void BindMedia(MediaItem item);
    void BindMediaTranscript(MediaItem item);
    void AddScripts();
    void CallJavaScript();
}