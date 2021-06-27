using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateNet.Models
{
    public class ActivityModel
    {
        public string Start { get; set; }
        public string End { get; set; }
        public string Middle { get; set; }
        public string Icon { get; set; }
        public int PropertyId { get; set; }
    }
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

    public class UserDetails
    {
        public string userName { get; set; }
        public string Image { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
    }

    public class Contact
    {
        public string Name { get; set; }
        public string ImageUrl { get; set; }
        public string lastMessage { get; set; }
        public int NewMessages { get; set; }
        public int ChatId { get; set; }
    }

    public class ContactDetails
    {
        public string Name { get; set; }
        public string Role { get; set; }
        public string ImageUrl { get; set; }
        public string Info { get; set; }
    }

}