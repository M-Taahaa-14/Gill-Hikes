using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Tourist
{
    public partial class ManageDestinations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDestinations();
            }
        }

        private void LoadDestinations()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "SELECT * FROM Destinations";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    DestinationsGridView.DataSource = reader;
                    DestinationsGridView.DataBind();
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: "); //+ ex.Message);
                }
            }
        }

        protected void AddDestination_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "INSERT INTO Destinations (Name, Region, Location) VALUES (@Name, @Region, @Location)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Name", txtName.Text);
                command.Parameters.AddWithValue("@Region", txtRegion.Text);
                command.Parameters.AddWithValue("@Location", txtLocation.Text);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    LoadDestinations();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: "); //+ ex.Message);
                }
            }
        }

        protected void DestinationsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                // Implement Edit functionality here if needed
            }
            else if (e.CommandName == "Delete")
            {
                DeleteDestination(e.CommandArgument.ToString());
            }
        }

        private void DeleteDestination(string destinationId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            string query = "DELETE FROM Destinations WHERE DestinationId = @DestinationId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@DestinationId", destinationId);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    LoadDestinations();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: "); //+ ex.Message);
                }
            }
        }
    }
}
