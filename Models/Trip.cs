namespace NextStop.Models;
using Microsoft.AspNetCore.Identity; 

public class Trip
{
    public int Id { get; set; }
    
    public ApplicationUser Driver { get; set; }
        
    public string Origin { get; set; }

    public string Destination { get; set; }

    public DayOfWeek DepartureDay { get; set; }

    public TimeSpan DepartureTime { get; set; }

    public TimeSpan ArrivalTime { get; set; }

    public decimal Price { get; set; }
}