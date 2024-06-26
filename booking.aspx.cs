using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;
using Tourist.DAL;
using System.Runtime.InteropServices.ComTypes;

namespace Tourist
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateTourDropDown();
            }
        }

        protected void Booknow_Click(object sender, EventArgs e)
        {
            if (ddlTour.SelectedValue == "0" && string.IsNullOrEmpty(ddlDepartureCity.SelectedValue))
            {
                lblMessage.Text = "Please select both a tour and a departure city.";
                lblMessage.Visible = true;
                return;
            }
            else if (ddlTour.SelectedValue != "0" && string.IsNullOrEmpty(ddlDepartureCity.SelectedValue))
            {
                lblMessage.Text = "Please select a departure city.";
                lblMessage.Visible = true;
                return;
            }
            else if (ddlTour.SelectedValue == "0" && !string.IsNullOrEmpty(ddlDepartureCity.SelectedValue))
            {
                lblMessage.Text = "Please select a tour.";
                lblMessage.Visible = true;
                return;
            }
            else if (ddlDateRange.SelectedValue == "0")
            {
                lblMessage.Text = "Please select a date range.";
                lblMessage.Visible = true;
                return;
            }
            else
            {
                string selectedTour = ddlTour.SelectedItem.Text;
                string[] dateRangeParts = ddlDateRange.SelectedValue.Split('|');
                string tourId = dateRangeParts[0];
                string startDate = dateRangeParts[1];
                string endDate = dateRangeParts[2];
                string price = txtPrice.Text;
                string paymentMethod = ddlPayment.SelectedValue;
                string departureCity = ddlDepartureCity.SelectedValue;

                string url = $"b2.aspx?tour={HttpUtility.UrlEncode(selectedTour)}&start={startDate}&end={endDate}&price={price}&payment={paymentMethod}&city={HttpUtility.UrlEncode(departureCity)}&tourId={tourId}";
                Response.Redirect(url);
            }
        }


        private void PopulateTourDropDown()
        {
            myDAL dal = new myDAL();
            DataTable dtTours = dal.GetTours();

            if (dtTours.Rows.Count > 0)
            {
                ddlTour.DataSource = dtTours;
                ddlTour.DataTextField = "TourName";
                ddlTour.DataValueField = "TourId";
                ddlTour.DataBind();
                ddlTour.Items.Insert(0, new ListItem("Select Tour", "0"));
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "No tours available.";
            }
        }

        private void PopulateDateRangeDropDown(string tourId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT StartDate, EndDate FROM Tours WHERE DestinationId IN (Select DestinationId From Tours Where TourID = @TourID)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TourID", tourId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlDateRange.Items.Clear();
                ddlDateRange.Items.Add(new ListItem("Select Date Range", "0"));
                while (reader.Read())
                {
                    DateTime startDate = reader.GetDateTime(reader.GetOrdinal("StartDate"));
                    DateTime endDate = reader.GetDateTime(reader.GetOrdinal("EndDate"));
                    ddlDateRange.Items.Add(new ListItem($"{startDate:yyyy-MM-dd} - {endDate:yyyy-MM-dd}", $"{tourId}|{startDate:yyyy-MM-dd}|{endDate:yyyy-MM-dd}"));
                }
            }
        }


        protected void ddlTour_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTour.SelectedValue != "0")
            {
                PopulateDateRangeDropDown(ddlTour.SelectedValue);
            }
            else
            {
                ddlDateRange.Items.Clear();
                ddlDateRange.Items.Add(new ListItem("Select Date Range", "0"));
                ddlDepartureCity.Items.Clear();
                ddlDepartureCity.Items.Add(new ListItem("Select City", ""));
                txtPrice.Text = string.Empty;
            }
        }

        private void PopulateDepartureCitiesDropDown(string tourId,string StartDate, string EndDate)
        {
            var departureCities = GetDepartureCities(tourId,StartDate,EndDate);
            ddlDepartureCity.Items.Clear();
            ddlDepartureCity.Items.Add(new ListItem("Select City", ""));
            foreach (var city in departureCities)
            {
                ddlDepartureCity.Items.Add(new ListItem(city));
            }
        }

        private List<string> GetDepartureCities(string tourId, string StartDate, string EndDate)
        {
            List<string> cities = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT City FROM Departures WHERE TourID IN " +
                    "(SELECT TourID FROM Tours WHERE DestinationId IN " +
                    "(SELECT DestinationId FROM Tours WHERE TourID = @TourID) " +
                    "And StartDate=@StartDate and EndDate=@EndDate)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TourID", tourId);
                cmd.Parameters.AddWithValue("@StartDate", StartDate);
                cmd.Parameters.AddWithValue("@EndDate", EndDate);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    cities.Add(reader["City"].ToString());
                }
            }
            return cities;
        }

        protected void ddlDateRange_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDateRange.SelectedValue != "0")
            {
                string[] dateRangeParts = ddlDateRange.SelectedValue.Split('|');
                string tourId = dateRangeParts[0];
                string startDate = dateRangeParts[1];
                string endDate = dateRangeParts[2];

                var tourDetails = GetTourDetailsForDateRange(tourId, startDate, endDate);
                PopulateDepartureCitiesDropDown(tourId,startDate,endDate);
                txtPrice.Text = tourDetails.Price.ToString();

            }
            else
            {
                txtPrice.Text = string.Empty;
            }
        }


        private TourDetails GetTourDetailsForDateRange(string tourId, string startDate, string endDate)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Price FROM Tours WHERE DestinationId IN (Select DestinationId From Tours Where TourID = @TourID) AND StartDate = @StartDate AND EndDate = @EndDate";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@TourID", tourId);
                cmd.Parameters.AddWithValue("@StartDate", startDate);
                cmd.Parameters.AddWithValue("@EndDate", endDate);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    int price = reader.GetInt32(reader.GetOrdinal("Price"));

                    return new TourDetails
                    {
                        StartDate = DateTime.Parse(startDate),
                        EndDate = DateTime.Parse(endDate),
                        Price = price
                    };
                }
                else
                {
                    throw new Exception("Tour details not found for the selected date range");
                }
            }
        }


        private class TourDetails
        {
            public DateTime StartDate { get; set; }
            public DateTime EndDate { get; set; }
            public int Price { get; set; }

            public override string ToString()
            {
                return $"{StartDate:yyyy-MM-dd} - {EndDate:yyyy-MM-dd}";
            }
        }
    }
}