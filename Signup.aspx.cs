using System;
using System.Web.UI;
using Tourist.DAL;

namespace Tourist
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SignupButton_Click(object sender, EventArgs e)
        {
            string fullName = signupFullName.Text.Trim();
            string username = signupUsername.Text.Trim();
            string gender = GenderDropDown.SelectedValue; 
            string phoneNo = signupPhoneNum.Text.Trim();
            DateTime dob;

            // Attempt to parse the date of birth
            if (!DateTime.TryParse(DOB.Text.Trim(), out dob))
            {
                SignupErrorMessage.Text = "Invalid date of birth format.";
                return;
            }

            string email = signupEmail.Text.Trim();
            string password = signupPassword.Text.Trim();
            string confirmPassword = signupConfirmPassword.Text.Trim();

            if (password == confirmPassword)
            {
                myDAL dal = new myDAL();

                if (dal.UserExists(username, email))
                {
                    SignupErrorMessage.Text = "Username or Email already exists.";
                }
                else
                {
                    bool isRegistered = dal.RegisterUser(username, email, password, fullName,dob,phoneNo,gender);
                    if (isRegistered)
                    {
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        SignupErrorMessage.Text = "Registration failed. Please try again.";
                    }
                }
            }
            else
            {
                SignupErrorMessage.Text = "Passwords do not match.";
            }
        }

    }
}
