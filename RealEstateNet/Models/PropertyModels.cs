using System;
using System.Activities;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography.Xml;
using System.Web;

namespace RealEstateNet.Models
{
    public class AddNewPropertyPageModel
    {
        public string AddNewProperty_Heading { get; set; }
        public string AddNewProperty_Description { get; set; }
        public string CreateListing { get; set; }
        public string PropertyTitleEN { get; set; }
        public string PropertyTitleGE { get; set; }
        public string PropertyTitleRU { get; set; }
        public string PropertyDescriptionRU { get; set; }
        public string PropertyDescriptionEN { get; set; }
        public string PropertyDescriptionGE { get; set; }
        public string PropertyType { get; set; }
        public string PropertyStatus { get; set; }
        public string PropertyPrice { get; set; }
        public string PropertyArea { get; set; }
        public string PropertyRooms { get; set; }
        public string Location { get; set; }
        public string AddressEN { get; set; }
        public string AddressGE { get; set; }
        public string AddressRU { get; set; }
        public string Regions { get; set; }
        public string City { get; set; }
        public string Zip { get; set; }
        public string Country { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string DetailedInformation { get; set; }
        public string PropertyId { get; set; }
        public string Bedrooms { get; set; }
        public string Bathrooms { get; set; }
        public string Garages { get; set; }
        public string CeilingSize { get; set; }
        public string State { get; set; }
        public string Amenities { get; set; }
        public string PropertyMedia { get; set; }
        public string Attachments { get; set; }
        public string SelectAttachments { get; set; }
        public string Next { get; set; }
    }

    public class FeaturesModel 
    {
        public string Feature_AirConditioning { get; set; }
        public string Feature_Yard { get; set; }
        public string Feature_SwimmingPool { get; set; }
        public string Feature_Fireplace { get; set; }
        public string Feature_TV { get; set; }
        public string Feature_Refrigirator { get; set; }
        public string Feature_Wifi { get; set; }
        public string Feature_Sauna { get; set; }
        public string Feature_WindowCoverings { get; set; }
    }

    public class CreateListingModel
    {
        public int Id { get; set; }
        public string PropertyTitleGE { get; set; }
        public string PropertyTitleEN { get; set; }
        public string PropertyTitleRU { get; set; }
        public string DescriptionGE { get; set; }
        public string DescriptionEN { get; set; }
        public string DescriptionRU { get; set; }
        public string Type { get; set; }
        public string Status { get; set; }
        public decimal Price { get; set; }
        public decimal Area { get; set; }
        public int Rooms { get; set; }
        public string AddressEN { get; set; }
        public string AddressGE { get; set; }
        public string AddressRU { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public int Zip { get; set; }
        public string CadastralCode { get; set; }
        public int Bedrooms { get; set; }
        public int Bathrooms { get; set; }
        public int Garages { get; set; }
        public int CeilingSize { get; set; }
        public string State { get; set; }
        public string AirConditioning { get; set; }
        public string Yard { get; set; }
        public string SwimmingPool { get; set; }
        public string Tv { get; set; }
        public string Fireplace { get; set; }
        public string Refrigirator { get; set; }
        public string Wifi { get; set; }
        public string Sauna { get; set; }
        public string WindowCoverings { get; set; }
        public string media { get; set; }
        public List<string> pictures { get; set; }
    }

    public class Picture
    {
        public int id { get; set; }
        public string pic { get; set; }
    }

    public class SinglePropertyView
    {
        public int Id { get; set; }
        public bool IsFavorite { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Address { get; set; }
        public decimal Price { get; set; }
        public string PropertyType { get; set; }
        public string CadastralCode { get; set; }
        public decimal PropertySize { get; set; }
        public string PropertyState { get; set; }
        public int Bedrooms { get; set; }
        public int? Bathrooms { get; set; }
        public int? Garage { get; set; }
        public decimal CeilingSize { get; set; }
        public string PropertyStatus { get; set; }
        public decimal? Latitude { get; set; }
        public decimal? Longitude { get; set; }
    }

    public class SinglePropertyFeature
    {
        public string Availability { get; set; }
        public string Name { get; set; }
    }

    public class SinglePropertyTranslation
    {
        public string Description { get; set; }
        public string ShowMore { get; set; }
        public string PropertyDetails { get; set; }
        public string Features { get; set; }
        public string Location { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public string Reviews { get; set; }
    }

    public class PropertySmallView
    {
        public int Id { get; set; }
        public string ImageUrl { get; set; }
        public decimal Price { get; set; }
        public string Type { get; set; }
        public string Status { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public int Beds { get; set; }
        public int? Baths { get; set; }
        public decimal Area { get; set; }
        public string AgentName { get; set; }
        public string AgentPic { get; set; }
        public string DatePublished { get; set; }
    }

    public class CityModel
    {
        public string Name { get; set; }
        public int Properties { get; set; }
    }

    public class SearchModel
    {
        public int page { get; set; }
        public string status { get; set; }
        public string keyword { get; set; }
        public string location { get; set; }
        public int minPrice { get; set; }
        public int maxPrice { get; set; }
        public string bathrooms { get; set; }
        public string bedrooms { get; set; }
        public string state { get; set; }
        public string city { get; set; }
        public string Yard { get; set; }
        public string SwimmingPool { get; set; }
        public string Fireplace { get; set; }
        public string TV { get; set; }
        public string Refrigirator { get; set; }
        public string type { get; set; }
    }
    public class Agent
    {
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Image { get; set; }
    }

    public class Similars
    {
        public int Id { get; set; }
        public string Type { get; set; }
        public string City { get; set; }
        public decimal Price { get; set; }
        public string Status { get; set; }
        public decimal Size { get; set; }
        public int Bedrooms { get; set; }

    }

    public class RecentlyViewed
    {
        public int Id { get; set; }
        public string Image { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Beds { get; set; }
        public int? Baths { get; set; }
        public decimal Area { get; set; }
    }

    public class ReviewModel
    {
        public int Id { get; set; }
        public int Rating { get; set; }
        public string Comment { get; set; }
    }

    public class TotalReviews
    {
        public int Total { get; set; }
        public int Stars { get; set; } 
    }

    public class ExistedReview
    {
        public string Picture { get; set; }
        public string Name { get; set; }
        public int Stars { get; set; }
        public string ReviewDate { get; set; }
        public string Comment { get; set; }
    }

    public class FavoriteView
    {
        public int Id { get; set; }
        public string Status { get; set; }
        public string ImageUrl { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public decimal Price { get; set; }
    }

    public class MyPropertiesView
    {
        public int Id { get; set; }
        public string Status { get; set; }
        public string ImageUrl { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public decimal Price { get; set; }
        public string DatePublished { get; set; }
        public string CurrentStatus { get; set; }
        public int Views { get; set; }
    }

    public class PropertyServices
    {
        public string SuperVip { get; set; }
        public string VipPlus { get; set; }
        public string Vip { get; set; }
        public string Update { get; set; }
        public string Border { get; set; }
    }
}