using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Hosting;
using Microsoft.AspNet.Identity;

/// <summary>
/// Summary description for CustomVirtualProvider
/// </summary>
public class CustomVirtualProvider : VirtualPathProvider
{
    public class CustomVirtualPath : System.Web.Hosting.VirtualPathProvider
    {
        public static void AppInitialize()
        {
            CustomVirtualPath db = new CustomVirtualPath();
            System.Web.Hosting.HostingEnvironment.RegisterVirtualPathProvider(db);
        }
        public override bool FileExists(string viewName)
        {

            if (viewName.Contains("LayoutControl") && viewName.Contains(".ascx"))
            {
                return true;

            }
            else

            {
                return base.FileExists(viewName);
            }

        }

        private DreamLayout getDreamLayout(String viewName)
        {
            viewName = viewName.Replace(".ascx", "");

            String PackageName = PackageUtil.getPackageNameFromControlName(viewName);
            String pageName = PackageUtil.getPageNameFromControlName(viewName);
            //if (pageName.Contains("?"))
            //{
            //    pageName = PackageUtil.getCleanPageWithoutQueryString(pageName);
            //}
            PackageEntities db = new PackageEntities();
            var PageLayout = db.DreamLayouts.Where(q => q.Package.PackageName == PackageName && q.Page == pageName).ToList();
            if (PageLayout.Count() != 0)
            {
                DreamLayout page = PageLayout.First();
                return page;

            }
            return null;
        }
        public override VirtualFile GetFile(string viewName)
        {
            DreamLayout page = null;
            try
            {

                if (viewName.Contains("LayoutControl") && viewName.Contains(".ascx")) // add more suitable filter
                {
                    page = getDreamLayout(viewName);

                    //Remove File from Array so the cache get reset.
                    String PackageName = PackageUtil.getPackageNameFromControlName(viewName);
                    ArrayList files = (ArrayList)HttpContext.Current.Application["recompilation_layouts"];
                    if (files != null)
                    {
                        files.Remove(PackageName);
                    }
                    HttpContext.Current.Application["recompilation_layouts"] = files;

                }

            }
            catch (Exception ex)
            {

            }




            if (page == null)
            {
                return base.GetFile(viewName);
            }
            else
            {

                String data = "This page is not defined";
                if (page.Layout != null)
                {

                    data = page.Layout;


                }

                byte[] content = System.Text.ASCIIEncoding.ASCII.GetBytes(data);
                return new DBVirtualFile(viewName, content);

            }
        }

        //private Boolean isAuthorizedUser(DreamLayout page)
        //{

        //    //// for annonymous user;
        //    //if (HttpContext.Current.User.Identity.IsAuthenticated == false)
        //    //{
        //    //    if (page.Any(auth => auth.PageRole == "AnonymousUser" && auth.isAllowed == true))
        //    //    {

        //    //        return true;
        //    //    }


        //    //}

        //    //// for admin user;
        //    //if (HttpContext.Current.User.Identity.IsAuthenticated && HttpContext.Current.User.IsInRole("Admin"))
        //    //{
        //    //    return true;
        //    //}
            

        //    //return false;

        //}
        public override CacheDependency GetCacheDependency(string virtualPath, System.Collections.IEnumerable virtualPathDependencies, DateTime utcStart)
        {
            return null;
        }

        public override string GetFileHash(string virtualPath, IEnumerable virtualPathDependencies)
        {
            if (isFileRequireFreshCompilation(virtualPath))
            {
                return Guid.NewGuid().ToString(); //This will return new hash and instruct system to reload the resources
            }

            return Previous.GetFileHash(virtualPath, virtualPathDependencies);
        }

        private Boolean isFileRequireFreshCompilation(String virtualPath)
        {

            // Add Caching Logic Here Otherwise resources will be compiled everytime.we need to add logic that the file should be loaded when its value has been updated


            // return (virtualPath.Contains(".ascx") || virtualPath.Contains(".aspx"));
            if (virtualPath.Contains("LayoutControl"))
            {
                ArrayList files = (ArrayList)HttpContext.Current.Application["recompilation_layouts"];
                String PackageName = PackageUtil.getPackageNameFromControlName(virtualPath);
                if (files != null && files.Contains(PackageName))
                {

                    return true;
                }
            }

            return false; //  this will not recompile cache file
        }

    }
}