using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Tourist.DAL
{
    public class myDAL
    {
        private static readonly string connString =
        System.Configuration.ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;

        public bool AdminCheck(string email, string password)
        {
            bool IsAdmin = false;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT COUNT(*) FROM Admins WHERE Email = @Email AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                conn.Close();

                if (count > 0)
                    IsAdmin = true;
            }
            return IsAdmin;
        }
        public bool UserCheck(string email, string password)
        {
            bool isUser = false;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                conn.Close();

                if (count > 0)
                    isUser = true;
            }

            return isUser;
        }

        public bool UserExists(string username, string email)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                bool exists = false;
                string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username OR Email = @Email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                conn.Close();

                if (count > 0)
                    exists = true;

                return exists;
            }
        }


        public bool RegisterUser(string username, string email, string password, string fullName,DateTime DOB,string PhoneNo,string Gender)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO Users (Username, Email, Password, FullName,DOB,PhoneNo,Gender) " +
                               "VALUES (@Username, @Email, @Password, @FullName,@DOB,@PhoneNo,@Gender);";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@DOB", DOB);
                cmd.Parameters.AddWithValue("@PhoneNo", PhoneNo);
                cmd.Parameters.AddWithValue("@Gender", Gender);

                try
                {
                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    conn.Close();

                    return rowsAffected > 0; // If insertion was successful
                }
                catch (SqlException ex)
                {
                    // Log the SQL error
                    System.Diagnostics.Debug.WriteLine($"SQL Error: {ex.Message}");
                    return false;
                }
                catch (Exception ex)
                {
                    // Log other exceptions
                    System.Diagnostics.Debug.WriteLine($"Error: {ex.Message}");
                    return false;
                }
            }
        }

        private string connectionString = "SQLDbConnection";

        public void AddBooking(int userId, int tourId, DateTime travelDate, int numberOfPersons)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Bookings (UserId, TourId, DepartureId, TravelDate) " +
                    "VALUES (@UserId, @TourId, @DepartureId, @TravelDate)", conn))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@TourId", tourId);
                    cmd.Parameters.AddWithValue("@DepartureId", 1);
                    cmd.Parameters.AddWithValue("@TravelDate", travelDate);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public int GetUserIdFromEmail(string email)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT UserId FROM Users WHERE Email = @Email", conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    return result != null ? Convert.ToInt32(result) : 0;
                }
            }
        }

        public DataTable GetUserWishlists(string email)
        {
            DataTable wishlists = new DataTable();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT Destinations.Name, Destinations.Region, Destinations.Location " +
                               "FROM Wishlists " +
                               "INNER JOIN Destinations ON Wishlists.DestinationId = Destinations.DestinationId " +
                               "INNER JOIN Users ON Wishlists.UserId = Users.UserId " +
                               "WHERE Users.Email = @Email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(wishlists);
            }

            return wishlists;
        }

        public DataTable GetTours()
        {
            DataTable tours = new DataTable();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT TourId, TourName FROM Tours"; 
                SqlCommand cmd = new SqlCommand(query, conn);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(tours);
            }

            return tours;
        }

        public DataRow GetTourDetails(int tourId)
        {
            DataTable tourDetails = new DataTable();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT TourId, TourName, StartDate, EndDate, Price FROM Tours WHERE TourId = @TourId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TourId", tourId);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(tourDetails);
            }

            if (tourDetails.Rows.Count > 0)
            {
                return tourDetails.Rows[0];
            }
            else
            {
                return null;
            }
        }

        public DataTable GetDestinations()
        {
            DataTable tours = new DataTable();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT DestinationId, Name FROM Destinations"; 
                SqlCommand cmd = new SqlCommand(query, conn);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(tours);
            }

            return tours;
        }

        public DataTable GetUserProfile(string userEmail)
        {
            DataTable userData = new DataTable();

            string connString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT FullName, Email, Password, PhoneNo, DOB, Gender " +
                               "FROM Users " +
                               "WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", userEmail);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(userData);
            }

            return userData;
        }

        public DataTable GetUserBookings(string userEmail)
        {
            DataTable bookingsData = new DataTable();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = @"SELECT B.BookingDate, 
                                D.Name AS TourName,
                                DEP.City AS DepartureCity,
                                B.Status As BookingStatus,
                                B.TravelDate
                         FROM Bookings B
                         INNER JOIN Tours T ON B.TourId = T.TourId
                         INNER JOIN Destinations D ON T.DestinationId = D.DestinationId
                         INNER JOIN Departures DEP ON B.DepartureId = DEP.DepartureId
                         WHERE B.UserId = (SELECT UserId FROM Users WHERE Email = @Email)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", userEmail);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(bookingsData);
            }

            return bookingsData;
        }



    }
}