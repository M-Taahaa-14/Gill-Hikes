using System;
using System.Data;
using System.Web.UI.WebControls;
using Tourist.DAL;

namespace YourNamespace
{
    public partial class Wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["Email"] != null)
                {
                    string userEmail = Session["Email"].ToString();

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
                else
                {
                    WishlistGridView.DataSource = null;
                    WishlistGridView.DataBind();
                    WishlistMessageLabel.Text = "No Login Session Found.";
                }
            }
        }

        //protected void WishlistGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "RemoveItem")
        //    {
        //        // Get the DestinationId of the item to remove
        //        int destinationId = Convert.ToInt32(e.CommandArgument);

        //        // Call method to remove item from wishlist
        //        RemoveItemFromWishlist(destinationId);

        //        // Refresh the wishlist gridview
        //        RefreshWishlist();
        //    }
        //    else if (e.CommandName == "BookItem")
        //    {
        //        // Get the DestinationId of the item to book
        //        int destinationId = Convert.ToInt32(e.CommandArgument);

        //        // Call method to book item from wishlist
        //        BookItemFromWishlist(destinationId);

        //        // Redirect user to booking page or perform necessary action
        //        Response.Redirect("BookingPage.aspx");
        //    }
        //}

        //private void RemoveItemFromWishlist(int destinationId)
        //{
        //    // Implement logic to remove item from wishlist using DAL
        //    // For example:
        //    // myDAL dal = new myDAL();
        //    // dal.RemoveItemFromWishlist(destinationId);
        //    // You can define this method in your DAL class
        //}

        //private void BookItemFromWishlist(int destinationId)
        //{
        //    // Implement logic to book item from wishlist using DAL
        //    // For example:
        //    // myDAL dal = new myDAL();
        //    // dal.BookItemFromWishlist(destinationId);
        //    // You can define this method in your DAL class
        //}

        //private void RefreshWishlist()
        //{
        //    // Refresh the wishlist gridview after removing an item
        //    if (Session["Email"] != null)
        //    {
        //        string userEmail = Session["Email"].ToString();

        //        myDAL dal = new myDAL();
        //        DataTable wishlists = dal.GetUserWishlists(userEmail);

        //        if (wishlists.Rows.Count > 0)
        //        {
        //            WishlistGridView.DataSource = wishlists;
        //            WishlistGridView.DataBind();
        //        }
        //        else
        //        {
        //            WishlistGridView.DataSource = null;
        //            WishlistGridView.DataBind();
        //            WishlistMessageLabel.Text = "No wishlists found.";
        //        }
        //    }
        //    else
        //    {
        //        WishlistGridView.DataSource = null;
        //        WishlistGridView.DataBind();
        //        WishlistMessageLabel.Text = "No Login Session Found.";
        //    }
        //}
    }
}
