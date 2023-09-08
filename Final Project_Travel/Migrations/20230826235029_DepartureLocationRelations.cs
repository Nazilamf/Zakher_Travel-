using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Final_Project_Travel.Migrations
{
    public partial class DepartureLocationRelations : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tours_DepartureLocations_DepartureLocationId",
                table: "Tours");

            migrationBuilder.AlterColumn<int>(
                name: "DepartureLocationId",
                table: "Tours",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Tours_DepartureLocations_DepartureLocationId",
                table: "Tours",
                column: "DepartureLocationId",
                principalTable: "DepartureLocations",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tours_DepartureLocations_DepartureLocationId",
                table: "Tours");

            migrationBuilder.AlterColumn<int>(
                name: "DepartureLocationId",
                table: "Tours",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_Tours_DepartureLocations_DepartureLocationId",
                table: "Tours",
                column: "DepartureLocationId",
                principalTable: "DepartureLocations",
                principalColumn: "Id");
        }
    }
}
