using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using PagedList;
using RealEstateNet.Models;
using System;
using System.Activities.Debugger;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Drawing;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Reflection;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Transactions;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Security;

namespace RealEstateNet.Controllers
{
    public class DashboardController : Controller
    {
        private string language = "EN";
        private int favoritesPages = 1;
        private int propertiesPages = 1;
        // GET: Dashboard
        public ActionResult Index()
        {
            if (Request.Cookies["lang"] != null)
                language = Request.Cookies["lang"].Value;
            dynamic model = new ExpandoObject();
            model.User = getUserDetails();
            model.Activities = MyActivities();
            HomeController home = new HomeController();
            model.HeaderTranslation = home.TranslateHeader(language);
            return View(model);
        }

        public ActionResult AddNewProperty(int? propertyId)
        {
            if (Request.Cookies["lang"] != null)
                language = Request.Cookies["lang"].Value;
            dynamic model = new ExpandoObject();
            model.TypeModels = GetPropertyType();
            model.StatusModels = GetPropertyStatus();
            model.StateModels = GetPropertyState();
            model.PageModel = addNewPropertyPageModel();
            model.Countries = GetCountries();
            model.Cities = GetCities();
            model.FeaturesModel = getFeatures();
            model.Registered = RegisteredUser();
            model.Property = PrePropertyUpdate(propertyId);
            model.User = getUserDetails();
            model.Services = GetServices();
            HomeController home = new HomeController();
            model.HeaderTranslation = home.TranslateHeader(language);
            return View(model);
        }

        private PropertyServices GetServices()
        {
            using (var context = new DB_RealEstateEntities())
            {
                PropertyServices service = new PropertyServices();
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(language)).Id;
                foreach(var s in context.Services)
                {
                    switch (s.ContentId)
                    {
                        case 194:
                            service.Vip = context.Translations.FirstOrDefault(c => c.ContentId == s.ContentId && c.LanguageId == langId).Text + " - " + s.Price +"₾";
                            break;
                        case 195:
                            service.SuperVip = context.Translations.FirstOrDefault(c => c.ContentId == s.ContentId && c.LanguageId == langId).Text + " - " + s.Price + "₾";
                            break;
                        case 196:
                            service.VipPlus = context.Translations.FirstOrDefault(c => c.ContentId == s.ContentId && c.LanguageId == langId).Text + " - " + s.Price + "₾";
                            break;
                        case 250:
                            service.Update = context.Translations.FirstOrDefault(c => c.ContentId == s.ContentId && c.LanguageId == langId).Text + " - " + s.Price + "₾";
                            break;
                        case 251:
                            service.Border = context.Translations.FirstOrDefault(c => c.ContentId == s.ContentId && c.LanguageId == langId).Text + " - " + s.Price + "₾";
                            break;
                        default:
                            break;
                    }
                }
                return service;
            }
        }
        private CreateListingModel PrePropertyUpdate(int? propertyId)
        {
            CreateListingModel OldProperty = new CreateListingModel();
            if(propertyId != null)
            {
                using (var context = new DB_RealEstateEntities())
                {
                    var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(language)).Id;
                    var db_property = context.Properties.FirstOrDefault(c => c.Id == propertyId);
                    //Get Property Description
                    var DescriptionContent = context.Contents.FirstOrDefault(c => c.Type.Equals("ListingDescription" + propertyId)).Id;
                    var DescriptionEN = context.Translations.FirstOrDefault(c => c.LanguageId == 2 && c.ContentId == DescriptionContent).Text;
                    var DescriptionGE = context.Translations.FirstOrDefault(c => c.LanguageId == 1 && c.ContentId == DescriptionContent).Text;
                    var DescriptionRU = context.Translations.FirstOrDefault(c => c.LanguageId == 3 && c.ContentId == DescriptionContent).Text;
                    //Get Property Type
                    var typeId = db_property.PropertyTypeId;
                    var typeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == typeId).ContentId;
                    var propertyType = context.Translations.FirstOrDefault(c => c.ContentId == typeContent && c.LanguageId == langId).Text;
                    //Get Property Status
                    var statusId = db_property.StatusId;
                    var statusContent = context.Status.FirstOrDefault(c => c.Id == statusId).ContentId;
                    var propertyStatus = context.Translations.FirstOrDefault(c => c.ContentId == statusContent && c.LanguageId == langId).Text;
                    //Get Location
                    var locationId = db_property.LocationId;
                    var location = context.Locations.FirstOrDefault(c => c.Id == locationId);
                    var cityId = location.CityId;
                    var cityContent = context.Cities.FirstOrDefault(c => c.Id == cityId).ContentId;
                    var city = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == cityContent).Text;
                    var addressContent = location.ContentId;
                    var address = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == addressContent).Text;
                    //Get State
                    var stateId = db_property.StateId;
                    var stateContent = context.States.FirstOrDefault(c => c.Id == stateId).ContentId;
                    var propertyState = context.Translations.FirstOrDefault(c => c.ContentId == stateContent && c.LanguageId == langId).Text;
                    //Get Media
                    var media = context.Media.Where(c => c.PropertyId == propertyId);
                    List<string> pics = new List<string>();
                    foreach(var m in media)
                    {
                        pics.Add(m.MediaUrl);
                    }
                    //Get Features
                    var check = "";
                    var propertyFeatures = context.PropertyFeatures.Where(c => c.PropertyId == propertyId);
                    foreach(var feature in propertyFeatures)
                    {
                        if (feature.Availability)
                            check = "checked";
                        else check = "";
                        switch (feature.FeatureId)
                        {
                            case 1:
                                OldProperty.AirConditioning = check;
                                break;
                            case 2:
                                OldProperty.Yard = check;
                                break;
                            case 3:
                                OldProperty.SwimmingPool = check;
                                break;
                            case 4:
                                OldProperty.Fireplace = check;
                                break;
                            case 5:
                                OldProperty.Tv = check;
                                break;
                            case 6:
                                OldProperty.Refrigirator = check;
                                break;
                            case 7:
                                OldProperty.Wifi = check;
                                break;
                            case 8:
                                OldProperty.Sauna = check;
                                break;
                            case 9:
                                OldProperty.WindowCoverings = check;
                                break;

                        }
                    }
                    OldProperty.pictures = pics;
                    OldProperty.DescriptionEN = DescriptionEN;
                    OldProperty.DescriptionGE = DescriptionGE;
                    OldProperty.DescriptionRU = DescriptionRU;
                    OldProperty.Type = propertyType;
                    OldProperty.Status = propertyStatus;
                    OldProperty.State = propertyState;
                    OldProperty.Price = db_property.Price;
                    OldProperty.Area = db_property.PropertySize;
                    OldProperty.Rooms = db_property.Rooms;
                    OldProperty.AddressEN = address;
                    OldProperty.City = city;
                    OldProperty.Latitude = (decimal)location.Latitude;
                    OldProperty.Longitude = (decimal)location.Longitude;
                    OldProperty.Zip = (int)location.Zip;
                    OldProperty.CadastralCode = db_property.CadastralCode;
                    OldProperty.Bedrooms = db_property.Bedrooms;
                    OldProperty.Bathrooms = (int)db_property.Bathrooms;
                    OldProperty.Garages = (int)db_property.Garages;
                    OldProperty.CeilingSize = (int)db_property.CeilingSize;
                    OldProperty.Id = db_property.Id;
                    return OldProperty;
                }
            }
            return OldProperty;
        }

        public ActionResult Message(string email, int? chatId)
        {
            if (Request.Cookies["lang"] != null)
                language = Request.Cookies["lang"].Value;
            dynamic model = new ExpandoObject();
            model.Header = getContactDetails(chatId);
            model.User = getUserDetails();
            model.Contacts = MyContacts(email);
            model.Chat = GetMessages(chatId);
            HomeController home = new HomeController();
            model.HeaderTranslation = home.TranslateHeader(language);
            return View(model);
        }

        public ActionResult Properties(int page, string search)
        {
            if (Request.Cookies["lang"] != null)
                language = Request.Cookies["lang"].Value;
            dynamic model = new ExpandoObject();
            model.Properties = MyProperties(page, search);
            model.Page = propertiesPages;
            model.Search = search;
            model.User = getUserDetails();
            HomeController home = new HomeController();
            model.HeaderTranslation = home.TranslateHeader(language);
            return View(model);
        }

        public ActionResult Favorites(int page)
        {
            if (Request.Cookies["lang"] != null)
                language = Request.Cookies["lang"].Value;
            dynamic model = new ExpandoObject();
            model.Favorites = GetFavorites(page);
            model.Page = favoritesPages;
            model.User = getUserDetails();
            HomeController home = new HomeController();
            model.HeaderTranslation = home.TranslateHeader(language);
            return View(model);
        }

        public ActionResult Packages()
        {
            if (Request.Cookies["lang"] != null)
                language = Request.Cookies["lang"].Value;
            dynamic model = new ExpandoObject();
            model.User = getUserDetails();
            HomeController home = new HomeController();
            model.HeaderTranslation = home.TranslateHeader(language);
            return View(model);
        }

        public ActionResult My_Profile()
        {
            if (Request.Cookies["lang"] != null)
                language = Request.Cookies["lang"].Value;
            dynamic model = new ExpandoObject();
            model.Role = GetUserRole();
            model.UserDetails = GetAgent();
            model.User = getUserDetails();
            HomeController home = new HomeController();
            model.HeaderTranslation = home.TranslateHeader(language);
            return View(model);
        }
        public ActionResult Saved_Search()
        {
            if (Request.Cookies["lang"] != null)
                language = Request.Cookies["lang"].Value;
            dynamic model = new ExpandoObject();
            model.User = getUserDetails();
            HomeController home = new HomeController();
            model.HeaderTranslation = home.TranslateHeader(language);
            return View(model);
        }
        public ActionResult Reviews()
        {
            if (Request.Cookies["lang"] != null)
                language = Request.Cookies["lang"].Value;
            dynamic model = new ExpandoObject();
            model.User = getUserDetails();
            HomeController home = new HomeController();
            model.HeaderTranslation = home.TranslateHeader(language);
            return View(model);
        }

        private IEnumerable<MyPropertiesView> MyProperties(int page, string search)
        {
            List<MyPropertiesView> propertiesViews = new List<MyPropertiesView>();
            using(var context = new DB_RealEstateEntities())
            {
                var userId = User.Identity.GetUserId();
                var user = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId)).Id;
                var properties = context.Properties.Where(c => c.UserDetailsId == user);
                foreach(var p in properties)
                {
                    int propertyId = p.Id;
                    int langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(language)).Id;
                    var TypeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == p.PropertyTypeId).ContentId;
                    var StatusContent = context.Status.FirstOrDefault(c => c.Id == p.StatusId).ContentId;
                    var contentType = context.Contents.FirstOrDefault(c => c.Id == TypeContent).Type;
                    var contentStatus = context.Contents.FirstOrDefault(c => c.Id == StatusContent).Type;
                    var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                    var propertyName = context.Translations.FirstOrDefault(c => c.ContentId == titleContent && c.LanguageId == langId).Text;
                    var locationId = p.LocationId;
                    var contentAddress = context.Locations.FirstOrDefault(c => c.Id == locationId).ContentId;
                    var propertyAddress = context.Translations.FirstOrDefault(c => c.ContentId == contentAddress && c.LanguageId == langId).Text;
                    var statusId = p.StatusId;
                    var propertyStatus = context.Translations.FirstOrDefault(c => c.ContentId == StatusContent && c.LanguageId == langId).Text;
                    var imageURL = context.Media.FirstOrDefault(c=>c.PropertyId == propertyId).MediaUrl;
                    var views = context.PropertyViews.Where(c=>c.PropertyId == propertyId).Count();
                    var currentStatusId = p.CurrentStatusId;
                    var currentStatusContent = context.CurrentStatus.FirstOrDefault(c=>c.Id==currentStatusId).ContentId;
                    var currentStatus = context.Translations.FirstOrDefault(c => c.ContentId == currentStatusContent && c.LanguageId == langId).Text;
                    if(search == null)
                    {
                        MyPropertiesView myProperty = new MyPropertiesView();
                        myProperty.CurrentStatus = currentStatus;
                        myProperty.Status = propertyStatus;
                        myProperty.Price = p.Price;
                        myProperty.DatePublished = p.DatePublished.ToString("MMMM dd, yyyy");
                        myProperty.Name = propertyName;
                        myProperty.Address = propertyAddress;
                        myProperty.ImageUrl = imageURL;
                        myProperty.Views = views;
                        myProperty.Id = propertyId;
                        propertiesViews.Add(myProperty);
                    }
                    else if (propertyName.Contains(search) || propertyAddress.Contains(search) || propertyStatus.Contains(search) || currentStatus.Contains(search))
                    {
                        MyPropertiesView myProperty = new MyPropertiesView();
                        myProperty.CurrentStatus = currentStatus;
                        myProperty.Status = propertyStatus;
                        myProperty.Price = p.Price;
                        myProperty.DatePublished = p.DatePublished.ToString("MMMM dd, yyyy");
                        myProperty.Name = propertyName;
                        myProperty.Address = propertyAddress;
                        myProperty.ImageUrl = imageURL;
                        myProperty.Views = views;
                        propertiesViews.Add(myProperty);
                    }
                }
            }
            int records = propertiesViews.Count;
            int recordsPerPage = 6;
            propertiesPages = (records + recordsPerPage - 1) / recordsPerPage;
            return propertiesViews.AsEnumerable().ToPagedList(page, recordsPerPage);
        }

       
        public ActionResult RemoveProperty(int propertyId)
        {
            try
            {
                using (var ts = new System.Transactions.TransactionScope())
                {
                    using (var context = new DB_RealEstateEntities())
                    {
                        var property = context.Properties.FirstOrDefault(c => c.Id == propertyId);
                        //remove property service
                        var propertyService = context.PropertyServices.FirstOrDefault(c=>c.PropertyId == propertyId);
                        if (propertyService != null)
                            context.PropertyServices.Remove(propertyService);
                        //remove favorites
                        var favorites = context.Favorites.Where(c=>c.PropertyId == propertyId);
                        foreach(var f in favorites)
                        {
                            context.Favorites.Remove(f);
                        }
                        //remove media
                        var media = context.Media.Where(c => c.PropertyId == propertyId);
                        foreach(var m in media)
                        {
                            context.Media.Remove(m);
                        }
                        //remove Features
                        var features = context.PropertyFeatures.Where(c => c.PropertyId == propertyId);
                        foreach(var f in features)
                        {
                            context.PropertyFeatures.Remove(f);
                        }
                        //remove views
                        var views = context.PropertyViews.Where(c => c.PropertyId == propertyId);
                        foreach(var v in views)
                        {
                            context.PropertyViews.Remove(v);
                        }
                        //remove reviews
                        var reviews = context.Reviews.Where(c => c.PropertyId == propertyId);
                        foreach(var r in reviews)
                        {
                            context.Reviews.Remove(r);
                        }
                        //remove contents and translations
                        var propertyContents = context.PropertyContents.Where(c => c.propertyId == propertyId);
                        foreach(var pc in propertyContents)
                        {
                            var contentId = pc.contentId;
                            var translations = context.Translations.Where(c => c.ContentId == contentId);
                            foreach(var t in translations)
                            {
                                context.Translations.Remove(t);
                            }
                            context.PropertyContents.Remove(pc);
                            var content = context.Contents.FirstOrDefault(c => c.Id == contentId);
                            context.Contents.Remove(content);
                        }
                        //remove location
                        var locationId = property.LocationId;
                        var location = context.Locations.FirstOrDefault(c => c.Id == locationId);
                        var locationTranslation = context.Translations.Where(c => c.ContentId == location.ContentId);
                        var locationContent = context.Contents.FirstOrDefault(c => c.Id == location.ContentId);
                        foreach(var l in locationTranslation)
                        {
                            context.Translations.Remove(l);
                        }
                        context.Locations.Remove(location);
                        context.Contents.Remove(locationContent);

                        //Add Activity
                        var userId = User.Identity.GetUserId();
                        int userDetailsId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId)).Id;
                        var activity = new UserActivity();
                        activity.ActivityId = context.Activities.FirstOrDefault(c => c.Name.Equals("Property Remove")).Id;
                        activity.UserId = userDetailsId;
                        SaveActivity(activity);

                        //remove property
                        context.Properties.Remove(property);
                        context.SaveChanges();
                    }
                    ts.Complete();
                }
                return Redirect(Request.UrlReferrer.ToString());
            }
            catch(Exception ex)
            {
                return Redirect(Request.UrlReferrer.ToString());
            }
            
        }

        [HttpPost]
        public ActionResult My_Profile(AgentModel agent)
        {
            if (Request.Cookies["lang"] != null)
                language = Request.Cookies["lang"].Value;
            AgentModel newAgent = new AgentModel();
            var userId = User.Identity.GetUserId();
            using(var context = new DB_RealEstateEntities())
            {
                var userDetails = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId));
                if (agent.Picture != null)
                {
                    string ImageName = System.IO.Path.GetFileName(agent.Picture.FileName);
                    string physicalPath = Server.MapPath("~/Content/images/agents/" + ImageName);
                    agent.Picture.SaveAs(physicalPath);
                }
                if (userDetails == null)
                {
                    UserDetail newUser = new UserDetail();
                    newUser.UserId = userId;
                    if(agent.Name != null)
                    {
                        newUser.Name = agent.Name;
                    }
                    else
                    {
                        newUser.Name = agent.CompanyName;
                    }
                    newUser.LastName = agent.LastName;
                    newUser.Phone = agent.Phone;
                    if(agent.Picture != null)
                        newUser.Picture = "../../Content/images/agents/" + agent.Picture.FileName;
                    context.UserDetails.Add(newUser);
                }
                else
                {
                    if (agent.Name != null)
                    {
                        userDetails.Name = agent.Name;
                    }
                    else
                    {
                        userDetails.Name = agent.CompanyName;
                    }
                    userDetails.LastName = agent.LastName;
                    userDetails.Phone = agent.Phone;
                    if (agent.Picture != null)
                        userDetails.Picture = "../../Content/images/agents/" + agent.Picture.FileName;

                    //Add Activity
                    int userDetailsId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId)).Id;
                    var activity = new UserActivity();
                    activity.ActivityId = context.Activities.FirstOrDefault(c => c.Name.Equals("Profile Update")).Id;
                    activity.UserId = userDetailsId;
                    SaveActivity(activity);
                }
                context.SaveChanges();
            }
            return Redirect(Request.UrlReferrer.ToString());
        }

        private AgentModel GetAgent()
        {
            AgentModel agent = new AgentModel();
            var userId = User.Identity.GetUserId();
            var context = new DB_RealEstateEntities();
            var userDetails = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId));
            if(userDetails != null)
            {
                agent.Name = userDetails.Name;
                agent.LastName = userDetails.LastName;
                agent.Phone = userDetails.Phone;
                agent.PictureURL = userDetails.Picture;
                agent.CompanyName = userDetails.Name;
            }
            
            return agent;
        }

        public UserDetails getUserDetails()
        {
            using (var context = new DB_RealEstateEntities())
            {
                UserDetails user = new UserDetails();
                var thisUserID = User.Identity.GetUserId();
                var isuser = context.UserDetails.Where(c => c.UserId.Equals(thisUserID));
                if (isuser.Count() > 0)
                {
                    var userDetails = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(thisUserID));
                    user.Image = userDetails.Picture;
                    user.Name = userDetails.Name;
                    user.LastName = userDetails.LastName;
                    user.userName = User.Identity.GetUserName();
                }
                return user;
            }
        }

        private IEnumerable<FavoriteView> GetFavorites(int page)
        {
            List<FavoriteView> favorites = new List<FavoriteView>();
            using(var context = new DB_RealEstateEntities())
            {
                var user = User.Identity.GetUserId();
                var userId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(user)).Id;
                var userFavorites = context.Favorites.Where(c => c.UserId == userId);
                foreach(var f in userFavorites)
                {
                    FavoriteView favorite = new FavoriteView();
                    var property = context.Properties.FirstOrDefault(c => c.Id == f.PropertyId);
                    favorite.Id = property.Id;
                    favorite.Price = property.Price;
                    var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(language)).Id;
                    var TypeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == property.PropertyTypeId).ContentId;
                    var StatusContent = context.Status.FirstOrDefault(c => c.Id == property.StatusId).ContentId;
                    var contentType = context.Contents.FirstOrDefault(c => c.Id == TypeContent).Type;
                    var contentStatus = context.Contents.FirstOrDefault(c => c.Id == StatusContent).Type;
                    var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                    favorite.Name = context.Translations.FirstOrDefault(c => c.ContentId == titleContent && c.LanguageId == langId).Text;
                    var locationId = property.LocationId;
                    var locationContent = context.Locations.FirstOrDefault(c => c.Id == locationId).ContentId;
                    favorite.Address = context.Translations.FirstOrDefault(c => c.ContentId == locationContent && c.LanguageId == langId).Text;
                    favorite.ImageUrl = context.Media.FirstOrDefault(c => c.PropertyId == property.Id).MediaUrl;
                    var statusContent = context.Status.FirstOrDefault(c => c.Id == property.StatusId).ContentId;
                    favorite.Status = context.Translations.FirstOrDefault(c => c.ContentId == statusContent && c.LanguageId == langId).Text;
                    favorites.Add(favorite);
                    
                }
            }
            int records = favorites.Count;
            int recordsPerPage = 6;
            favoritesPages = (records + recordsPerPage - 1) / recordsPerPage;
            return favorites.AsEnumerable().ToPagedList(page, recordsPerPage);
        }


        [HttpPost]
        public ActionResult SearchFavorites(string keyword)
        {
            List<FavoriteView> favorites = new List<FavoriteView>();
            using (var context = new DB_RealEstateEntities())
            {
                var user = User.Identity.GetUserId();
                var userId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(user)).Id;
                var userFavorites = context.Favorites.Where(c => c.UserId == userId);
                List<Property> properties = new List<Property>();
                foreach (var f in userFavorites)
                {
                    var property = context.Properties.FirstOrDefault(c => c.Id == f.PropertyId);
                    properties.Add(property);
                    var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(language)).Id;
                    var TypeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == property.PropertyTypeId).ContentId;
                    var StatusContent = context.Status.FirstOrDefault(c => c.Id == property.StatusId).ContentId;
                    var contentType = context.Contents.FirstOrDefault(c => c.Id == TypeContent).Type;
                    var contentStatus = context.Contents.FirstOrDefault(c => c.Id == StatusContent).Type;
                    var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                    var locationId = property.LocationId;
                    var locationContent = context.Locations.FirstOrDefault(c => c.Id == locationId).ContentId;
                    var statusContent = context.Status.FirstOrDefault(c => c.Id == property.StatusId).ContentId;
                    var Name = context.Translations.FirstOrDefault(c => c.ContentId == titleContent && c.LanguageId == langId).Text;
                    var Address = context.Translations.FirstOrDefault(c => c.ContentId == locationContent && c.LanguageId == langId).Text;
                    var Status = context.Translations.FirstOrDefault(c => c.ContentId == statusContent && c.LanguageId == langId).Text;
                    if(Name.Contains(keyword) || Address.Contains(keyword) || Status.Contains(keyword))
                    {
                        FavoriteView favorite = new FavoriteView();
                        favorite.Id = property.Id;
                        favorite.Price = property.Price;
                        favorite.Name = Name;
                        favorite.Address = Address;
                        favorite.ImageUrl = context.Media.FirstOrDefault(c => c.PropertyId == property.Id).MediaUrl;
                        favorite.Status = Status;
                        favorites.Add(favorite);
                    }
                }
            }

            return Json(favorites);
        }

        private bool RegisteredUser()
        {
            bool registered = false;
            var userId = User.Identity.GetUserId();
            var context = new DB_RealEstateEntities();
            var userDetails = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId));
            if (userDetails != null)
                registered = true;
            return registered;
        }

        private string GetUserRole()
        {
            string role;
            var UserID = User.Identity.GetUserId();
            var context = new DB_RealEstateEntities();
            var thisUser = context.AspNetUsers.Where(c => c.Id.Equals(UserID));
            var userRoles = thisUser.Select(user => user.AspNetRoles.Select(r => r.Name)).ToList();
            role = userRoles.First().First();
            return role;
        }

        private List<string> GetCountries()
        {
            List<string> countries = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.Countries.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(language)).Id;
                foreach (var id in contentIds)
                {
                    bool has = context.Translations.Any(c => c.LanguageId == langId && c.ContentId == id);
                    if (has)
                    {
                        var country = context.Translations.Where(c => c.LanguageId == langId && c.ContentId == id).FirstOrDefault();
                        countries.Add(country.Text);
                    }
                }
            }
            return countries;
        }

        private List<string> GetCities()
        {
            List<string> cities = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.Cities.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(language)).Id;
                foreach (var id in contentIds)
                {
                    bool has = context.Translations.Any(c => c.LanguageId == langId && c.ContentId == id);
                    if (has)
                    {
                        var city = context.Translations.Where(c => c.LanguageId == langId && c.ContentId == id).FirstOrDefault();
                        cities.Add(city.Text);
                    }
                }
            }
            return cities;
        }

        private List<string> GetPropertyType()
        {
            List<string> propertyType = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.PropertyTypes.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(language)).Id;
                foreach(var id in contentIds)
                {
                    bool has = context.Translations.Any(c => c.LanguageId == langId && c.ContentId == id);
                    if (has)
                    {
                        var type = context.Translations.Where(c => c.LanguageId == langId && c.ContentId == id).FirstOrDefault();
                        propertyType.Add(type.Text);
                    }
                }
            }
            return propertyType;
        }

        private List<string> GetPropertyStatus()
        {
            List<string> propertyStatus = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.Status.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(language)).Id;
                foreach (var id in contentIds)
                {
                    bool has = context.Translations.Any(c => c.LanguageId == langId && c.ContentId == id);
                    if (has)
                    {
                        var type = context.Translations.Where(c => c.LanguageId == langId && c.ContentId == id).FirstOrDefault();
                        propertyStatus.Add(type.Text);
                    }
                }
            }
            return propertyStatus;
        }
        private List<string> GetPropertyState()
        {
            List<string> propertyState = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.States.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(language)).Id;
                foreach (var id in contentIds)
                {
                    bool has = context.Translations.Any(c => c.LanguageId == langId && c.ContentId == id);
                    if (has)
                    {
                        var type = context.Translations.Where(c => c.LanguageId == langId && c.ContentId == id).FirstOrDefault();
                        propertyState.Add(type.Text);
                    }
                }
            }
            return propertyState;
        }

        private AddNewPropertyPageModel addNewPropertyPageModel()
        {
            AddNewPropertyPageModel addNewPropertyPageModel = new AddNewPropertyPageModel();
            using (var context = new DB_RealEstateEntities())
            {
                PropertyInfo[] properties = typeof(AddNewPropertyPageModel).GetProperties();
                foreach (PropertyInfo property in properties)
                {
                    string value = (from c in context.Contents
                            join t in context.Translations on c.Id equals t.ContentId
                            where t.LanguageId == 2 && c.Type.Equals(property.Name)
                            select t.Text).FirstOrDefault();
                    property.SetValue(addNewPropertyPageModel, value);
                }
                
            }
            return addNewPropertyPageModel;
        }

        private FeaturesModel getFeatures()
        {
            FeaturesModel featuresModel = new FeaturesModel();
            using (var context = new DB_RealEstateEntities())
            {
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(language)).Id;
                PropertyInfo[] properties = typeof(FeaturesModel).GetProperties();
                foreach (PropertyInfo property in properties)
                {
                    string value = (from c in context.Contents
                                    join t in context.Translations on c.Id equals t.ContentId
                                    where t.LanguageId == langId && c.Type.Equals(property.Name)
                                    select t.Text).FirstOrDefault();
                    property.SetValue(featuresModel, value);
                }

            }
            return featuresModel;
        }

        [HttpPost]
        public ActionResult EditListing(CreateListingModel model)
        {
            try
            {
                using (var scope = new System.Transactions.TransactionScope())
                {
                    using (var context = new DB_RealEstateEntities())
                    {
                        //Edit Listing
                        int id = model.Id;
                        var descriptionContent = context.Contents.FirstOrDefault(c => c.Type.Equals("ListingDescription" + id)).Id;
                        var descriptionEN = context.Translations.FirstOrDefault(c => c.ContentId == descriptionContent && c.LanguageId == 2);
                        var descriptionGE = context.Translations.FirstOrDefault(c => c.ContentId == descriptionContent && c.LanguageId == 1);
                        var descriptionRU = context.Translations.FirstOrDefault(c => c.ContentId == descriptionContent && c.LanguageId == 3);
                        
                        if (model.DescriptionEN == "")
                            model.DescriptionEN = model.DescriptionGE;
                        if (model.DescriptionRU == "")
                            model.DescriptionRU = model.DescriptionGE;
                        
                        var contentType = context.Translations.FirstOrDefault(c => c.Text.Equals(model.Type)).ContentId;
                        var propertyTypeId = context.PropertyTypes.FirstOrDefault(c => c.ContentId == contentType).Id;
                        var contentStatus = context.Translations.FirstOrDefault(c => c.Text.Equals(model.Status)).ContentId;
                        var propertyStatusId = context.Status.FirstOrDefault(c => c.ContentId == contentStatus).Id;
                        var property = context.Properties.FirstOrDefault(c => c.Id == id);
                        property.Price = model.Price;
                        property.PropertySize = model.Area;
                        property.Rooms = model.Rooms;
                        property.PropertyTypeId = propertyTypeId;
                        property.StatusId = propertyStatusId;
                        //Edit Location
                        var location = context.Locations.FirstOrDefault(c => c.Id == property.LocationId);
                        location.Latitude = model.Latitude;
                        location.Longitude = model.Longitude;
                        location.Zip = model.Zip;
                        var cityContent = context.Translations.FirstOrDefault(c => c.Text.Equals(model.City)).ContentId;
                        var cityId = context.Cities.FirstOrDefault(c=>c.ContentId == cityContent).Id;
                        location.CityId = cityId;
                        var AddressContent = context.Contents.FirstOrDefault(c => c.Type.Equals("ListingAddress" + id)).Id;
                        var AddressEN = context.Translations.FirstOrDefault(c => c.ContentId == AddressContent && c.LanguageId == 2);
                        var AddressGE = context.Translations.FirstOrDefault(c => c.ContentId == AddressContent && c.LanguageId == 1);
                        var AddressRU = context.Translations.FirstOrDefault(c => c.ContentId == AddressContent && c.LanguageId == 3);
                        AddressEN.Text = model.AddressGE;
                        AddressGE.Text = model.AddressGE;
                        AddressRU.Text = model.AddressGE;
                        //Edit Detailed info
                        int currencyId = context.Currencies.FirstOrDefault(c => c.Symbol.Equals(model.Currency)).Id;
                        property.CadastralCode = model.CadastralCode;
                        property.Bedrooms = model.Bedrooms;
                        property.Bathrooms = model.Bathrooms;
                        property.Garages = model.Garages;
                        property.CeilingSize = model.CeilingSize;
                        property.CurrencyId = currencyId;
                        var stateContent = context.Translations.FirstOrDefault(c => c.Text.Equals(model.State)).ContentId;
                        var stateId = context.States.FirstOrDefault(c => c.ContentId == stateContent).Id;
                        property.StateId = stateId;
                        //Edit Amenities
                        var content_AirConditioning = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_AirConditioning")).Id;
                        var feature_AirConditioning = context.Features.FirstOrDefault(c => c.ContentId == content_AirConditioning).Id;
                        var propertyFeature_AirConditioning = context.PropertyFeatures.FirstOrDefault(c => c.FeatureId == feature_AirConditioning && c.PropertyId == id);
                        var content_Yard = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Yard")).Id;
                        var feature_Yard = context.Features.FirstOrDefault(c => c.ContentId == content_Yard).Id;
                        var propertyFeature_Yard = context.PropertyFeatures.FirstOrDefault(c => c.FeatureId == feature_Yard && c.PropertyId == id);
                        var content_SwimmingPool = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_SwimmingPool")).Id;
                        var feature_SwimmingPool = context.Features.FirstOrDefault(c => c.ContentId == content_SwimmingPool).Id;
                        var propertyFeature_SwimmingPool = context.PropertyFeatures.FirstOrDefault(c => c.FeatureId == feature_SwimmingPool && c.PropertyId == id);
                        var content_Tv = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Tv")).Id;
                        var feature_Tv = context.Features.FirstOrDefault(c => c.ContentId == content_Tv).Id;
                        var propertyFeature_Tv = context.PropertyFeatures.FirstOrDefault(c => c.FeatureId == feature_Tv && c.PropertyId == id);
                        var content_Fireplace = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Fireplace")).Id;
                        var feature_Fireplace = context.Features.FirstOrDefault(c => c.ContentId == content_Fireplace).Id;
                        var propertyFeature_Fireplace = context.PropertyFeatures.FirstOrDefault(c => c.FeatureId == feature_Fireplace && c.PropertyId == id);
                        var content_Refrigirator = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Refrigirator")).Id;
                        var feature_Refrigirator = context.Features.FirstOrDefault(c => c.ContentId == content_Refrigirator).Id;
                        var propertyFeature_Refrigirator = context.PropertyFeatures.FirstOrDefault(c => c.FeatureId == feature_Refrigirator && c.PropertyId == id);
                        var content_Wifi = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Wifi")).Id;
                        var feature_Wifi = context.Features.FirstOrDefault(c => c.ContentId == content_Wifi).Id;
                        var propertyFeature_Wifi = context.PropertyFeatures.FirstOrDefault(c => c.FeatureId == feature_Wifi && c.PropertyId == id);
                        var content_Sauna = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Sauna")).Id;
                        var feature_Sauna = context.Features.FirstOrDefault(c => c.ContentId == content_Sauna).Id;
                        var propertyFeature_Sauna = context.PropertyFeatures.FirstOrDefault(c => c.FeatureId == feature_Sauna && c.PropertyId == id);
                        var content_WindowCoverings = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_WindowCoverings")).Id;
                        var feature_WindowCoverings = context.Features.FirstOrDefault(c => c.ContentId == content_WindowCoverings).Id;
                        var propertyFeature_WindowCoverings = context.PropertyFeatures.FirstOrDefault(c => c.FeatureId == feature_WindowCoverings && c.PropertyId == id);
                        if (model.AirConditioning != null)
                            propertyFeature_AirConditioning.Availability = true;
                        else
                            propertyFeature_AirConditioning.Availability = false;
                        if (model.Yard != null)
                            propertyFeature_Yard.Availability = true;
                        else
                            propertyFeature_Yard.Availability = false;
                        if (model.SwimmingPool != null)
                            propertyFeature_SwimmingPool.Availability = true;
                        else
                            propertyFeature_SwimmingPool.Availability = false;
                        if (model.Tv != null)
                            propertyFeature_Tv.Availability = true;
                        else
                            propertyFeature_Tv.Availability = false;
                        if (model.Fireplace != null)
                            propertyFeature_Fireplace.Availability = true;
                        else
                            propertyFeature_Fireplace.Availability = false;
                        if (model.Refrigirator != null)
                            propertyFeature_Refrigirator.Availability = true;
                        else
                            propertyFeature_Refrigirator.Availability = false;
                        if (model.Wifi != null)
                            propertyFeature_Wifi.Availability = true;
                        else
                            propertyFeature_Wifi.Availability = false;
                        if (model.Sauna != null)
                            propertyFeature_Sauna.Availability = true;
                        else
                            propertyFeature_Sauna.Availability = false;
                        if (model.WindowCoverings != null)
                            propertyFeature_WindowCoverings.Availability = true;
                        else
                            propertyFeature_WindowCoverings.Availability = false;
                        context.SaveChanges();

                        //Add Activity
                        var userId = User.Identity.GetUserId();
                        int userDetailsId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId)).Id;
                        var activity = new UserActivity();
                        activity.ActivityId = context.Activities.FirstOrDefault(c => c.Name.Equals("Property Update")).Id;
                        activity.PropertyId = id;
                        activity.UserId = userDetailsId;
                        SaveActivity(activity);

                        scope.Complete();
                        return RedirectToAction("Property", "Home", new { id = id, lang = language });
                    }
                }
            }
            catch (Exception ex)
            {
                return View();
            }
        }


        [HttpPost]
        public ActionResult CreateListing(CreateListingModel model)
        {
            if (Request.Cookies["lang"] != null)
                language = Request.Cookies["lang"].Value;
            try
            {
                using (var scope = new System.Transactions.TransactionScope())
                {
                    using (var context = new DB_RealEstateEntities())
                    {
                        //Add Property
                        Property property = new Property();
                        var contentType = context.Translations.FirstOrDefault(c => c.Text.Equals(model.Type)).ContentId;
                        var propertyTypeId = context.PropertyTypes.FirstOrDefault(c => c.ContentId == contentType).Id;
                        var statusType = 0;
                        var thisStatus = "";
                        if (model.Status.Equals("იყიდება") || model.Status.Equals("продается"))
                            thisStatus = "Buy";
                        else if (model.Status.Equals("ქირავდება") || model.Status.Equals("в аренду"))
                        {
                            thisStatus = "Rent";
                        }
                        else thisStatus = "Rent Daily";
                        switch (thisStatus)
                        {
                            case "Rent":
                                statusType = context.Contents.FirstOrDefault(c => c.Type.Equals("PropertyStatus_Rent")).Id;
                                break;
                            case "Buy":
                                statusType = context.Contents.FirstOrDefault(c => c.Type.Equals("PropertyStatus_Buy")).Id;
                                break;
                            case "Rent Daily":
                                statusType = context.Contents.FirstOrDefault(c => c.Type.Equals("PropertyStatus_DailyRent")).Id;
                                break;
                        }
                        var statusId = context.Status.FirstOrDefault(c => c.ContentId == statusType).Id;
                        var propertyState = context.Translations.FirstOrDefault(c => c.Text.Equals(model.Status)).ContentId;
                        var stateId = context.Status.FirstOrDefault(c => c.ContentId == propertyState).Id;
                        var userId = User.Identity.GetUserId();
                        int userDetailsId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId)).Id;
                        int currencyId = context.Currencies.FirstOrDefault(c => c.Symbol.Equals(model.Currency)).Id;
                        property.PropertyTypeId = propertyTypeId;
                        property.StatusId = statusId;
                        property.StateId = stateId;
                        property.Price = model.Price;
                        property.PropertySize = model.Area;
                        property.Rooms = model.Rooms;
                        property.CadastralCode = model.CadastralCode;
                        property.Bedrooms = model.Bedrooms;
                        property.Bathrooms = model.Bathrooms;
                        property.Garages = model.Garages;
                        property.CeilingSize = model.CeilingSize;
                        property.UserDetailsId = userDetailsId;
                        property.Active = true;
                        property.DatePublished = DateTime.Now;
                        property.WholePrice = model.Price;
                        property.CurrentStatusId = 2;
                        property.CurrencyId = currencyId;
                        context.Properties.Add(property);
                        context.SaveChanges();

                        //Add Contents
                        Content contentDescription = new Content();
                        contentDescription.Type = "ListingDescription" + property.Id;
                        context.Contents.Add(contentDescription);

                        Content contentAddress = new Content();
                        contentAddress.Type = "ListingAddress" + property.Id;
                        context.Contents.Add(contentAddress);
                        context.SaveChanges();

                        //Add Translations
                        var engId = context.Languages.FirstOrDefault(c => c.Abbr.Equals("EN")).Id;
                        var rusId = context.Languages.FirstOrDefault(c => c.Abbr.Equals("RU")).Id;
                        var geoId = context.Languages.FirstOrDefault(c => c.Abbr.Equals("GE")).Id;

                        Translation descriptionGE = new Translation();
                        descriptionGE.ContentId = contentDescription.Id;
                        descriptionGE.LanguageId = geoId;
                        descriptionGE.Text = model.DescriptionGE;
                        context.Translations.Add(descriptionGE);

                        Translation descriptionEN = new Translation();
                        descriptionEN.ContentId = contentDescription.Id;
                        descriptionEN.LanguageId = engId;
                        if (model.DescriptionEN != null)
                            descriptionEN.Text = model.DescriptionEN;
                        else
                            descriptionEN.Text = model.DescriptionGE;
                        context.Translations.Add(descriptionEN);

                        Translation descriptionRU = new Translation();
                        descriptionRU.ContentId = contentDescription.Id;
                        descriptionRU.LanguageId = rusId;
                        if (model.DescriptionRU!= null)
                            descriptionRU.Text = model.DescriptionRU;
                        else
                            descriptionRU.Text = model.DescriptionGE;
                        context.Translations.Add(descriptionRU);

                        Translation addressGE = new Translation();
                        addressGE.ContentId = contentAddress.Id;
                        addressGE.LanguageId = geoId;
                        addressGE.Text = model.AddressGE;
                        context.Translations.Add(addressGE);

                        Translation addressEN = new Translation();
                        addressEN.ContentId = contentAddress.Id;
                        addressEN.LanguageId = engId;
                        addressEN.Text = model.AddressGE;
                        context.Translations.Add(addressEN);

                        Translation addressRU = new Translation();
                        addressRU.ContentId = contentAddress.Id;
                        addressRU.LanguageId = rusId;
                        addressRU.Text = model.AddressGE;
                        context.Translations.Add(addressRU);
                        context.SaveChanges();

                        //Add PropertyContent
                        PropertyContent propertyDescription = new PropertyContent();
                        propertyDescription.contentId = contentDescription.Id;
                        propertyDescription.propertyId = property.Id;
                        context.PropertyContents.Add(propertyDescription);
                        context.SaveChanges();

                        //Add Location
                        var cityContentId = context.Translations.FirstOrDefault(c=>c.Text.Equals(model.City)).ContentId;
                        var cityId = context.Cities.FirstOrDefault(c => c.ContentId == cityContentId).Id;
                        Location location = new Location();
                        location.Latitude = model.Latitude;
                        location.Longitude = model.Longitude;
                        location.Zip = model.Zip;
                        location.ContentId = contentAddress.Id;
                        location.CityId = cityId;
                        context.Locations.Add(location);
                        context.SaveChanges();
                        property.LocationId = location.Id;
                        context.SaveChanges();
                        //Add Amenities
                        var content_AirConditioning = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_AirConditioning")).Id;
                        var feature_AirConditioning = context.Features.FirstOrDefault(c => c.ContentId == content_AirConditioning).Id;
                        PropertyFeature amenityAirConditioning = new PropertyFeature();
                        amenityAirConditioning.PropertyId = property.Id;
                        amenityAirConditioning.FeatureId = feature_AirConditioning;
                        if (model.AirConditioning != null)
                            amenityAirConditioning.Availability = true;
                        context.PropertyFeatures.Add(amenityAirConditioning);

                        var content_Yard = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Yard")).Id;
                        var feature_Yard = context.Features.FirstOrDefault(c => c.ContentId == content_Yard).Id;
                        PropertyFeature amenityYard = new PropertyFeature();
                        amenityYard.PropertyId = property.Id;
                        amenityYard.FeatureId = feature_Yard;
                        if (model.Yard != null)
                            amenityYard.Availability = true;
                        context.PropertyFeatures.Add(amenityYard);

                        var content_SwimmingPool = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_SwimmingPool")).Id;
                        var feature_SwimmingPool = context.Features.FirstOrDefault(c => c.ContentId == content_SwimmingPool).Id;
                        PropertyFeature amenitySwimmingPool = new PropertyFeature();
                        amenitySwimmingPool.PropertyId = property.Id;
                        amenitySwimmingPool.FeatureId = feature_SwimmingPool;
                        if (model.SwimmingPool != null)
                            amenitySwimmingPool.Availability = true;
                        context.PropertyFeatures.Add(amenitySwimmingPool);

                        var content_Tv = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_TV")).Id;
                        var feature_Tv = context.Features.FirstOrDefault(c => c.ContentId == content_Tv).Id;
                        PropertyFeature amenityTv = new PropertyFeature();
                        amenityTv.PropertyId = property.Id;
                        amenityTv.FeatureId = feature_Tv;
                        if (model.Tv != null)
                            amenityTv.Availability = true;
                        context.PropertyFeatures.Add(amenityTv);

                        var content_Fireplace = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Fireplace")).Id;
                        var feature_Fireplace = context.Features.FirstOrDefault(c => c.ContentId == content_Fireplace).Id;
                        PropertyFeature amenityFireplace = new PropertyFeature();
                        amenityFireplace.PropertyId = property.Id;
                        amenityFireplace.FeatureId = feature_Fireplace;
                        if (model.Fireplace != null)
                            amenityFireplace.Availability = true;
                        context.PropertyFeatures.Add(amenityFireplace);

                        var content_Refrigirator = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Refrigirator")).Id;
                        var feature_Refrigirator = context.Features.FirstOrDefault(c => c.ContentId == content_Refrigirator).Id;
                        PropertyFeature amenityRefrigirator = new PropertyFeature();
                        amenityRefrigirator.PropertyId = property.Id;
                        amenityRefrigirator.FeatureId = feature_Refrigirator;
                        if (model.Refrigirator != null)
                            amenityRefrigirator.Availability = true;
                        context.PropertyFeatures.Add(amenityRefrigirator);

                        var content_Wifi = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Wifi")).Id;
                        var feature_Wifi = context.Features.FirstOrDefault(c => c.ContentId == content_Wifi).Id;
                        PropertyFeature amenityWifi = new PropertyFeature();
                        amenityWifi.PropertyId = property.Id;
                        amenityWifi.FeatureId = feature_Wifi;
                        if (model.Wifi != null)
                            amenityWifi.Availability = true;
                        context.PropertyFeatures.Add(amenityWifi);

                        var content_Sauna = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Sauna")).Id;
                        var feature_Sauna = context.Features.FirstOrDefault(c => c.ContentId == content_Sauna).Id;
                        PropertyFeature amenitySauna = new PropertyFeature();
                        amenitySauna.PropertyId = property.Id;
                        amenitySauna.FeatureId = feature_Sauna;
                        if (model.Sauna != null)
                            amenitySauna.Availability = true;
                        context.PropertyFeatures.Add(amenitySauna);

                        var content_WindowCoverings = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_WindowCoverings")).Id;
                        var feature_WindowCoverings = context.Features.FirstOrDefault(c => c.ContentId == content_WindowCoverings).Id;
                        PropertyFeature amenityWindowCoverings = new PropertyFeature();
                        amenityWindowCoverings.PropertyId = property.Id;
                        amenityWindowCoverings.FeatureId = feature_WindowCoverings;
                        if (model.WindowCoverings != null)
                            amenityWindowCoverings.Availability = true;
                        context.PropertyFeatures.Add(amenityWindowCoverings);
                        context.SaveChanges();

                        //Add Services
                        if (model.Vip != null)
                        {
                            var vipContent = context.Contents.FirstOrDefault(c => c.Type.Equals("ServiceVIP")).Id;
                            var vip = context.Services.FirstOrDefault(c => c.ContentId == vipContent).Id;
                            PropertyService service = new PropertyService();
                            service.ServicesId = vip;
                            service.PropertyId = property.Id;
                            service.ActivationDate = DateTime.Now;
                            service.Active = true;
                            context.PropertyServices.Add(service);
                            context.SaveChanges();
                        }
                        if (model.SuperVip != null)
                        {
                            var superVipContent = context.Contents.FirstOrDefault(c => c.Type.Equals("ServiceSuperVIP")).Id;
                            var superVip = context.Services.FirstOrDefault(c => c.ContentId == superVipContent).Id;
                            PropertyService service = new PropertyService();
                            service.ServicesId = superVip;
                            service.PropertyId = property.Id;
                            service.ActivationDate = DateTime.Now;
                            service.Active = true;
                            context.PropertyServices.Add(service);
                            context.SaveChanges();
                        }
                        if (model.VipPlus != null)
                        {
                            var vipPlusContent = context.Contents.FirstOrDefault(c => c.Type.Equals("ServiceVIP+")).Id;
                            var vipPlus = context.Services.FirstOrDefault(c => c.ContentId == vipPlusContent).Id;
                            PropertyService service = new PropertyService();
                            service.ServicesId = vipPlus;
                            service.PropertyId = property.Id;
                            service.ActivationDate = DateTime.Now;
                            service.Active = true;
                            context.PropertyServices.Add(service);
                            context.SaveChanges();
                        }
                        if (model.Color != null)
                        {
                            var borderContent = context.Contents.FirstOrDefault(c => c.Type.Equals("ServiceBorder")).Id;
                            var border = context.Services.FirstOrDefault(c => c.ContentId == borderContent).Id;
                            PropertyService service = new PropertyService();
                            service.ServicesId = border;
                            service.PropertyId = property.Id;
                            service.ActivationDate = DateTime.Now;
                            service.Active = true;
                            context.PropertyServices.Add(service);
                            context.SaveChanges();
                        }
                        if (model.Update != null)
                        {
                            var updateContent = context.Contents.FirstOrDefault(c => c.Type.Equals("ServiceAutomaticUpdate")).Id;
                            var update = context.Services.FirstOrDefault(c => c.ContentId == updateContent).Id;
                            PropertyService service = new PropertyService();
                            service.ServicesId = update;
                            service.PropertyId = property.Id;
                            service.ActivationDate = DateTime.Now;
                            service.Active = true;
                            context.PropertyServices.Add(service);
                            context.SaveChanges();
                        }

                        //Add Media
                        saveMedia(model.media, property.Id.ToString());

                        //Add Activity
                        var activity = new UserActivity();
                        activity.ActivityId = context.Activities.FirstOrDefault(c=>c.Name.Equals("Property Upload")).Id;
                        activity.PropertyId = property.Id;
                        activity.UserId = userDetailsId;
                        SaveActivity(activity);

                        scope.Complete();
                        if(language.Equals("EN"))
                            return RedirectToAction("Property", "Home", new { id = property.Id });
                        else
                            return RedirectToAction("Property", "Home", new { id = property.Id, lang = language });
                    }
                }
            }
            catch(Exception ex)
            {
                return View();
            }
        }

        public void SaveActivity(UserActivity activity)
        {
            using(var context = new DB_RealEstateEntities())
            {
                context.UserActivities.Add(activity);
                context.SaveChanges();
            }
        }   

        //get Activities
        public List<ActivityModel> MyActivities()
        {
            List<ActivityModel> myActivities = new List<ActivityModel>();
            using (var context = new DB_RealEstateEntities())
            {
                var userId = User.Identity.GetUserId();
                int userDetailsId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId)).Id;
                var db_activities = context.UserActivities.Where(c => c.UserId == userDetailsId);
                foreach(var activity in db_activities)
                {
                    ActivityModel activityModel = new ActivityModel();
                    var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(language)).Id;
                    var thisActivity = context.Activities.FirstOrDefault(c => c.Id == activity.ActivityId);
                    activityModel.Icon = thisActivity.Icon;
                    if (activity.PropertyId != null)
                    {
                        activityModel.PropertyId = (int)activity.PropertyId;
                        var wholeText = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == thisActivity.ContentId).Text;
                        string property = "";
                        int propertyCount = 0;
                        switch (language)
                        {
                            case "EN":
                                property = "property";
                                propertyCount = property.Count();
                                break;
                            case "RU":
                                property = "недвижимост";
                                propertyCount = property.Count() + 1;
                                break;
                            case "GE":
                                property = "ქონება";
                                propertyCount = property.Count();
                                break;
                        }
                        activityModel.Start = wholeText.Substring(0, wholeText.IndexOf(property));
                        activityModel.Middle = wholeText.Substring(activityModel.Start.Count(), propertyCount);
                        var beforeEnd = activityModel.Start.Count() + activityModel.Middle.Count();
                        activityModel.End = wholeText.Substring(beforeEnd, wholeText.Count()-beforeEnd);
                    }
                    else
                    {
                        activityModel.Start = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == thisActivity.ContentId).Text;
                    }
                    myActivities.Add(activityModel);
                }
                return myActivities;
            }
        }

        public void saveMedia(string picture, string folderName)
        {
            var model = JsonConvert.DeserializeObject<List<Picture>>(picture);
            foreach(var m in model)
            {
                int startIndex = m.pic.IndexOf('/');
                int endIndex = m.pic.IndexOf(';');
                var ext = m.pic.Substring(startIndex+1, endIndex - startIndex - 1);
                var path = Path.Combine(Server.MapPath("~/Content/images/property"), folderName);
                Directory.CreateDirectory(path);
                DirectoryInfo d = new DirectoryInfo(path);
                FileInfo[] Files = d.GetFiles("*"); 
                int counter = 1;
                foreach (FileInfo file in Files)
                {
                    string fileName = file.Name.Substring(0, file.Name.IndexOf('.'));
                    bool result = int.TryParse(fileName, out counter);
                    counter++;
                }
                path = Path.Combine(path, counter + "." + ext);
                string imageCode = m.pic.Substring(m.pic.IndexOf(',') + 1);
                byte[] bytes = Convert.FromBase64String(imageCode);
                System.IO.File.WriteAllBytes(path, bytes);
                using(var context = new DB_RealEstateEntities())
                {
                    Medium media = new Medium();
                    media.MediaUrl = "../../Content/images/property/"+folderName+"/"+ counter + "." + ext;
                    media.PropertyId = int.Parse(folderName);
                    context.Media.Add(media);
                    context.SaveChanges();
                }
            }
        }
        public ContactDetails getContactDetails(int? chatId)
        {
            MarkAsSeen(chatId);
            ContactDetails contact = new ContactDetails();
            var myId = User.Identity.GetUserId();
            var userId = 0;
            using (var context = new DB_RealEstateEntities())
            {
                int myDetailsId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(myId)).Id;
                var chat = context.ConnectedUsers.FirstOrDefault(c => c.Id == chatId);
                if (chat != null)
                {
                    if (chat.User1 == myDetailsId)
                        userId = chat.User2;
                    else userId = chat.User1;
                    var user = context.UserDetails.FirstOrDefault(c => c.Id == userId);
                    contact.Name = user.Name + " " + user.LastName;
                    if (user.Picture != null)
                        contact.ImageUrl = user.Picture;
                    else
                        contact.ImageUrl = "../../Content/images/user.png";
                    contact.Role = ((ClaimsIdentity)User.Identity).Claims
                    .FirstOrDefault(c => c.Type == ClaimTypes.Role).Value;
                }
                else contact.Info = "Search for user to start conversation";                
            }
            return contact;
        }

        public Contact UserSearch(string email)
        {
            using (var context = new DB_RealEstateEntities())
            {
                Contact newContact = new Contact();
                var friend = context.AspNetUsers.FirstOrDefault(c => c.UserName.Equals(email)).Id;
                if (friend != null)
                {
                    var userId = User.Identity.GetUserId();
                    int userDetailsId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId)).Id;
                    var friendDetails = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(friend));
                    var contact = context.ConnectedUsers.FirstOrDefault(c => (c.User1 == userDetailsId && c.User2 == friendDetails.Id) || (c.User2 == userDetailsId && c.User1 == friendDetails.Id));
                    newContact.Name = friendDetails.Name + " " + friendDetails.LastName;
                    if (friendDetails.Picture != null)
                        newContact.ImageUrl = friendDetails.Picture;
                    else
                        newContact.ImageUrl = "../../Content/images/user.png";
                    if (contact != null)
                    {
                        newContact.ChatId = contact.Id;
                        //newContact.lastMessage = context.Messages.OrderByDescending(c => c.Id).FirstOrDefault(c => c.ConnectedUserId == contact.Id).Message1;
                        //newContact.NewMessages = context.Messages.Where(c => c.ConnectedUserId == contact.Id && c.Seen == false && c.SenderId == friendDetails.Id).Count();
                    }
                    else AddContact(friendDetails.Id);
                }
                return newContact;
            }
        }

        private bool AddContact(int contactId)
        {
            try
            {
                using (var context = new DB_RealEstateEntities())
                {
                    var myId = User.Identity.GetUserId();
                    var myDetailsId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(myId)).Id;
                    //add connectedUsers
                    ConnectedUser connect = new ConnectedUser();
                    connect.User1 = myDetailsId;
                    connect.User2 = contactId;
                    context.ConnectedUsers.Add(connect);
                    context.SaveChanges();
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public List<Contact> MyContacts(string email)
        {
            List<Contact> myContacts = new List<Contact>();
            using (var context = new DB_RealEstateEntities())
            {
                var userId = User.Identity.GetUserId();
                int userDetailsId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId)).Id;
                if(email != null && email != "")
                {
                    myContacts.Clear();
                    Contact newContact = UserSearch(email);
                    myContacts.Add(newContact);
                }
                else
                {
                    var contacts = context.ConnectedUsers.Where(c => c.User1 == userDetailsId || c.User2 == userDetailsId);
                    foreach (var contact in contacts)
                    {
                        var messages = context.Messages.FirstOrDefault(c => c.ConnectedUserId == contact.Id);
                        if(messages != null)
                        {
                            Contact myContact = new Contact();
                            var contactId = 0;
                            if (contact.User1 == userDetailsId)
                                contactId = contact.User2;
                            else
                                contactId = contact.User1;
                            var user = context.UserDetails.FirstOrDefault(c => c.Id == contactId);
                            myContact.Name = user.Name + " " + user.LastName;
                            if (user.Picture != null)
                                myContact.ImageUrl = user.Picture;
                            else
                                myContact.ImageUrl = "../../Content/images/user.png";
                            myContact.ChatId = contact.Id;
                            myContact.lastMessage = context.Messages.OrderByDescending(c => c.Id).FirstOrDefault(c => c.ConnectedUserId == contact.Id).Message1;
                            myContact.NewMessages = context.Messages.Where(c => c.ConnectedUserId == contact.Id && c.Seen == false && c.SenderId == contactId).Count();
                            myContacts.Add(myContact);
                        }
                    }
                }
            }
            return myContacts;
        }

        public List<TextMessage> GetMessages(int? chatId)
        {
            List<TextMessage> messages = new List<TextMessage>();
            using(var context = new DB_RealEstateEntities())
            {
                var ourMessages = context.Messages.Where(c => c.ConnectedUserId == chatId);
                var connectedUsers = context.ConnectedUsers.FirstOrDefault(c => c.Id == chatId);
                if(connectedUsers != null)
                {
                    var user1 = connectedUsers.User1;
                    var user2 = connectedUsers.User2;
                    var user1Id = context.UserDetails.FirstOrDefault(c => c.Id == user1).UserId;
                    var user2Id = context.UserDetails.FirstOrDefault(c => c.Id == user2).UserId;
                    var user1Email = context.AspNetUsers.FirstOrDefault(c => c.Id.Equals(user1Id)).UserName;
                    var user2Email = context.AspNetUsers.FirstOrDefault(c => c.Id.Equals(user2Id)).UserName;
                    foreach (var msg in ourMessages)
                    {
                        TextMessage message = new TextMessage();
                        message.Text = msg.Message1;
                        message.SendingDate = msg.SendingDate.ToString("MM/dd/yyyy HH:mm");
                        if (msg.SenderId == user1)
                            message.Sender = user1Email;
                        else message.Sender = user2Email;
                        messages.Add(message);
                    }
                }
            }
            return messages;
        }

        public void SendMessage(int chatId, TextMessage text)
        {
            using(var context = new DB_RealEstateEntities())
            {
                var user = context.AspNetUsers.FirstOrDefault(c => c.UserName.Equals(text.Sender)).Id;
                var userId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(user)).Id;
                Message message = new Message();
                message.ConnectedUserId = chatId;
                message.SenderId = userId;
                message.SendingDate = Convert.ToDateTime(text.SendingDate);
                message.Message1 = text.Text;
                message.Seen = false;
                context.Messages.Add(message);
                context.SaveChanges();
            }
        }

        public bool MarkAsSeen(int? chatId)
        {
            using(var context = new DB_RealEstateEntities())
            {
                var userId = User.Identity.GetUserId();
                var userDetailsId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId)).Id;
                var chat = context.Messages.Where(c => c.ConnectedUserId == chatId && c.SenderId != userDetailsId && c.Seen == false);
                if (chat != null)
                {
                    try
                    {
                        foreach (var c in chat)
                        {
                            c.Seen = true;
                        }
                        context.SaveChanges();
                        return true;
                    }
                    catch (Exception ex)
                    {
                        return false;
                    }
                }
                else return false;
            }
        }

        [HttpPost]
        public bool DeleteImage(string src)
        {
            try
            {
                using(var context = new DB_RealEstateEntities())
                {
                    var picture = context.Media.FirstOrDefault(c => c.MediaUrl.Equals(src));
                    context.Media.Remove(picture);
                    context.SaveChanges();
                }
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }

        public void saveAgentPicture(string picture, int id)
        {
            var model = JsonConvert.DeserializeObject<List<Picture>>(picture);
            foreach (var m in model)
            {
                int startIndex = m.pic.IndexOf('/');
                int endIndex = m.pic.IndexOf(';');
                var ext = m.pic.Substring(startIndex + 1, endIndex - startIndex - 1);
                var path = Path.Combine(Server.MapPath("~/Content/images/property"));
                Directory.CreateDirectory(path);
                DirectoryInfo d = new DirectoryInfo(path);
                FileInfo[] Files = d.GetFiles("*");
                //int counter = 1;
                string fileName = "";
                foreach (FileInfo file in Files)
                {
                    fileName = file.Name.Substring(0, file.Name.IndexOf('.'));
                }
                path = Path.Combine(path, fileName + "." + ext);
                string imageCode = m.pic.Substring(m.pic.IndexOf(',') + 1);
                byte[] bytes = Convert.FromBase64String(imageCode);
                System.IO.File.WriteAllBytes(path, bytes);
                using (var context = new DB_RealEstateEntities())
                {
                    var user = context.UserDetails.FirstOrDefault(c=>c.Id==id);
                    user.Picture = "../../Content/images/agents/" + fileName + "." + ext;
                    context.SaveChanges();
                }
            }
        }

    }
}