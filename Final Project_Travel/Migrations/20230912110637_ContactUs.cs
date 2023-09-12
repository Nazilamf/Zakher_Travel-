using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Final_Project_Travel.Migrations
{
    public partial class ContactUs : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ContactUs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AppUserId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FullName = table.Column<string>(type: "nvarchar(35)", maxLength: 35, nullable: true),
                    Email = table.Column<string>(type: "nvarchar(35)", maxLength: 35, nullable: true),
                    Phone = table.Column<string>(type: "nvarchar(15)", maxLength: 15, nullable: true),
                    Text = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    Subject = table.Column<string>(type: "nvarchar(35)", maxLength: 35, nullable: true),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ContactUs", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ContactUs");
        }
    }
}
