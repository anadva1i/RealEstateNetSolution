using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RealEstateNet.Models;
using System;
using System.Activities.Debugger;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Drawing;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Reflection;
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
        // GET: Dashboard
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AddNewProperty(string lang)
        {
            if (lang == null) 
                lang = "EN";
            language = lang;
            dynamic model = new ExpandoObject();
            model.TypeModels = GetPropertyType(lang);
            model.StatusModels = GetPropertyStatus(lang);
            model.StateModels = GetPropertyState(lang);
            model.PageModel = addNewPropertyPageModel();
            model.Countries = GetCountries(lang);
            model.Cities = GetCities(lang);
            model.FeaturesModel = getFeatures(lang);
            return View(model);
        }

        public ActionResult Message(string lang)
        {
            if (lang == null)
                lang = "EN";
            language = lang;
            return View();
        }

        public ActionResult Favorites(string lang)
        {
            if (lang == null)
                lang = "EN";
            language = lang;
            return View();
        }

        public ActionResult Packages(string lang)
        {
            if (lang == null)
                lang = "EN";
            language = lang;
            return View();
        }

        public ActionResult My_Profile(string lang)
        {
            if (lang == null)
                lang = "EN";
            language = lang;
            dynamic model = new ExpandoObject();
            model.Role = GetUserRole();
            return View(model);
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

        private List<string> GetCountries(string lang)
        {
            List<string> countries = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.Countries.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
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
                        var city = context.Translations.Where(c => c.LanguageId == langId && c.ContentId == id).FirstOrDefault();
                        cities.Add(city.Text);
                    }
                }
            }
            return cities;
        }

        private List<string> GetPropertyType(string lang)
        {
            List<string> propertyType = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.PropertyTypes.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
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

        private List<string> GetPropertyStatus(string lang)
        {
            List<string> propertyStatus = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.Status.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
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
        private List<string> GetPropertyState(string lang)
        {
            List<string> propertyState = new List<string>();
            using (var context = new DB_RealEstateEntities())
            {
                var contentIds = context.States.Select(c => c.ContentId);
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
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

        private FeaturesModel getFeatures(string lang)
        {
            FeaturesModel featuresModel = new FeaturesModel();
            using (var context = new DB_RealEstateEntities())
            {
                var langId = context.Languages.FirstOrDefault(c => c.Abbr.Equals(lang)).Id;
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

        //We have left client's id
        [HttpPost]
        public ActionResult CreateListing(CreateListingModel model)
        {            
            try
            {
                using(var scope = new System.Transactions.TransactionScope())
                {
                    using (var context = new DB_RealEstateEntities())
                    {
                        //Add Property
                        Property property = new Property();
                        var contentType = context.Translations.FirstOrDefault(c => c.Text.Equals(model.Type)).ContentId;
                        var propertyTypeId = context.PropertyTypes.FirstOrDefault(c => c.ContentId == contentType).Id;
                        var statusType = context.Translations.FirstOrDefault(c => c.Text.Equals(model.Status)).ContentId;
                        var statusId = context.Status.FirstOrDefault(c => c.ContentId == statusType).Id;
                        var propertyState = context.Translations.FirstOrDefault(c => c.Text.Equals(model.State)).ContentId;
                        var stateId = context.States.FirstOrDefault(c => c.ContentId == propertyState).Id;
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
                        property.UserDetailsId = 1;
                        property.Active = true;
                        property.DatePublished = DateTime.Now;
                        property.WholePrice = model.Price;
                        context.Properties.Add(property);
                        context.SaveChanges();

                        //Add Contents
                        Content contentTitle = new Content();
                        contentTitle.Type = "ListingTitle"+property.Id;
                        context.Contents.Add(contentTitle);

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

                        Translation contentTitleGE = new Translation();
                        contentTitleGE.ContentId = contentTitle.Id;
                        contentTitleGE.LanguageId = geoId;
                        contentTitleGE.Text = model.PropertyTitleGE;
                        context.Translations.Add(contentTitleGE);

                        Translation contentTitleEN = new Translation();
                        contentTitleEN.ContentId = contentTitle.Id;
                        contentTitleEN.LanguageId = engId;
                        if (model.PropertyTitleEN != null)
                            contentTitleEN.Text = model.PropertyTitleEN;
                        else
                            contentTitleEN.Text = model.PropertyTitleGE;
                        context.Translations.Add(contentTitleEN);

                        Translation contentTitleRU = new Translation();
                        contentTitleRU.ContentId = contentTitle.Id;
                        contentTitleRU.LanguageId = rusId;
                        if (model.PropertyTitleRU != null)
                            contentTitleRU.Text = model.PropertyTitleRU;
                        else
                            contentTitleRU.Text = model.PropertyTitleGE;
                        context.Translations.Add(contentTitleRU);

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
                        PropertyContent propertyTitle = new PropertyContent();
                        propertyTitle.contentId = contentTitle.Id;
                        propertyTitle.propertyId = property.Id;
                        context.PropertyContents.Add(propertyTitle);

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
                        amenityAirConditioning.Availability = model.AirConditioning;
                        context.PropertyFeatures.Add(amenityAirConditioning);

                        var content_Yard = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Yard")).Id;
                        var feature_Yard = context.Features.FirstOrDefault(c => c.ContentId == content_Yard).Id;
                        PropertyFeature amenityYard = new PropertyFeature();
                        amenityYard.PropertyId = property.Id;
                        amenityYard.FeatureId = feature_Yard;
                        amenityYard.Availability = model.Yard;
                        context.PropertyFeatures.Add(amenityYard);

                        var content_SwimmingPool = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_SwimmingPool")).Id;
                        var feature_SwimmingPool = context.Features.FirstOrDefault(c => c.ContentId == content_SwimmingPool).Id;
                        PropertyFeature amenitySwimmingPool = new PropertyFeature();
                        amenitySwimmingPool.PropertyId = property.Id;
                        amenitySwimmingPool.FeatureId = feature_SwimmingPool;
                        amenitySwimmingPool.Availability = model.SwimmingPool;
                        context.PropertyFeatures.Add(amenitySwimmingPool);

                        var content_Tv = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_TV")).Id;
                        var feature_Tv = context.Features.FirstOrDefault(c => c.ContentId == content_Tv).Id;
                        PropertyFeature amenityTv = new PropertyFeature();
                        amenityTv.PropertyId = property.Id;
                        amenityTv.FeatureId = feature_Tv;
                        amenityTv.Availability = model.Tv;
                        context.PropertyFeatures.Add(amenityTv);

                        var content_Fireplace = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Fireplace")).Id;
                        var feature_Fireplace = context.Features.FirstOrDefault(c => c.ContentId == content_Fireplace).Id;
                        PropertyFeature amenityFireplace = new PropertyFeature();
                        amenityFireplace.PropertyId = property.Id;
                        amenityFireplace.FeatureId = feature_Fireplace;
                        amenityFireplace.Availability = model.Fireplace;
                        context.PropertyFeatures.Add(amenityFireplace);

                        var content_Refrigirator = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Refrigirator")).Id;
                        var feature_Refrigirator = context.Features.FirstOrDefault(c => c.ContentId == content_Refrigirator).Id;
                        PropertyFeature amenityRefrigirator = new PropertyFeature();
                        amenityRefrigirator.PropertyId = property.Id;
                        amenityRefrigirator.FeatureId = feature_Refrigirator;
                        amenityRefrigirator.Availability = model.Refrigirator;
                        context.PropertyFeatures.Add(amenityRefrigirator);

                        var content_Wifi = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Wifi")).Id;
                        var feature_Wifi = context.Features.FirstOrDefault(c => c.ContentId == content_Wifi).Id;
                        PropertyFeature amenityWifi = new PropertyFeature();
                        amenityWifi.PropertyId = property.Id;
                        amenityWifi.FeatureId = feature_Wifi;
                        amenityWifi.Availability = model.Wifi;
                        context.PropertyFeatures.Add(amenityWifi);

                        var content_Sauna = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_Sauna")).Id;
                        var feature_Sauna = context.Features.FirstOrDefault(c => c.ContentId == content_Sauna).Id;
                        PropertyFeature amenitySauna = new PropertyFeature();
                        amenitySauna.PropertyId = property.Id;
                        amenitySauna.FeatureId = feature_Sauna;
                        amenitySauna.Availability = model.Sauna;
                        context.PropertyFeatures.Add(amenitySauna);

                        var content_WindowCoverings = context.Contents.FirstOrDefault(c => c.Type.Equals("Feature_WindowCoverings")).Id;
                        var feature_WindowCoverings = context.Features.FirstOrDefault(c => c.ContentId == content_WindowCoverings).Id;
                        PropertyFeature amenityWindowCoverings = new PropertyFeature();
                        amenityWindowCoverings.PropertyId = property.Id;
                        amenityWindowCoverings.FeatureId = feature_WindowCoverings;
                        amenityWindowCoverings.Availability = model.WindowCoverings;
                        context.PropertyFeatures.Add(amenityWindowCoverings);
                        context.SaveChanges();

                        //Add Media
                        saveMedia(model.media, property.Id.ToString());

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


    }
}