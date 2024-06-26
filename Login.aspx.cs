using System;
using System.Web.UI;
using Tourist.DAL;

namespace Tourist
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = loginEmail.Text.Trim();
            string password = loginPassword.Text.Trim();

            myDAL dal = new myDAL(); 
            if (dal.UserCheck(email, password))
            {
                Session["Email"] = email;
                Response.Redirect("Home.aspx"); 
            }
            else if (dal.AdminCheck(email, password))
            {
                Response.Redirect("AdminDashboard.aspx"); 
            }
            else
            {
                LoginErrorMessage.Text = "Invalid email or password.";
            }
        }
    }
}
