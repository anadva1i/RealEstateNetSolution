using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateNet.Models
{
    public class HomePageModel
    {
        public string Heading { get; set; }
        public string Keyword { get; set; }
        public string Type { get; set; }
        public string Location { get; set; }
        public string Price { get; set; }
        public string Advanced { get; set; }
        public string Search { get; set; }
        public string Amenities { get; set; }
        public string Bathrooms { get; set; }
        public string Bedrooms { get; set; }
        public string State { get; set; }
        public string Area { get; set; }
        public string Hide { get; set; }

    }

    public class PropertyPageModel
    {
        public string Property_SqMtr { get; set; }
        public string Property_Description { get; set; }
        public string Property_Details { get; set; }
        public string Cadastral_Code { get; set; }
        public string Property_Status { get; set; }
        public string Property_Garage { get; set; }
        public string Property_CeilingSize { get; set; }
        public string Property_ListedBy { get; set; }
        public string Property_subject { get; set; }
        public string Property_Email { get; set; }
        public string Property_Body { get; set; }
        public string Property_SendEmail { get; set; }
        public string Property_Features { get; set; }
        public string Property_PaymentCalculator { get; set; }
        public string Property_Reviews { get; set; }
        public string Property_WriteReview { get; set; }
        public string Property_Similar { get; set; }
        public string Property_RecentlyViewed { get; set; }
        public string Search_Bed { get; set; }
        public string Search_Bath { get; set; }
        public string Search_Price { get; set; }
        public string Search_Area { get; set; }
        public string Search_State { get; set; }
        public string Search_type { get; set; }
        public string Search_Location { get; set; }
    }

    public class HeaderModel
    {
        public string Language { get; set; }
        public string Login { get; set; }
        public string Register { get; set; }
    }
}