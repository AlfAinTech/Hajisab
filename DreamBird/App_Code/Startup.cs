using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DreamBird.Startup))]
namespace DreamBird
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
            //System.Web.Hosting.HostingEnvironment.RegisterVirtualPathProvider(new CustomVirtualProvider());
        }
    }
}
