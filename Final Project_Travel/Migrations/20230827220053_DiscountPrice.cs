using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Final_Project_Travel.Migrations
{
    public partial class DiscountPrice : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DiscountPercent",
                table: "Tours");

            migrationBuilder.AddColumn<decimal>(
                name: "DiscountPrice",
                table: "Tours",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DiscountPrice",
                table: "Tours");

            migrationBuilder.AddColumn<int>(
                name: "DiscountPercent",
                table: "Tours",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
