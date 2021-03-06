using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateNet.Models
{
    public class AgentModel
    {
        public HttpPostedFileBase Picture { get; set; }
        public string PictureURL { get; set; }
        public string CompanyName { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string Location { get; set; }
    }
}