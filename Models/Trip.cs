namespace NextStop.Models;
using Microsoft.AspNetCore.Identity; 
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

public class Trip
{
    public int Id { get; set; }

    [Required]
    public int BusId { get; set; }

    [ForeignKey("BusId")]
    public Bus Bus { get; set; }

    public ApplicationUser Driver { get; set; }
        
    public string Origin { get; set; }

    public string Destination { get; set; }

    public DayOfWeek DepartureDay { get; set; }

    public TimeSpan DepartureTime { get; set; }

    public TimeSpan ArrivalTime { get; set; }

    public decimal Price { get; set; }
}