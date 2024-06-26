using System;
using System.Data;
using System.Web.UI.WebControls;
using Tourist.DAL;

namespace Tourist
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Email"] != null)
                {
                    string userEmail = Session["Email"].ToString();

                    PopulateUserProfile(userEmail);
                    PopulateUserBookings(userEmail);
                    //PopulateUserWishlist(userEmail);
                }
                else
                {
                    WishlistGridView.DataSource = null;
                    WishlistGridView.DataBind();
                    WishlistMessageLabel.Text = "No Login Session Found.";
                }
            }
        }

        protected void ReviewButton_Click(object sender, EventArgs e)
        {
            // Redirect to Review.aspx with necessary parameters, e.g., booking ID or tour ID
            // You can get the booking ID or tour ID from the row data or command argument
            // For example:

            //Button btn = (Button)sender;
            //GridViewRow row = (GridViewRow)btn.NamingContainer;
            //int rowIndex = row.RowIndex;

            // Get the booking ID or tour ID using rowIndex or other means

            // Redirect to Review.aspx with appropriate query string or session variables
            Response.Redirect("Review.aspx?BookingID="); //+ bookingID); // Example redirect
        }

        private void PopulateUserProfile(string userEmail)
        {
            myDAL dal = new myDAL();
            DataTable userData = dal.GetUserProfile(userEmail);

            if (userData.Rows.Count > 0)
            {
                DataRow row = userData.Rows[0];

                lblFullName.Text = row["FullName"].ToString();
                lblEmail.Text = row["Email"].ToString();
                lblDOB.Text = ((DateTime)row["DOB"]).ToString("yyyy-MM-dd");
                lblAge.Text = CalculateAge((DateTime)row["DOB"]).ToString();
                lblPhoneNumber.Text = row["PhoneNo"].ToString();
                lblGender.Text = row["Gender"].ToString();
            }
            else
            {
                lblFullName.Text = "No User Found";
                lblEmail.Text = userEmail;
            }
        }

        private int CalculateAge(DateTime dob)
        {
            DateTime today = DateTime.Today;
            int age = today.Year - dob.Year;
            if (dob > today.AddYears(-age))
                age--;
            return age;
        }

        private void PopulateUserBookings(string userEmail)
        {
            myDAL dal = new myDAL();
            DataTable bookingsData = dal.GetUserBookings(userEmail);

            if (bookingsData.Rows.Count > 0)
            {
                BookingsGridView.DataSource = bookingsData;
                BookingsGridView.DataBind();
            }
            else
            {
                BookingsGridView.DataSource = null;
                BookingsGridView.DataBind();
                BookingsMessageLabel.Text = "No bookings found.";
            }
        }


        private void PopulateUserWishlist(string userEmail)
        {
            myDAL dal = new myDAL();
            DataTable wishlists = dal.GetUserWishlists(userEmail);

            if (wishlists.Rows.Count > 0)
            {
                WishlistGridView.DataSource = wishlists;
                WishlistGridView.DataBind();
            }
            else
            {
                WishlistGridView.DataSource = null;
                WishlistGridView.DataBind();
                WishlistMessageLabel.Text = "No wishlists found.";
            }
        }

        protected void WishlistGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "BookItem")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = WishlistGridView.Rows[rowIndex];
                myDAL dal = new myDAL();
                int tourId = Convert.ToInt32(WishlistGridView.DataKeys[rowIndex].Values["TourId"]);
                string em = Session["Email"].ToString();
                int userId = dal.GetUserIdFromEmail(em);

                // fix date part should take from tours start date
                DateTime travelDate = DateTime.Now.AddMonths(1);
                int numberOfPersons = 1;

                AddBooking(userId, tourId, travelDate, numberOfPersons);
                PopulateUserBookings(Session["Email"].ToString());
            }
        }

        private void AddBooking(int userId, int tourId, DateTime travelDate, int numberOfPersons)
        {
            myDAL dal = new myDAL();
            dal.AddBooking(userId, tourId, travelDate, numberOfPersons);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            //Response.Redirect(UserProfile.aspx);
        }
    }
}