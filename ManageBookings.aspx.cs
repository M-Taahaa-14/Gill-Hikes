using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Tourist
{
    public partial class ManageBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
            }
        }

        private void LoadBookings()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "SELECT * FROM Bookings";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    BookingsGridView.DataSource = reader;
                    BookingsGridView.DataBind();
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: " + ex.Message);
                }
            }
        }

        protected void AddBooking_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "INSERT INTO Bookings (UserId, TourId, DepartureId, TravelDate) VALUES (@UserId, @TourId, @DepartureId, @NumberOfPersons, @TravelDate)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserId", txtUserId.Text);
                command.Parameters.AddWithValue("@TourId", txtTourId.Text);
                command.Parameters.AddWithValue("@DepartureId", txtDepartureId.Text);
                command.Parameters.AddWithValue("@TravelDate", DateTime.Parse(txtTravelDate.Text));

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    LoadBookings();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: "); //+ ex.Message);
                }
            }
        }

        protected void BookingsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Confirm")
            {
                UpdateBookingStatus(e.CommandArgument.ToString(), "Confirmed");
            }
            else if (e.CommandName == "Cancel")
            {
                DeleteBooking(e.CommandArgument.ToString());
            }
        }

        private void UpdateBookingStatus(string bookingId, string status)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "UPDATE Bookings SET Status = @Status WHERE BookingId = @BookingId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Status", status);
                command.Parameters.AddWithValue("@BookingId", bookingId);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    LoadBookings();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: "); //+ ex.Message);
                }
            }
        }

        private void DeleteBooking(string bookingId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "DELETE FROM Bookings WHERE BookingId = @BookingId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@BookingId", bookingId);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    LoadBookings();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: "); //+ ex.Message);
                }
            }
        }
    }
}
