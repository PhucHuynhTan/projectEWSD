using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ProjectEWSD.Startup))]
namespace ProjectEWSD
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
