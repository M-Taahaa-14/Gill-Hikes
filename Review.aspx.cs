using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Tourist
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["email"] != null)
                {
                    string userEmail = Session["email"].ToString();
                    int userId = GetUserIdFromEmail(userEmail);
                    if (userId != -1)
                    {
                        PopulateTourDropDown(userId);
                    }
                    else
                    {
                        // Handle scenario where user ID not found for the email
                    }
                }
                else
                {
                    // Redirect to login page or handle user not logged in scenario
                }
            }
        }

        protected int GetUserIdFromEmail(string email)
        {
            int userId = -1;
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT UserId FROM Users WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                conn.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    userId = Convert.ToInt32(result);
                }
            }
            return userId;
        }

        protected void PopulateTourDropDown(int userId)
        {
            DataTable userBookings = GetUserBookings(userId);
            if (userBookings.Rows.Count > 0)
            {
                ddlTour.DataSource = userBookings;
                ddlTour.DataTextField = "TourName";
                ddlTour.DataValueField = "TourId";
                ddlTour.DataBind();
                ddlTour.Items.Insert(0, new ListItem("Select Tour", ""));
            }
            else
            {
                // Handle scenario where user has no bookings
            }
        }

        protected DataTable GetUserBookings(int userId)
        {
            DataTable bookings = new DataTable();

            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Bookings.TourId, TourName FROM Bookings Join Tours On Bookings.TourId=Tours.TourId WHERE UserId = @UserId"; //And GetDate()>Tours.EndDate";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(bookings);
            }
            return bookings;
        }

        protected void ddlTour_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedTourId = ddlTour.SelectedValue;
            // You can add your logic here to handle the selection change event
        }


        protected void SendFeedback_Click(object sender, EventArgs e)
        {
            // Handle submit feedback button click event
            string name = this.name.Text;
            string email = this.email.Text;
            string message = this.message.Text;
            string rating = Request.Form["rating"];
            string selectedTourId = ddlTour.SelectedValue;
            int userId = GetUserIdFromEmail(email); // Get user ID from email

            // Insert the feedback into the ratings table
            InsertFeedback(selectedTourId, userId, rating, message);

            // You can also include additional logic here, such as displaying a success message or redirecting the user
        }

        protected void InsertFeedback(string tourId, int userId, string rating, string review)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Ratings (TourID, UserID, Rating, Review, RatingDate) VALUES (@TourID, @UserID, @Rating, @Review, @RatingDate)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TourID", tourId);
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@Rating", rating);
                cmd.Parameters.AddWithValue("@Review", review);
                cmd.Parameters.AddWithValue("@RatingDate", DateTime.Now); // Assuming current date as rating date
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }


    }
}
