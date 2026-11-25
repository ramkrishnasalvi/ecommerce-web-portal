using System;
using System.IO;
using System.Web;

public class SvgHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string path = context.Server.MapPath(context.Request.AppRelativeCurrentExecutionFilePath);
        if (File.Exists(path))
        {
            context.Response.ContentType = "image/svg+xml";
            context.Response.TransmitFile(path);
        }
        else
        {
            context.Response.StatusCode = 404;
        }
    }

    public bool IsReusable
    {
        get { return true; }
    }
}
