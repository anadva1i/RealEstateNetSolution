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

    public class HeaderModel
    {
        public string Language { get; set; }
        public string Login { get; set; }
        public string Register { get; set; }
    }
}