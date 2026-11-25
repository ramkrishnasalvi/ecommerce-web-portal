using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.FeaturesData();
        }
    }
    private void FeaturesData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Features"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    FeaturesListView.DataSource = dt;
                    FeaturesListView.DataBind();
                }
            }
        }
    }
    protected void FeaturesListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

    }
    protected void FeaturesListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void FeaturesListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}