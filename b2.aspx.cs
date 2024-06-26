using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;


namespace Tourist
{
    public partial class Booking2 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void AddBooking_Click(object sender, EventArgs e)
        {
            string userEmail = Session["email"]?.ToString();
            if (string.IsNullOrEmpty(userEmail))
            {
                Response.Write("User is not logged in.");
                return;
            }

            int userId = GetUserIdByEmail(userEmail);

            string tourName = Request.QueryString["tour"];
            int tourId = GetTourIdByName(tourName);

            string cityName = Request.QueryString["city"];
            int departureId = GetDepartureIdByCityAndTourId(cityName, tourId);
            if (departureId == 0)
            {
                Response.Write("Departure city not found for the selected tour.");
                return;
            }
            DateTime travelDate = DateTime.Parse(Request.QueryString["start"]);

            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "INSERT INTO Bookings (UserId, TourId, DepartureId, BookingDate, TravelDate, Status) VALUES (@UserId, @TourId, @DepartureId, GETDATE(), @TravelDate, 'Pending')";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserId", userId);
                command.Parameters.AddWithValue("@TourId", tourId);
                command.Parameters.AddWithValue("@DepartureId", departureId);
                command.Parameters.AddWithValue("@TravelDate", travelDate);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    Response.Redirect("bcnfrm.aspx");
                    //Response.Write("Booking confirmed successfully.");
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: " + ex.Message);
                }
            }
        }

        private int GetUserIdByEmail(string email)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "SELECT UserId FROM Users WHERE Email = @Email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);

                connection.Open();
                object result = command.ExecuteScalar();
                return result != null ? Convert.ToInt32(result) : 0;
            }
        }

        private int GetTourIdByName(string tourName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "SELECT TourId FROM Tours WHERE TourName = @TourName";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@TourName", tourName);

                connection.Open();
                object result = command.ExecuteScalar();
                return result != null ? Convert.ToInt32(result) : 0;
            }
        }

        private int GetDepartureIdByCityAndTourId(string city, int tourId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "SELECT DepartureId FROM Departures WHERE City = @City AND TourId = @TourId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@City", city);
                command.Parameters.AddWithValue("@TourId", tourId);

                connection.Open();
                object result = command.ExecuteScalar();
                return result != null ? Convert.ToInt32(result) : 0;
            }
        }
    }
}
