using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RealEstateNet.Startup))]
namespace RealEstateNet
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
