using RealEstateNet.Models;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Net.Mail;
using System.Net.Sockets;
using System.Net.NetworkInformation;
using WebGrease.Css.Extensions;
using System.IO;
using Microsoft.AspNet.Identity;
using System.Globalization;
using PagedList;

namespace RealEstateNet.Controllers
{
    public class HomeController : Controller
    {
        private int SearchedPage;
        private string language = "EN";
        Similars similar;
        public ActionResult Index(string lang)
        {
            if (lang == null)
                lang = "EN";
            language = lang;
            dynamic model = new ExpandoObject();
            model.Status = GetStatuses(lang);
            model.Type = GetTypes(lang);
            model.Amenity = GetAmenities(lang);
            model.Cities = GetCities(lang);
            model.States = GetState(lang);
            model.VIP = GetVIP(lang);
            model.SuperVIP = GetSuperVIP(lang);
            model.VIP_Plus = GetVIP_Plus(lang);
            model.Urgently = GetUrgently(lang);
            model.Tbilisi = GetCity(lang, "Tbilisi");
            model.Mtskheta = GetCity(lang, "Mtskheta");
            model.Kutaisi = GetCity(lang, "Kutaisi");
            model.Batumi = GetCity(lang, "Batumi");
            model.Language = lang;
            model.User = getUserDetails();
            model.Translation = TranslateHome(lang);
            model.HeaderTranslation = TranslateHeader(lang);
            return View(model);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Calculator()
        {
            dynamic model = new ExpandoObject();
            model.User = getUserDetails();
            model.HeaderTranslation = TranslateHeader(language);
            return View(model);
        }
        public ActionResult PriceRange()
        {
            dynamic model = new ExpandoObject();
            model.User = getUserDetails();
            model.HeaderTranslation = TranslateHeader(language);
            return View(model);
        }
        public ActionResult Services()
        {
            dynamic model = new ExpandoObject();
            model.User = getUserDetails();
            model.HeaderTranslation = TranslateHeader(language);
            return View(model);
        }

        public ActionResult Property(int id, string lang)
        {
            dynamic model = new ExpandoObject();
            if (String.IsNullOrWhiteSpace(lang))
                lang = "EN";
            model.Media = GetMedia(id);
            model.Details = GetPropertyDetails(id, lang);
            model.Features = GetPropertyFeatures(id, lang);
            model.Agent = GetAgent(id);
            model.Similars = GetsimilarProperties(lang);
            var ip = getIP();
            model.Recently = GetRecentlyViewed(ip, id, lang);
            model.PropertyId = id;
            model.TotalReviews = GetTotalReviews(id);
            model.ExistedReviews = GetExistedReviews(id);
            model.User = getUserDetails();
            model.HeaderTranslation = TranslateHeader(lang);
            return View(model);
        }
        public UserDetails getUserDetails()
        {
            using (var context = new DB_RealEstateEntities())
            {
                UserDetails user = new UserDetails();
                var thisUserID = User.Identity.GetUserId();
                var isuser = context.UserDetails.Where(c => c.UserId.Equals(thisUserID));
                if(isuser.Count() > 0)
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
        [HttpPost]
        public ActionResult Search(string lang, SearchModel search)
        {
            dynamic model = new ExpandoObject();
            if (lang == null)
                lang = "EN";
            model.Result = SearchedResult(lang, search);
            model.Status = GetStatuses(lang);
            model.Type = GetTypes(lang);
            model.Amenity = GetAmenities(lang);
            model.Cities = GetCities(lang);
            model.States = GetState(lang);
            model.SearchResult = search;
            model.User = getUserDetails();
            model.Page = SearchedPage;
            model.HeaderTranslation = TranslateHeader(lang);
            return View(model);
        }

        private List<PropertySmallView> GetPropertiesByCity(string lang, string city)
        {
            List<PropertySmallView> properties = new List<PropertySmallView>();
            using(var context = new DB_RealEstateEntities())
            {
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                var cityContentId = context.Contents.FirstOrDefault(c => c.Type.Equals(city)).Id;
                var cityId = context.Cities.FirstOrDefault(c => c.ContentId == cityContentId).Id;
                var locations = context.Locations.Where(c => c.CityId == cityId);
                foreach(var l in locations)
                {
                    PropertySmallView property = new PropertySmallView();
                    var db_property = context.Properties.FirstOrDefault(c => c.LocationId == l.Id);
                    property.Id = db_property.Id;
                    property.Price = db_property.Price;
                    property.Area = db_property.PropertySize;
                    property.Baths = db_property.Bathrooms;
                    property.Beds = db_property.Bedrooms;
                    property.DatePublished = db_property.DatePublished.ToString("MMMM dd");
                    var media = context.Media.FirstOrDefault(c => c.PropertyId == db_property.Id);
                    property.ImageUrl = media.MediaUrl;
                    var typeContentId = context.PropertyTypes.FirstOrDefault(c => c.Id == db_property.PropertyTypeId).ContentId;
                    var type = context.Translations.FirstOrDefault(c => c.ContentId == typeContentId && c.LanguageId == langId).Text;
                    property.Type = type;
                    var statusContentId = context.Status.FirstOrDefault(c => c.Id == db_property.StatusId).ContentId;
                    var status = context.Translations.FirstOrDefault(c => c.ContentId == statusContentId && c.LanguageId == langId).Text;
                    property.Status = status;
                    var contentType = context.Contents.FirstOrDefault(c => c.Id == typeContentId).Type;
                    var contentStatus = context.Contents.FirstOrDefault(c => c.Id == statusContentId).Type;
                    var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                    var contentAddressId = context.Contents.FirstOrDefault(c => c.Type.Equals("ListingAddress" + db_property.Id)).Id;
                    property.Name = context.Translations.FirstOrDefault(c => c.ContentId == titleContent && c.LanguageId == langId).Text;
                    property.Address = context.Translations.FirstOrDefault(c => c.ContentId == contentAddressId && c.LanguageId == langId).Text;
                    var userId = db_property.UserDetailsId;
                    var user = context.UserDetails.FirstOrDefault(c => c.Id == userId);
                    property.AgentName = user.Name + " " + user.LastName;
                    property.AgentPic = user.Picture;
                    properties.Add(property);
                }
            }
            return properties;
        }

        private TotalReviews GetTotalReviews(int id)
        {
            TotalReviews totalReviews = new TotalReviews();
            using(var context = new DB_RealEstateEntities())
            {
                var reviews = context.Reviews.Where(c => c.PropertyId == id);
                totalReviews.Total = reviews.Count();
                var sum = 0;
                foreach(var r in reviews)
                {
                    sum += r.Stars;
                }
                if(sum > 0)
                    totalReviews.Stars = sum / totalReviews.Total;
            }
            return totalReviews;
        }

        private List<ExistedReview> GetExistedReviews(int id)
        {
            List<ExistedReview> existedReviews = new List<ExistedReview>();
            using (var context = new DB_RealEstateEntities())
            {
                var reviews = context.Reviews.Where(c=>c.PropertyId == id);
                foreach(var r in reviews)
                {
                    ExistedReview existedReview = new ExistedReview();
                    var user = context.UserDetails.FirstOrDefault(c => c.Id == r.UserDetailsId);
                    existedReview.Picture = user.Picture;
                    existedReview.Name = user.Name +" "+ user.LastName;
                    existedReview.Comment = r.Comment;
                    existedReview.Stars = r.Stars;
                    existedReview.ReviewDate = r.ReviewDate.ToString("MMMM d, yyyy");
                    existedReviews.Add(existedReview);
                }
            }
            return existedReviews;
        }

        [HttpPost]
        public String SendEmail(string mail_from, string mail_to, string subject, string body)
        {
            MailAddress to = new MailAddress(mail_to);
            MailAddress from = new MailAddress(mail_from);

            MailMessage message = new MailMessage(from, to);
            message.Subject = subject;
            message.Body = body + "\n Message was sent by: "+mail_from;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
            {
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("homellandd@gmail.com", "guja19921992"),
                EnableSsl = true
            };

            try
            {
                client.Send(message);
                return "Email was sent successfully!";
            }
            catch (SmtpException ex)
            {
                Console.WriteLine(ex.ToString());
                return "Unfortunately your email could not be sent. Please try again later";
            }
        }

        [HttpPost]
        public bool AddFavorite(int propertyId)
        {
            using(var context = new DB_RealEstateEntities())
            {
                var user = User.Identity.GetUserId();
                var userId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(user)).Id;
                Favorite favorite = new Favorite();
                favorite.PropertyId = propertyId;
                favorite.UserId = userId;
                try
                {
                    context.Favorites.Add(favorite);

                    //Add Activity
                    var property = context.Properties.FirstOrDefault(c => c.Id == propertyId);
                    var activity = new UserActivity();
                    activity.ActivityId = context.Activities.FirstOrDefault(c => c.Name.Equals("Add to Favorites")).Id;
                    activity.PropertyId = propertyId;
                    activity.VisitorId = userId;
                    activity.UserId = property.UserDetailsId;
                    new DashboardController().SaveActivity(activity);

                    context.SaveChanges();
                    return true;
                }
                catch(Exception ex)
                {
                    return false;
                }
            }
        }

        [HttpPost]
        public bool RemoveFavorite(int propertyId)
        {
            using (var context = new DB_RealEstateEntities())
            {
                var user = User.Identity.GetUserId();
                var userId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(user)).Id;
                var favorite = context.Favorites.FirstOrDefault(c => c.PropertyId == propertyId && c.UserId == userId);
                try
                {
                    if(favorite != null)
                        context.Favorites.Remove(favorite);

                    //Add Activity
                    var property = context.Properties.FirstOrDefault(c => c.Id == propertyId);
                    var activity = new UserActivity();
                    activity.ActivityId = context.Activities.FirstOrDefault(c => c.Name.Equals("Remove from Favorites")).Id;
                    activity.PropertyId = propertyId;
                    activity.VisitorId = userId;
                    activity.UserId = property.UserDetailsId;
                    new DashboardController().SaveActivity(activity);

                    context.SaveChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        private List<string> GetMedia(int propertyId)
        {
            List<string> mediaUrl = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var media = context.Media.Where(c => c.PropertyId == propertyId);
                foreach (var m in media)
                {
                    var fileName = m.MediaUrl;
                    mediaUrl.Add(fileName);
                }
            }
            return mediaUrl;
        }

        private SinglePropertyView GetPropertyDetails(int propertyId, string lang)
        {
            SinglePropertyView property = new SinglePropertyView();
            similar = new Similars();
            var ip = getIP();
            AddViews(propertyId, ip);
            using (var context = new DB_RealEstateEntities())
            {
                var db_property = context.Properties.FirstOrDefault(c => c.Id == propertyId);
                int langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                var contentDescription = context.Contents.FirstOrDefault(c => c.Type.Equals("ListingDescription" + propertyId)).Id;
                var contentAddress = context.Contents.FirstOrDefault(c => c.Type.Equals("ListingAddress" + propertyId)).Id;
                var location = context.Locations.FirstOrDefault(c => c.ContentId == contentAddress);
                var city = context.Cities.FirstOrDefault(c => c.Id == location.CityId).ContentId;
                var cityText = context.Translations.FirstOrDefault(c => c.ContentId == city && c.LanguageId == langId).Text;
                var statusContent = context.Status.FirstOrDefault(c => c.Id == db_property.StatusId).ContentId;
                var status = context.Translations.FirstOrDefault(c => c.ContentId == statusContent && c.LanguageId == langId).Text;
                var user = User.Identity.GetUserId();
                property.IsFavorite = false;
                if (user != null)
                {
                    var userId = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(user)).Id;
                    var favorite = context.Favorites.FirstOrDefault(c => c.PropertyId == propertyId && c.UserId == userId);
                    if (favorite != null)
                        property.IsFavorite = true;
                }
                property.Id = propertyId;
                property.Description = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == contentDescription).Text;
                property.Address = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == contentAddress).Text;
                property.Price = db_property.Price;
                property.Latitude = location.Latitude;
                property.Longitude = location.Longitude;
                similar.Id = propertyId;
                similar.Price = db_property.Price;
                similar.City = cityText;
                similar.Status = status;
                property.CadastralCode = db_property.CadastralCode;
                property.PropertySize = db_property.PropertySize;
                property.Bedrooms = db_property.Bedrooms;
                property.Bathrooms = db_property.Bathrooms;
                property.Garage = db_property.Garages;
                property.CeilingSize = db_property.CeilingSize;
                var propertyTypeId = db_property.PropertyTypeId;
                var propertyTypeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == propertyTypeId).ContentId;
                var propertyType = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == propertyTypeContent).Text;
                property.PropertyType = propertyType;
                similar.Type = propertyType;
                similar.Bedrooms = property.Bedrooms;
                similar.Size = property.PropertySize;
                var propertyStateId = db_property.StateId;
                var propertyStateContent = context.States.FirstOrDefault(c => c.Id == propertyStateId).ContentId;
                property.PropertyState = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == propertyStateContent).Text;
                var propertyStatusId = db_property.StatusId;
                var propertyStatusContent = context.Status.FirstOrDefault(c => c.Id == propertyStatusId).ContentId;
                property.PropertyStatus = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == propertyStatusContent).Text;
                var contentType = context.Contents.FirstOrDefault(c => c.Id == propertyTypeContent).Type;
                var contentStatus = context.Contents.FirstOrDefault(c => c.Id == propertyStatusContent).Type;
                var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                property.Title = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == titleContent).Text;
            }
            return property;
        }

        private List<SinglePropertyFeature> GetPropertyFeatures(int propertyId, string lang)
        {
            List<SinglePropertyFeature> features = new List<SinglePropertyFeature>();
            using (var context = new DB_RealEstateEntities())
            {
                int langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                var featureIds = context.PropertyFeatures.Where(c => c.PropertyId == propertyId);
                foreach (var i in featureIds)
                {
                    SinglePropertyFeature feature = new SinglePropertyFeature();
                    int featureContent = context.Features.FirstOrDefault(c => c.Id == i.FeatureId).ContentId;
                    feature.Name = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == featureContent).Text;
                    if (i.Availability)
                        feature.Availability = "flaticon-tick";
                    else feature.Availability = "flaticon-close";
                    features.Add(feature);
                }
            }
            return features;
        }

        private List<RecentlyViewed> GetRecentlyViewed(string ip, int pId, string lang)
        {
            List<RecentlyViewed> viewed = new List<RecentlyViewed>();
            using (var context = new DB_RealEstateEntities())
            {
                var db_ip = context.IPs.FirstOrDefault(c => c.Address.Equals(ip)).Id;
                var views = context.PropertyViews.Where(c => c.IpId.Equals(db_ip));
                var ViewsCount = views.Count();
                if (ViewsCount != 1)
                {
                    RecentlyViewed recentlyViewed = new RecentlyViewed();
                    if (ViewsCount < 3)
                    {
                        foreach(var view in views)
                        {
                            var propertyId = view.PropertyId;
                            if(pId != propertyId)
                            {
                                var property = context.Properties.FirstOrDefault(c => c.Id == propertyId);
                                var picture = context.Media.FirstOrDefault(c => c.PropertyId == propertyId).MediaUrl;
                                var TypeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == property.PropertyTypeId).ContentId;
                                var StatusContent = context.Status.FirstOrDefault(c => c.Id == property.StatusId).ContentId;
                                var contentType = context.Contents.FirstOrDefault(c => c.Id == TypeContent).Type;
                                var contentStatus = context.Contents.FirstOrDefault(c => c.Id == StatusContent).Type;
                                var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                                var name = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == titleContent).Text;
                                recentlyViewed.Id = propertyId;
                                recentlyViewed.Area = property.PropertySize;
                                recentlyViewed.Baths = property.Bathrooms;
                                recentlyViewed.Beds = property.Bedrooms;
                                recentlyViewed.Image = picture;
                                recentlyViewed.Name = name;
                                recentlyViewed.Price = property.Price;
                                viewed.Add(recentlyViewed);
                            }
                        }
                    }
                    else
                    {
                        int count = 1;
                        foreach (var view in views)
                        {
                            if(count < 3)
                            {
                                var propertyId = view.PropertyId;
                                if (pId != propertyId)
                                {
                                    var property = context.Properties.FirstOrDefault(c => c.Id == propertyId);
                                    var picture = context.Media.FirstOrDefault(c => c.PropertyId == propertyId).MediaUrl;
                                    var TypeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == property.PropertyTypeId).ContentId;
                                    var StatusContent = context.Status.FirstOrDefault(c => c.Id == property.StatusId).ContentId;
                                    var contentType = context.Contents.FirstOrDefault(c => c.Id == TypeContent).Type;
                                    var contentStatus = context.Contents.FirstOrDefault(c => c.Id == StatusContent).Type;
                                    var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                                    var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                                    var name = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == titleContent).Text;
                                    recentlyViewed.Id = propertyId;
                                    recentlyViewed.Area = property.PropertySize;
                                    recentlyViewed.Baths = property.Bathrooms;
                                    recentlyViewed.Beds = property.Bedrooms;
                                    recentlyViewed.Image = picture;
                                    recentlyViewed.Name = name;
                                    recentlyViewed.Price = property.Price;
                                    viewed.Add(recentlyViewed);
                                    count++;
                                }
                            }
                        }
                    }
                }
            }
            return viewed;
        }

        private List<string> GetStatuses(string lang)
        {
            List<string> statuses = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.Status.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                foreach (var id in contentIds)
                {
                    bool has = context.Translations.Any(c => c.LanguageId == langId && c.ContentId == id);
                    if (has)
                    {
                        var status = context.Translations.Where(c => c.LanguageId == langId && c.ContentId == id).FirstOrDefault();
                        statuses.Add(status.Text);
                    }
                }
            }
            return statuses;
        }

        private List<string> GetTypes(string lang)
        {
            List<string> types = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.PropertyTypes.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                foreach (var id in contentIds)
                {
                    bool has = context.Translations.Any(c => c.LanguageId == langId && c.ContentId == id);
                    if (has)
                    {
                        var translate = context.Translations.Where(c => c.LanguageId == langId && c.ContentId == id).FirstOrDefault();
                        types.Add(translate.Text);
                    }
                }
            }
            return types;
        }

        private List<string> GetAmenities(string lang)
        {
            List<string> amenities = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.Features.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                foreach (var id in contentIds)
                {
                    bool has = context.Translations.Any(c => c.LanguageId == langId && c.ContentId == id);
                    if (has)
                    {
                        var translate = context.Translations.Where(c => c.LanguageId == langId && c.ContentId == id).FirstOrDefault();
                        amenities.Add(translate.Text);
                    }
                }
            }
            return amenities;
        }

        private List<string> GetCities(string lang)
        {
            List<string> cities = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.Cities.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                foreach (var id in contentIds)
                {
                    bool has = context.Translations.Any(c => c.LanguageId == langId && c.ContentId == id);
                    if (has)
                    {
                        var translate = context.Translations.Where(c => c.LanguageId == langId && c.ContentId == id).FirstOrDefault();
                        cities.Add(translate.Text);
                    }
                }
            }
            return cities;
        }
        private List<string> GetState(string lang)
        {
            List<string> states = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.States.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                foreach (var id in contentIds)
                {
                    bool has = context.Translations.Any(c => c.LanguageId == langId && c.ContentId == id);
                    if (has)
                    {
                        var translate = context.Translations.Where(c => c.LanguageId == langId && c.ContentId == id).FirstOrDefault();
                        states.Add(translate.Text);
                    }
                }
            }
            return states;
        }
        private CityModel GetCity(string lang, string city_content)
        {
            CityModel city = new CityModel();
            using (var context = new DB_RealEstateEntities())
            {
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                var content = context.Contents.FirstOrDefault(c => c.Type.Equals(city_content));
                var _city = context.Cities.FirstOrDefault(c => c.ContentId == content.Id);
                city.Properties = context.Locations.Where(c => c.CityId == _city.Id).Count();
                city.Name = context.Translations.FirstOrDefault(c => c.ContentId == content.Id && c.LanguageId == langId).Text;
            }
            return city;
        }
        private List<PropertySmallView> GetVIP(string lang)
        {
            List<PropertySmallView> properties = new List<PropertySmallView>();
            using (var context = new DB_RealEstateEntities())
            {
                var ServiceContent = context.Contents.FirstOrDefault(c => c.Type.Equals("ServiceVIP")).Id;
                var Service = context.Services.FirstOrDefault(c => c.ContentId == ServiceContent).Id;
                var PropertyServices = context.PropertyServices.Where(c => c.ServicesId == Service && c.Active == true);
                foreach (var service in PropertyServices)
                {
                    PropertySmallView property = new PropertySmallView();
                    var PropertyId = service.PropertyId;
                    var DbProperty = context.Properties.FirstOrDefault(c => c.Id == PropertyId);
                    var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                    var PropertyTypeId = DbProperty.PropertyTypeId;
                    bool hasContent = context.PropertyContents.Any(c => c.propertyId == PropertyId);
                    bool hasMedia = context.Media.Any(c => c.PropertyId == PropertyId);
                    var TypeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == PropertyTypeId).ContentId;
                    var PropertyType = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == TypeContent).Text;
                    var PropertyStatusId = DbProperty.StatusId;
                    var StatusContent = context.Status.FirstOrDefault(c => c.Id == PropertyStatusId).ContentId;
                    var PropertyStatus = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == StatusContent).Text;
                    if (hasContent)
                    {
                        var contentType = context.Contents.FirstOrDefault(c => c.Id == TypeContent).Type;
                        var contentStatus = context.Contents.FirstOrDefault(c => c.Id == StatusContent).Type;
                        var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                        var PropertyAddressId = context.Contents.FirstOrDefault(c => c.Type.Equals("ListingAddress" + PropertyId)).Id;
                        property.Name = context.Translations.FirstOrDefault(c => c.ContentId == titleContent && c.LanguageId == langId).Text;
                        property.Address = context.Translations.FirstOrDefault(c => c.ContentId == PropertyAddressId && c.LanguageId == langId).Text;
                    }
                    var AgentId = DbProperty.UserDetailsId;
                    var Agent = context.UserDetails.FirstOrDefault(c => c.Id == AgentId);


                    property.Id = PropertyId;
                    if (hasMedia)
                        property.ImageUrl = context.Media.FirstOrDefault(c => c.PropertyId == PropertyId).MediaUrl;
                    property.Type = PropertyType;
                    property.Status = PropertyStatus;
                    property.Beds = DbProperty.Bedrooms;
                    property.Baths = DbProperty.Bathrooms;
                    property.Area = DbProperty.PropertySize;
                    property.Price = DbProperty.Price;
                    property.AgentName = Agent.Name + " " + Agent.LastName;
                    property.AgentPic = Agent.Picture;
                    property.DatePublished = DbProperty.DatePublished.ToString("MMMM dd");
                    properties.Add(property);
                }

            }
            return properties;
        }

        private List<PropertySmallView> GetSuperVIP(string lang)
        {
            List<PropertySmallView> properties = new List<PropertySmallView>();
            using (var context = new DB_RealEstateEntities())
            {
                var ServiceContent = context.Contents.FirstOrDefault(c => c.Type.Equals("ServiceSuperVIP")).Id;
                var Service = context.Services.FirstOrDefault(c => c.ContentId == ServiceContent).Id;
                var PropertyServices = context.PropertyServices.Where(c => c.ServicesId == Service && c.Active == true);
                foreach (var service in PropertyServices)
                {
                    PropertySmallView property = new PropertySmallView();
                    var PropertyId = service.PropertyId;
                    var DbProperty = context.Properties.FirstOrDefault(c => c.Id == PropertyId);
                    var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                    var PropertyTypeId = DbProperty.PropertyTypeId;
                    bool hasContent = context.PropertyContents.Any(c => c.propertyId == PropertyId);
                    bool hasMedia = context.Media.Any(c => c.PropertyId == PropertyId);
                    var TypeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == PropertyTypeId).ContentId;
                    var PropertyType = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == TypeContent).Text;
                    var PropertyStatusId = DbProperty.StatusId;
                    var StatusContent = context.Status.FirstOrDefault(c => c.Id == PropertyStatusId).ContentId;
                    var PropertyStatus = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == StatusContent).Text;
                    if (hasContent)
                    {
                        var contentType = context.Contents.FirstOrDefault(c => c.Id == TypeContent).Type;
                        var contentStatus = context.Contents.FirstOrDefault(c => c.Id == StatusContent).Type;
                        var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                        var PropertyAddressId = context.Contents.FirstOrDefault(c => c.Type.Equals("ListingAddress" + PropertyId)).Id;
                        property.Name = context.Translations.FirstOrDefault(c => c.ContentId == titleContent && c.LanguageId == langId).Text;
                        property.Address = context.Translations.FirstOrDefault(c => c.ContentId == PropertyAddressId && c.LanguageId == langId).Text;
                    }
                    var AgentId = DbProperty.UserDetailsId;
                    var Agent = context.UserDetails.FirstOrDefault(c => c.Id == AgentId);


                    property.Id = PropertyId;
                    if (hasMedia)
                        property.ImageUrl = context.Media.FirstOrDefault(c => c.PropertyId == PropertyId).MediaUrl;
                    property.Type = PropertyType;
                    property.Status = PropertyStatus;
                    property.Beds = DbProperty.Bedrooms;
                    property.Baths = DbProperty.Bathrooms;
                    property.Area = DbProperty.PropertySize;
                    property.Price = DbProperty.Price;
                    property.AgentName = Agent.Name + " " + Agent.LastName;
                    property.AgentPic = Agent.Picture;
                    property.DatePublished = DbProperty.DatePublished.ToString("MMMM dd");
                    properties.Add(property);
                }

            }
            return properties;
        }

        private List<PropertySmallView> GetVIP_Plus(string lang)
        {
            List<PropertySmallView> properties = new List<PropertySmallView>();
            using (var context = new DB_RealEstateEntities())
            {
                var ServiceContent = context.Contents.FirstOrDefault(c => c.Type.Equals("ServiceVIP+")).Id;
                var Service = context.Services.FirstOrDefault(c => c.ContentId == ServiceContent).Id;
                var PropertyServices = context.PropertyServices.Where(c => c.ServicesId == Service && c.Active == true);
                foreach (var service in PropertyServices)
                {
                    PropertySmallView property = new PropertySmallView();
                    var PropertyId = service.PropertyId;
                    var DbProperty = context.Properties.FirstOrDefault(c => c.Id == PropertyId);
                    var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                    var PropertyTypeId = DbProperty.PropertyTypeId;
                    bool hasContent = context.PropertyContents.Any(c => c.propertyId == PropertyId);
                    bool hasMedia = context.Media.Any(c => c.PropertyId == PropertyId);
                    var TypeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == PropertyTypeId).ContentId;
                    var PropertyType = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == TypeContent).Text;
                    var PropertyStatusId = DbProperty.StatusId;
                    var StatusContent = context.Status.FirstOrDefault(c => c.Id == PropertyStatusId).ContentId;
                    var PropertyStatus = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == StatusContent).Text;
                    if (hasContent)
                    {
                        var contentType = context.Contents.FirstOrDefault(c => c.Id == TypeContent).Type;
                        var contentStatus = context.Contents.FirstOrDefault(c => c.Id == StatusContent).Type;
                        var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                        var PropertyAddressId = context.Contents.FirstOrDefault(c => c.Type.Equals("ListingAddress" + PropertyId)).Id;
                        property.Name = context.Translations.FirstOrDefault(c => c.ContentId == titleContent && c.LanguageId == langId).Text;
                        property.Address = context.Translations.FirstOrDefault(c => c.ContentId == PropertyAddressId && c.LanguageId == langId).Text;
                    }
                    var AgentId = DbProperty.UserDetailsId;
                    var Agent = context.UserDetails.FirstOrDefault(c => c.Id == AgentId);


                    property.Id = PropertyId;
                    if (hasMedia)
                        property.ImageUrl = context.Media.FirstOrDefault(c => c.PropertyId == PropertyId).MediaUrl;
                    property.Type = PropertyType;
                    property.Status = PropertyStatus;
                    property.Beds = DbProperty.Bedrooms;
                    property.Baths = DbProperty.Bathrooms;
                    property.Area = DbProperty.PropertySize;
                    property.Price = DbProperty.Price;
                    property.AgentName = Agent.Name + " " + Agent.LastName;
                    property.AgentPic = Agent.Picture;
                    property.DatePublished = DbProperty.DatePublished.ToString("MMMM dd");
                    properties.Add(property);
                }

            }
            return properties;
        }

        private List<PropertySmallView> GetUrgently(string lang)
        {
            List<PropertySmallView> properties = new List<PropertySmallView>();
            using (var context = new DB_RealEstateEntities())
            {
                var ServiceContent = context.Contents.FirstOrDefault(c => c.Type.Equals("ServiceUrgently")).Id;
                var Service = context.Services.FirstOrDefault(c => c.ContentId == ServiceContent).Id;
                var PropertyServices = context.PropertyServices.Where(c => c.ServicesId == Service && c.Active == true);
                foreach (var service in PropertyServices)
                {
                    PropertySmallView property = new PropertySmallView();
                    var PropertyId = service.PropertyId;
                    var DbProperty = context.Properties.FirstOrDefault(c => c.Id == PropertyId);
                    var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                    var PropertyTypeId = DbProperty.PropertyTypeId;
                    bool hasContent = context.PropertyContents.Any(c => c.propertyId == PropertyId);
                    bool hasMedia = context.Media.Any(c => c.PropertyId == PropertyId);
                    var TypeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == PropertyTypeId).ContentId;
                    var PropertyType = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == TypeContent).Text;
                    var PropertyStatusId = DbProperty.StatusId;
                    var StatusContent = context.Status.FirstOrDefault(c => c.Id == PropertyStatusId).ContentId;
                    var PropertyStatus = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == StatusContent).Text;
                    if (hasContent)
                    {
                        var contentType = context.Contents.FirstOrDefault(c => c.Id == TypeContent).Type;
                        var contentStatus = context.Contents.FirstOrDefault(c => c.Id == StatusContent).Type;
                        var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                        var PropertyAddressId = context.Contents.FirstOrDefault(c => c.Type.Equals("ListingAddress" + PropertyId)).Id;
                        property.Name = context.Translations.FirstOrDefault(c => c.ContentId == titleContent && c.LanguageId == langId).Text;
                        property.Address = context.Translations.FirstOrDefault(c => c.ContentId == PropertyAddressId && c.LanguageId == langId).Text;
                    }
                    var AgentId = DbProperty.UserDetailsId;
                    var Agent = context.UserDetails.FirstOrDefault(c => c.Id == AgentId);


                    property.Id = PropertyId;
                    if (hasMedia)
                        property.ImageUrl = context.Media.FirstOrDefault(c => c.PropertyId == PropertyId).MediaUrl;
                    property.Type = PropertyType;
                    property.Status = PropertyStatus;
                    property.Beds = DbProperty.Bedrooms;
                    property.Baths = DbProperty.Bathrooms;
                    property.Area = DbProperty.PropertySize;
                    property.Price = DbProperty.Price;
                    property.AgentName = Agent.Name + " " + Agent.LastName;
                    property.AgentPic = Agent.Picture;
                    property.DatePublished = DbProperty.DatePublished.ToString("MMMM dd");
                    properties.Add(property);
                }

            }
            return properties;
        }

        private string getIP()
        {
            String address = "";
            WebRequest request = WebRequest.Create("http://checkip.dyndns.org/");
            using (WebResponse response = request.GetResponse())
            using (StreamReader stream = new StreamReader(response.GetResponseStream()))
            {
                address = stream.ReadToEnd();
            }

            int first = address.IndexOf("Address: ") + 9;
            int last = address.LastIndexOf("</body>");
            address = address.Substring(first, last - first);

            return address;
        }

        private void AddViews(int propertyId, string thisIP)
        {
            try
            {
                using (var scope = new System.Transactions.TransactionScope())
                {
                    using(var context = new DB_RealEstateEntities())
                    {
                        
                        var DB_IP = context.IPs.Any(c => c.Address.Equals(thisIP));
                        var ip = new IP();
                        if (!DB_IP)
                        {
                            ip.Address = thisIP;
                            context.IPs.Add(ip);
                        }
                        else
                            ip = context.IPs.FirstOrDefault(c => c.Address.Equals(thisIP));
                        var previvous = context.PropertyViews.Any(c => c.IpId == ip.Id && c.PropertyId == propertyId);
                        if (!previvous)
                        {
                            PropertyView view = new PropertyView();
                            view.IpId = ip.Id;
                            view.PropertyId = propertyId;
                            context.PropertyViews.Add(view);
                            context.SaveChanges();
                        }
                    }
                    scope.Complete();
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        public String AddReview(ReviewModel review)
        {
            try
            {
                using (var context = new DB_RealEstateEntities())
                {
                    var userId = User.Identity.GetUserId();
                    var user = context.UserDetails.FirstOrDefault(c => c.UserId.Equals(userId)).Id;
                    Review newReview = new Review();
                    int id = review.Id;
                    newReview.PropertyId = id;
                    newReview.ReviewDate = DateTime.Now;
                    newReview.Stars = review.Rating;
                    newReview.Comment = review.Comment;
                    newReview.UserDetailsId = user;
                    context.Reviews.Add(newReview);

                    //Add Activity
                    var property = context.Properties.FirstOrDefault(c => c.Id == id);
                    var activity = new UserActivity();
                    activity.ActivityId = context.Activities.FirstOrDefault(c => c.Name.Equals("Review")).Id;
                    activity.PropertyId = id;
                    activity.VisitorId = user;
                    activity.UserId = property.UserDetailsId;
                    new DashboardController().SaveActivity(activity);

                    context.SaveChanges();
                    return "Review Added Successfully";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return "Something went wrong, please try again later";
            }
        }

        private List<PropertySmallView> GetsimilarProperties(string lang)
        {
            //by location
            var Properties = SimilarByLocation();
            //by type
            if (Properties.Count > 4)
                Properties = SimilarByType(Properties);
            //by status
            if (Properties.Count > 4)
                Properties = SimilarByStatus(Properties);
            //by price
            if (Properties.Count > 4)
                Properties = SimilarByPrice(Properties);
            //by property size
            if (Properties.Count > 4)
                Properties = SimilarBySize(Properties);
            //by bedroom
            if (Properties.Count > 4)
                Properties = SimilarByRooms(Properties);

            List<PropertySmallView> properties = new List<PropertySmallView>();
            using (var context = new DB_RealEstateEntities())
            {
                foreach (var p in Properties)
                {
                    PropertySmallView property = new PropertySmallView();
                    var PropertyId = p.Id;
                    var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                    bool hasContent = context.PropertyContents.Any(c => c.propertyId == PropertyId);
                    bool hasMedia = context.Media.Any(c => c.PropertyId == PropertyId);
                    var TypeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == p.PropertyTypeId).ContentId;
                    var PropertyStatusId = p.StatusId;
                    var StatusContent = context.Status.FirstOrDefault(c => c.Id == PropertyStatusId).ContentId;
                    var PropertyStatus = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == StatusContent).Text;
                    if (hasContent)
                    {
                        var contentType = context.Contents.FirstOrDefault(c => c.Id == TypeContent).Type;
                        var contentStatus = context.Contents.FirstOrDefault(c => c.Id == StatusContent).Type;
                        var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                        var PropertyAddressId = context.Contents.FirstOrDefault(c => c.Type.Equals("ListingAddress" + PropertyId)).Id;
                        property.Name = context.Translations.FirstOrDefault(c => c.ContentId == titleContent && c.LanguageId == langId).Text;
                        property.Address = context.Translations.FirstOrDefault(c => c.ContentId == PropertyAddressId && c.LanguageId == langId).Text;
                    }
                    var AgentId = p.UserDetailsId;
                    var Agent = context.UserDetails.FirstOrDefault(c => c.Id == AgentId);

                    property.Id = PropertyId;
                    if (hasMedia)
                        property.ImageUrl = context.Media.FirstOrDefault(c => c.PropertyId == PropertyId).MediaUrl;
                    property.Type = similar.Type;
                    property.Status = PropertyStatus;
                    property.Beds = p.Bedrooms;
                    property.Baths = p.Bathrooms;
                    property.Area = p.PropertySize;
                    property.Price = p.Price;
                    property.AgentName = Agent.Name + " " + Agent.LastName;
                    property.AgentPic = Agent.Picture;
                    property.DatePublished = p.DatePublished.ToString("MMMM dd");
                    properties.Add(property);
                }
            }
            return properties;
        }

        private List<Property> SimilarByLocation()
        {
            string city = similar.City;
            List<Property> properties = new List<Property>(); 
            using(var context = new DB_RealEstateEntities())
            {
                var cityContentId = context.Translations.FirstOrDefault(c=>c.Text.Equals(city)).ContentId;
                var cityId = context.Cities.FirstOrDefault(c => c.ContentId == cityContentId).Id;
                var locations = context.Locations.Where(c => c.CityId == cityId);
                foreach(var l in locations)
                {
                    var property = context.Properties.FirstOrDefault(c => c.LocationId == l.Id);
                    if(property.Id != similar.Id)
                        properties.Add(property);
                }
            }
            return properties;
        }

        private List<Property> SimilarByType(List<Property> _properties)
        {
            string type = similar.Type;
            List<Property> properties = new List<Property>();
            using(var context = new DB_RealEstateEntities())
            {
                var typeContentId = context.Translations.FirstOrDefault(c => c.Text.Equals(type)).ContentId;
                var typeId = context.PropertyTypes.FirstOrDefault(c => c.ContentId == typeContentId).Id;
                foreach(var p in _properties)
                {
                    if (p.PropertyTypeId == typeId)
                        properties.Add(p);
                }
            }
            return properties;
        }

        private List<Property> SimilarByStatus(List<Property> _properties)
        {
            string status = "";
            if (similar.Status.Equals("იყიდება") || similar.Status.Equals("продается"))
                status = "Buy";
            else if (similar.Status.Equals("ქირავდება") || similar.Status.Equals("в аренду"))
            {
                status = "Rent";
            }
            else status = "Rent Daily";
            List<Property> properties = new List<Property>();
            using(var context = new DB_RealEstateEntities())
            {
                var statusContentId = 0;
                switch (status)
                {
                    case "Rent":
                        statusContentId = context.Contents.FirstOrDefault(c => c.Type.Equals("PropertyStatus_Rent")).Id;
                        break;
                    case "Buy":
                        statusContentId = context.Contents.FirstOrDefault(c => c.Type.Equals("PropertyStatus_Buy")).Id;
                        break;
                    case "Rent Daily":
                        statusContentId = context.Contents.FirstOrDefault(c => c.Type.Equals("PropertyStatus_DailyRent")).Id;
                        break;
                }
                var statusId = context.Status.FirstOrDefault(c => c.ContentId == statusContentId).Id;
                foreach (var p in _properties)
                {
                    if (p.StatusId == statusId)
                        properties.Add(p);
                }
            }
            return properties;
        }

        private List<Property> SimilarByPrice(List<Property> _properties)
        {
            decimal price = similar.Price;
            List<Property> properties = new List<Property>();
            foreach (var p in _properties)
            {
                if (p.Price > price - 5000 && p.Price < price + 5000)
                    properties.Add(p);
            }
            return properties;
        }

        private List<Property> SimilarBySize(List<Property> _properties)
        {
            decimal size = similar.Size;
            List<Property> properties = new List<Property>();
            foreach (var p in _properties)
            {
                if (p.PropertySize > size - 10 && p.PropertySize < size + 10)
                    properties.Add(p);
            }
            return properties;
        }

        private List<Property> SimilarByRooms(List<Property> _properties)
        {
            int rooms = similar.Bedrooms;
            List<Property> properties = new List<Property>();
            foreach (var p in _properties)
            {
                if (p.Bedrooms == rooms)
                    properties.Add(p);
            }
            return properties;
        }
        private IEnumerable<PropertySmallView> SearchedResult(string lang, SearchModel searchModel)
        {
            List<PropertySmallView> properties = new List<PropertySmallView>();
            using (var context = new DB_RealEstateEntities())
            {
                var statusTranslate = context.Translations.FirstOrDefault(c => c.Text.Equals(searchModel.status)).ContentId;
                var statusId = context.Status.FirstOrDefault(c => c.ContentId == statusTranslate).Id;
                var property = from status in context.Status
                            join _property in context.Properties on status.Id equals _property.StatusId
                            where _property.Price > searchModel.minPrice && _property.Price < searchModel.maxPrice &&
                            status.Id == statusId
                            select _property;
                if (searchModel.location != null)
                    property = from content in context.Contents
                               join pc in context.PropertyContents on content.Id equals pc.contentId
                               join p in property on pc.propertyId equals p.Id
                               join translation in context.Translations on content.Id equals translation.ContentId
                               where translation.Text.Equals(searchModel.location)
                               select p;
                if (searchModel.keyword != null)
                    property = from content in context.Contents
                               join pc in context.PropertyContents on content.Id equals pc.contentId
                               join p in property on pc.propertyId equals p.Id
                               join translation in context.Translations on content.Id equals translation.ContentId
                               join l in context.Languages on translation.LanguageId equals l.Id
                               where translation.Text.Equals(searchModel.keyword) && l.Abbr.Equals(lang)
                               select p;
                if(!searchModel.city.Equals("Built-up Area") && !searchModel.city.Equals("ქალაქი") && !searchModel.city.Equals("город"))
                    property = from city in context.Cities
                               join content in context.Contents on city.ContentId equals content.Id
                               join location in context.Locations on city.Id equals location.CityId
                               join p in property on location.Id equals p.LocationId
                               join translation in context.Translations on content.Id equals translation.ContentId
                               where translation.Text.Equals(searchModel.city)
                               select p;
                if (!searchModel.state.Equals("State") && !searchModel.state.Equals("მდგომარეობა") && !searchModel.state.Equals("Состояние"))
                    property = from state in context.States
                               join content in context.Contents on state.ContentId equals content.Id
                               join p in property on state.Id equals p.StateId
                               join translation in context.Translations on content.Id equals translation.ContentId
                               where translation.Text.Equals(searchModel.state)
                               select p;
                if (!searchModel.bedrooms.Equals("Bedrooms") && !searchModel.bedrooms.Equals("Спальни") && !searchModel.bedrooms.Equals("საძინებელი"))
                {
                    int beds = int.Parse(searchModel.bedrooms);
                    property = from p in property
                               where p.Bedrooms == beds
                               select p;
                }                    
                if (!searchModel.bathrooms.Equals("Bathrooms") && !searchModel.bathrooms.Equals("სველი წერტილი") && !searchModel.bathrooms.Equals("Ванные комнаты"))
                {
                    int baths = int.Parse(searchModel.bathrooms);
                    property = from p in property
                               where p.Bathrooms == baths
                               select p;
                }
                foreach (var p in property)
                {
                    PropertySmallView thisProperty = new PropertySmallView();
                    var PropertyId = p.Id;
                    var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                    var PropertyTypeId = p.PropertyTypeId;
                    bool hasContent = context.PropertyContents.Any(c => c.propertyId == PropertyId);
                    bool hasMedia = context.Media.Any(c => c.PropertyId == PropertyId);
                    var TypeContent = context.PropertyTypes.FirstOrDefault(c => c.Id == PropertyTypeId).ContentId;
                    var StatusContent = context.Status.FirstOrDefault(c => c.Id == p.StatusId).ContentId;
                    var PropertyType = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == TypeContent).Text;
                    if (hasContent)
                    {
                        var contentType = context.Contents.FirstOrDefault(c => c.Id == TypeContent).Type;
                        var contentStatus = context.Contents.FirstOrDefault(c => c.Id == StatusContent).Type;
                        var titleContent = context.Contents.FirstOrDefault(c => c.Type.Contains(contentType) && c.Type.Contains(contentStatus)).Id;
                        var PropertyAddressId = context.Contents.FirstOrDefault(c => c.Type.Equals("ListingAddress" + PropertyId)).Id;
                        thisProperty.Name = context.Translations.FirstOrDefault(c => c.ContentId == titleContent && c.LanguageId == langId).Text;
                        thisProperty.Address = context.Translations.FirstOrDefault(c => c.ContentId == PropertyAddressId && c.LanguageId == langId).Text;
                    }
                    var AgentId = p.UserDetailsId;
                    var Agent = context.UserDetails.FirstOrDefault(c => c.Id == AgentId);
                    thisProperty.Id = PropertyId;
                    if (hasMedia)
                        thisProperty.ImageUrl = context.Media.FirstOrDefault(c => c.PropertyId == PropertyId).MediaUrl;
                    thisProperty.Type = PropertyType;
                    thisProperty.Status = searchModel.status;
                    thisProperty.Beds = p.Bedrooms;
                    thisProperty.Baths = p.Bathrooms;
                    thisProperty.Area = p.PropertySize;
                    thisProperty.Price = p.Price;
                    thisProperty.AgentName = Agent.Name + " " + Agent.LastName;
                    thisProperty.AgentPic = Agent.Picture;
                    thisProperty.DatePublished = p.DatePublished.ToString("MMMM dd");
                    properties.Add(thisProperty);
                }
            }
            var page = 1;
            if (searchModel.page > 1)
                page = searchModel.page;
            int records = properties.Count;
            int recordsPerPage = 6;
            SearchedPage = (records + recordsPerPage - 1) / recordsPerPage;
            return properties.AsEnumerable().ToPagedList(page, recordsPerPage);
        }
        private Agent GetAgent(int property)
        {
            Agent agent = new Agent();
            using (var context = new DB_RealEstateEntities())
            {
                var agentId = context.Properties.FirstOrDefault(c => c.Id == property).UserDetailsId;
                var user = context.UserDetails.FirstOrDefault(c => c.Id == agentId);
                agent.Email = context.AspNetUsers.FirstOrDefault(c => c.Id.Equals(user.UserId)).Email;
                agent.Phone = user.Phone;
                agent.Name = user.Name + " " + user.LastName;
                agent.Image = user.Picture;
            }
            return agent;
        }

        public HeaderModel TranslateHeader(string lang)
        {
            HeaderModel header = new HeaderModel();
            header.Language = TranslateContent("Header_Language", lang);
            header.Login = TranslateContent("Header_Login", lang);
            header.Register = TranslateContent("Header_Register", lang);
            return header;
        }

        private HomePageModel TranslateHome(string lang)
        {
            HomePageModel search = new HomePageModel();
            search.Heading = TranslateContent("Home_Heading", lang);
            search.Keyword = TranslateContent("Search_Keyword", lang);
            search.Location = TranslateContent("Search_Location", lang);
            search.Type = TranslateContent("Search_type", lang);
            search.Price = TranslateContent("Search_Price", lang);
            search.Advanced = TranslateContent("Search_Advanced", lang);
            search.Search = TranslateContent("Search_Search", lang);
            search.Amenities = TranslateContent("Search_Amenities", lang);
            search.Bathrooms = TranslateContent("Search_Bath", lang);
            search.Bedrooms = TranslateContent("Search_Bed", lang);
            search.State = TranslateContent("Search_State", lang);
            search.Area = TranslateContent("Search_Area", lang);
            search.Hide = TranslateContent("Search_hide", lang);
            return search;
        }

        public string TranslateContent(string keyword, string lang)
        {
            string translation = "";
            using(var context = new DB_RealEstateEntities())
            {
                int langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
                int contentId = context.Contents.FirstOrDefault(c => c.Type.Equals(keyword)).Id;
                translation = context.Translations.FirstOrDefault(c => c.LanguageId == langId && c.ContentId == contentId).Text;
            }
            return translation;
        }
    }
}