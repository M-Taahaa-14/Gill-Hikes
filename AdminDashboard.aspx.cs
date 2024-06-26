using System;
using System.Configuration;
using System.Data.SqlClient;


namespace Tourist
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAndDisplayCounts();
            }
        }

        private void GetAndDisplayCounts()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;


            string query = @"
            SELECT 
                (SELECT COUNT(*) FROM Users) AS TotalUsers,
                (SELECT COUNT(*) FROM Tours) AS TotalTours,
                (SELECT COUNT(*) FROM Bookings) AS TotalBookings,
                (SELECT COUNT(*) FROM Destinations) AS TotalDestinations,
                (SELECT COUNT(*) FROM Queries) AS TotalQueries, 
                (SELECT COUNT(*) FROM Ratings) AS TotalRatings";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        TotalUsers.Text = "Total Users: " + reader["TotalUsers"].ToString();
                        TotalTours.Text = "Total Tours: " + reader["TotalTours"].ToString();
                        TotalBookings.Text = "Total Bookings: " + reader["TotalBookings"].ToString();
                        TotalDestinations.Text = "Total Destinations: " + reader["TotalDestinations"].ToString();
                        TotalQueries.Text = "Total Queries: " + reader["TotalQueries"].ToString();
                        TotalRatings.Text = "Total Ratings: " + reader["TotalRatings"].ToString();
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: " + ex.Message);
                }
            }
        }
    }
}
