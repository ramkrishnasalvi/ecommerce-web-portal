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
            LoadDashboardStats();
            LoadRecentOrders();
            LoadNewProducts();
        }
    }
    private void LoadDashboardStats()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False"))
                {
                    con.Open();

                    // Total Products
                    string productsQuery = "SELECT COUNT(*) FROM Products WHERE IsActive = 1";
                    SqlCommand productsCmd = new SqlCommand(productsQuery, con);
                    lblTotalProducts.Text = productsCmd.ExecuteScalar().ToString();

                    // Total Orders
                    string ordersQuery = "SELECT COUNT(*) FROM Orders";
                    SqlCommand ordersCmd = new SqlCommand(ordersQuery, con);
                    lblTotalOrders.Text = ordersCmd.ExecuteScalar().ToString();

                    // Total Customers
                    string customersQuery = "SELECT COUNT(*) FROM Customers";
                    SqlCommand customersCmd = new SqlCommand(customersQuery, con);
                    lblTotalCustomers.Text = customersCmd.ExecuteScalar().ToString();

                    // Total Revenue
                    string revenueQuery = "SELECT ISNULL(SUM(TotalAmount), 0) FROM Orders WHERE Status = 'Delivered'";
                    SqlCommand revenueCmd = new SqlCommand(revenueQuery, con);
                    decimal revenue = Convert.ToDecimal(revenueCmd.ExecuteScalar());
                    lblTotalRevenue.Text = revenue.ToString("N0");

                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error loading statistics: {ex.Message}');</script>");
            }
        }
    private void LoadRecentOrders()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False"))
                {
                    string query = @"SELECT TOP 5 OrderID, CustomerName, TotalAmount, OrderDate, Status 
                                   FROM Orders 
                                   ORDER BY OrderDate DESC";
                    
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    
                    gvRecentOrders.DataSource = dt;
                    gvRecentOrders.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Handle error
            }
        }

        private void LoadNewProducts()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False"))
                {
                    string query = @"SELECT TOP 5 ProductID, ProductName, Category, Price, StockQuantity, ProductImage 
                                   FROM Products 
                                   WHERE IsActive = 1 
                                   ORDER BY CreatedDate DESC";
                    
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    
                    gvNewProducts.DataSource = dt;
                    gvNewProducts.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Handle error
            }
        }

        // Helper method for status badges
        public string GetStatusBadgeClass(string status)
        {
            switch (status.ToLower())
            {
                case "pending": return "bg-warning";
                case "processing": return "bg-info";
                case "shipped": return "bg-primary";
                case "delivered": return "bg-success";
                case "cancelled": return "bg-danger";
                default: return "bg-secondary";
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadDashboardStats();
            LoadRecentOrders();
            LoadNewProducts();
        }
    }