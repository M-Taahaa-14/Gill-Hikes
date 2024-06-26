using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Tourist
{
    public partial class Faqs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitQuery(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                string email = Session["Email"].ToString();
                string fullName = GetFullNameFromDatabase(email); 
                string message = txtMessage.Text;

                if (!string.IsNullOrEmpty(message))
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO Queries (Name, Email, Message) VALUES (@Name, @Email, @Message)";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Name", fullName);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Message", message);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }

                    Message.Text = "<div style='color: green;'>Thank you for your feedback!</div>";
                }
                else
                {
                    Message.Text = "<div style='color: red;'>Please fill out the message field.</div>";
                }
            }
            else
            {
                Message.Text = "<div style='color: red;'>You must be logged in to submit feedback.</div>";
            }
        }

        private string GetFullNameFromDatabase(string email)
        {
            string fullName = "";
            string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT FullName FROM Users WHERE Email = @Email";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        fullName = result.ToString();
                    }
                    con.Close();
                }
            }

            return fullName;
        }
    }
}
