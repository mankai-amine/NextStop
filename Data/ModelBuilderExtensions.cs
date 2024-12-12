using NextStop.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;

namespace NextStop.Data;

public static class ModelBuilderExtensions
{
    public static ModelBuilder Seed(this ModelBuilder modelBuilder)
    {
        /*modelBuilder.Entity<IdentityRole>().HasData(
        new IdentityRole 
        { 
            Id ="customer-role-id", 
            Name = "Customer", 
            NormalizedName = "CUSTOMER" 
        },
        new IdentityRole
        {
            Id = "driver-role-id",
            Name = "Driver", 
            NormalizedName = "DRIVER" 
        },
        new IdentityRole 
        { 
            Id = "admin-role-id", 
            Name = "Admin", 
            NormalizedName = "ADMIN" 
        });*/

        modelBuilder.Entity<Bus>().HasData(
        new Bus
        {
            Id = 1,
            Model = "Volvo 9700",
            Manufacturer = "Volvo",
            Capacity = 50
        },
        new Bus
        {
            Id = 2,
            Model = "Mercedes-Benz Tourismo",
            Manufacturer = "Mercedes-Benz",
            Capacity = 45
        },
        new Bus
        {
            Id = 3,
            Model = "Scania Interlink HD",
            Manufacturer = "Scania",
            Capacity = 60
        });

        modelBuilder.Entity<Trip>().HasData(
        new Trip
        {
            Id = 1,
            Driver = null, 
            Origin = "Montreal",
            Destination = "Ottawa",
            DepartureDay = DayOfWeek.Monday,
            DepartureTime = new TimeSpan(8, 30, 0), 
            ArrivalTime = new TimeSpan(11, 00, 0), 
            Price = 35
        },
        new Trip
        {
            Id = 2,
            Driver = null,
            Origin = "Toronto",
            Destination = "Montreal",
            DepartureDay = DayOfWeek.Friday,
            DepartureTime = new TimeSpan(14, 0, 0), 
            ArrivalTime = new TimeSpan(20, 30, 0), 
            Price = 120
        },
        new Trip
        {
            Id = 3,
            Driver = null,
            Origin = "Vancouver",
            Destination = "Calgary",
            DepartureDay = DayOfWeek.Saturday,
            DepartureTime = new TimeSpan(9, 45, 0), 
            ArrivalTime = new TimeSpan(16, 0, 0), 
            Price = 150
        });

        return modelBuilder;
    }
}