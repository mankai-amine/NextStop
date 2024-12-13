using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NextStop.Data.Migrations
{
    /// <inheritdoc />
    public partial class bustrip : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "BusId",
                table: "Trips",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.InsertData(
                table: "Buses",
                columns: new[] { "Id", "Capacity", "Manufacturer", "Model" },
                values: new object[] { 4, 3, "The Tiny Bus Company", "Minibus Express Lite" });

            migrationBuilder.UpdateData(
                table: "Trips",
                keyColumn: "Id",
                keyValue: 1,
                column: "BusId",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Trips",
                keyColumn: "Id",
                keyValue: 2,
                column: "BusId",
                value: 2);

            migrationBuilder.UpdateData(
                table: "Trips",
                keyColumn: "Id",
                keyValue: 3,
                column: "BusId",
                value: 3);

            migrationBuilder.CreateIndex(
                name: "IX_Trips_BusId",
                table: "Trips",
                column: "BusId");

            migrationBuilder.AddForeignKey(
                name: "FK_Trips_Buses_BusId",
                table: "Trips",
                column: "BusId",
                principalTable: "Buses",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Trips_Buses_BusId",
                table: "Trips");

            migrationBuilder.DropIndex(
                name: "IX_Trips_BusId",
                table: "Trips");

            migrationBuilder.DeleteData(
                table: "Buses",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DropColumn(
                name: "BusId",
                table: "Trips");
        }
    }
}
