using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Final_Project_Travel.Migrations
{
    public partial class IsDeletedTourImage : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "Tours",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "Tours");
        }
    }
}
