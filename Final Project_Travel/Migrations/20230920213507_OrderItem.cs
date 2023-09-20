using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Final_Project_Travel.Migrations
{
    public partial class OrderItem : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "TourName",
                table: "OrderItems",
                type: "nvarchar(35)",
                maxLength: 35,
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "TourName",
                table: "OrderItems");
        }
    }
}
