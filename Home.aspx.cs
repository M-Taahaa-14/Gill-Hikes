using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tourist.DAL;

namespace Tourist
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateDestinationDropDown();
            }
        }
        protected void searchButton_Click(object sender, EventArgs e)
        {

            // Handle the search logic here
        }

        private void PopulateDestinationDropDown() 
        {
            myDAL dal = new myDAL();
            DataTable dtTours = dal.GetDestinations(); 

            if (dtTours.Rows.Count > 0)
            {
                ddlDestination.DataSource = dtTours;
                ddlDestination.DataTextField = "Name"; 
                ddlDestination.DataValueField = "DestinationId"; 
                ddlDestination.DataBind();
                ddlDestination.Items.Insert(0, new ListItem("Select Destination", "0"));
            }

        }

        protected void ddlDestination_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Your event handling code goes here
        }

    }
}