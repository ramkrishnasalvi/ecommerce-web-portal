using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Loginpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string Username = txtUsername.Text;
        string Password = txtPassword.Text;

        // Connection string
        string connectionString = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";

        // Query to verify admin credentials
        string query = "SELECT COUNT(*) FROM Adminlogin WHERE Username = @Username AND Password = @Password";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                // Add parameters to prevent SQL injection
                cmd.Parameters.AddWithValue("@Username", Username);
                cmd.Parameters.AddWithValue("@Password", Password);

                con.Open();

                int count = (int)cmd.ExecuteScalar();

                if (count == 1)
                {
                    // Redirect if login is successful
                    Response.Redirect("Dashboard.aspx");
                }
            }
        }
    }
}