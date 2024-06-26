using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data;
using Tourist.DAL;

namespace Tourist
{
    public partial class ManageTours : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTours();
                LoadDestinations();
            }
        }



        private void LoadTours()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = @"
                SELECT 
                    t.TourId, 
                    t.TourName, 
                    d.Name AS DestinationName, 
                    t.Price, 
                    t.MaxTravellers, 
                    t.StartDate, 
                    t.EndDate, 
                    t.Nights, 
                    t.Days
                FROM 
                    Tours t
                INNER JOIN 
                    Destinations d ON t.DestinationId = d.DestinationId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    ToursGridView.DataSource = reader;
                    ToursGridView.DataBind();
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: " + ex.Message);
                }
            }
        }

        protected void ddlDestination_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Your event handling code goes here
        }

        private void LoadDestinations()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "SELECT DestinationId, Name FROM Destinations";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    ddlDestination.DataSource = reader;
                    ddlDestination.DataTextField = "Name";
                    ddlDestination.DataValueField = "DestinationId";
                    ddlDestination.DataBind();
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: " + ex.Message);
                }
            }
        }

        protected void AddTour_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = @"
                INSERT INTO Tours (DestinationId, TourName, Price, MaxTravellers, StartDate, EndDate, Nights, Days) 
                VALUES (@DestinationId, @TourName, @Price, @MaxTravellers, @StartDate, @EndDate, @Nights, @Days)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@DestinationId", ddlDestination.SelectedValue);
                command.Parameters.AddWithValue("@TourName", txtTourName.Text);
                command.Parameters.AddWithValue("@Price", txtPrice.Text);
                command.Parameters.AddWithValue("@MaxTravellers", txtMaxTravellers.Text);
                command.Parameters.AddWithValue("@StartDate", txtStartDate.Text);
                command.Parameters.AddWithValue("@EndDate", txtEndDate.Text);
                command.Parameters.AddWithValue("@Nights", txtNights.Text);
                command.Parameters.AddWithValue("@Days", txtDays.Text);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    LoadTours();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: "); //+ ex.Message);
                }
            }
        }

        protected void ToursGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                // Implement Edit functionality here if needed
            }
            else if (e.CommandName == "Delete")
            {
                DeleteTour(e.CommandArgument.ToString());
            }
        }

        private void DeleteTour(string tourId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "DELETE FROM Tours WHERE TourId = @TourId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@TourId", tourId);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    LoadTours();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: "); //+ ex.Message);
                }
            }
        }
    }
}
