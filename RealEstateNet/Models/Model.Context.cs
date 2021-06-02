﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RealEstateNet.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DB_RealEstateEntities : DbContext
    {
        public DB_RealEstateEntities()
            : base("name=DB_RealEstateEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<Chat> Chats { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<Content> Contents { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<Feature> Features { get; set; }
        public virtual DbSet<IP> IPs { get; set; }
        public virtual DbSet<Language> Languages { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<Medium> Media { get; set; }
        public virtual DbSet<Property> Properties { get; set; }
        public virtual DbSet<PropertyContent> PropertyContents { get; set; }
        public virtual DbSet<PropertyFeature> PropertyFeatures { get; set; }
        public virtual DbSet<PropertyService> PropertyServices { get; set; }
        public virtual DbSet<PropertyType> PropertyTypes { get; set; }
        public virtual DbSet<PropertyView> PropertyViews { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<Service> Services { get; set; }
        public virtual DbSet<SocialMediaLink> SocialMediaLinks { get; set; }
        public virtual DbSet<State> States { get; set; }
        public virtual DbSet<Status> Status { get; set; }
        public virtual DbSet<Translation> Translations { get; set; }
        public virtual DbSet<UserDetail> UserDetails { get; set; }
        public virtual DbSet<Favorite> Favorites { get; set; }
        public virtual DbSet<CurrentStatu> CurrentStatus { get; set; }
        public virtual DbSet<Activity> Activities { get; set; }
        public virtual DbSet<UserActivity> UserActivities { get; set; }
    }
}
