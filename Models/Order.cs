namespace NextStop.Models;
using Microsoft.AspNetCore.Identity; 

public class Order
{
    public int Id { get; set; }

    public Trip Trip { get; set; }
    
    public IdentityUser Customer { get; set; }
    
    public int NumOfPassengers { get; set; }

    public int NumOfDiscounts { get; set; }
    
    public DateTime DateOfTravel { get; set; }
    
    public DateTime BookingTime { get; set; }
}