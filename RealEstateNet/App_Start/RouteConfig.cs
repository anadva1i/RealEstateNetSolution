using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace RealEstateNet
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
               name: "Property",
               url: "Property/{id}/{lang}",
               defaults: new { controller = "Home", action = "Property", id = UrlParameter.Optional, lang = UrlParameter.Optional }
           );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
            //routes.MapRoute("Property", "{action}/{id}/{lang}", new { controller = "Home", action = "Property", id = UrlParameter.Optional, lang = UrlParameter.Optional });
           
        }
    }
}
