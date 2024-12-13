using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NextStop.Data.Migrations
{
    /// <inheritdoc />
    public partial class bustrip2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Trips",
                columns: new[] { "Id", "ArrivalTime", "BusId", "DepartureDay", "DepartureTime", "Destination", "DriverId", "Origin", "Price" },
                values: new object[] { 4, new TimeSpan(0, 15, 0, 0, 0), 4, 6, new TimeSpan(0, 8, 45, 0, 0), "Saint John", null, "Quebec City", 120m });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Trips",
                keyColumn: "Id",
                keyValue: 4);
        }
    }
}
