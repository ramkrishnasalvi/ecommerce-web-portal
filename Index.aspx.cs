using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            this.PopulateData();
            this.SliderData();
            this.BannerData();
            this.FeaturesData();
            this.FlashSellData();
            this.CountdwonData();
            this.CategoriesData();
            this.SpecialData();
            this.SpecialProducts();
            this.TrendingProducts();
            this.TrendingProducts2();
            this.TrendingProducts3();
            this.TrendingProducts4();
            this.BestSellingProducts();
            this.BestSellingProducts2();
            this.NewarrivalProducts();
            this.bundleBanner();
            this.FavoriteData();
            this.Brands();
            this.NewsArticles();
        }
    }
    private void PopulateData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * from Categories ";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lstmain.DataSource = dt;
                    lstmain.DataBind();
                    if (lstmain.Items.Count > 0)
                    {
                        for (int i = 0; i < lstmain.Items.Count; i++)
                        {
                            Label qid = ((Label)lstmain.Items[i].FindControl("lblid"));

                            ListView chllist = ((ListView)lstmain.Items[i].FindControl("lstsub"));

                            sublist(qid.Text, chllist);


                        }
                    }
                }
            }
        }
    }
    private void sublist(string id, ListView chllist)
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select * from SubCategories Where CategoryID =" + id + "; ";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    chllist.DataSource = dt;
                    chllist.DataBind();
                    if (chllist.Items.Count > 0)
                    {
                        for (int i = 0; i < chllist.Items.Count; i++)
                        {
                            Label qid = ((Label)chllist.Items[i].FindControl("lblid"));

                            ListView lstmini = ((ListView)chllist.Items[i].FindControl("lstmini"));

                            minilist(qid.Text, lstmini);


                        }
                    }

                }
            }
        }
    }
    private void minilist(string id, ListView lstmini)
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select * from SubSubCategories  where SubCategoryID=" + id + "";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lstmini.DataSource = dt;
                    lstmini.DataBind();

                }
            }
        }
    }
    private void SliderData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Sliders"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    SliderListView.DataSource = dt;
                    SliderListView.DataBind();
                }
            }
        }
    }
    private void BannerData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Banners "; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    BannerListView.DataSource = dt;
                    BannerListView.DataBind();
                }
            }
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
    private void FlashSellData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM FlashSell"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    FlashSellListView.DataSource = dt;
                    FlashSellListView.DataBind();
                }
            }
        }
    }
    protected string GetStarRating(int rating)
    {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 5; i++)
        {
            if (i <= rating)
                sb.Append("<i class='fas fa-star'></i>");
            else
                sb.Append("<i class='far fa-star'></i>");
        }
        return sb.ToString();
    }

    public string FormatDiscount(object discountVal)
    {
        if (discountVal == null || discountVal == DBNull.Value) return "";
        string val = discountVal.ToString().Trim();
        if (string.IsNullOrEmpty(val)) return "";

        string numStr = System.Text.RegularExpressions.Regex.Match(val, @"\d+(\.\d+)?").Value;
        decimal d;
        if (decimal.TryParse(numStr, out d) && d > 0)
        {
            return "<li class='discount'><b>-</b>" + d.ToString("0") + "%</li>";
        }
        return "";
    }

    public string FormatIsNew(object isNewVal)
    {
        if (isNewVal == null || isNewVal == DBNull.Value) return "";
        int isNew;
        if (int.TryParse(isNewVal.ToString(), out isNew) && isNew == 1)
        {
            return "<li class='new'> new</li>";
        }
        if (isNewVal is bool && (bool)isNewVal)
        {
            return "<li class='new'> new</li>";
        }
        return "";
    }

    public string FormatOldPrice(object origPrice, object currPrice)
    {
        if (origPrice == null || origPrice == DBNull.Value || currPrice == null || currPrice == DBNull.Value) return "";
        decimal orig, curr;
        if (decimal.TryParse(origPrice.ToString(), out orig) && decimal.TryParse(currPrice.ToString(), out curr))
        {
            if (orig > curr)
            {
                return "<span class='old-price'><del>$" + orig.ToString("0.00") + "</del></span>";
            }
        }
        return "";
    }

    public string SafeStarRating(object ratingVal)
    {
        if (ratingVal == null || ratingVal == DBNull.Value) return GetStarRating(0);
        decimal r;
        if (decimal.TryParse(ratingVal.ToString(), out r))
        {
            return GetStarRating((int)Math.Round(r));
        }
        return GetStarRating(0);
    }
   
    private void CountdwonData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM CountdownEvents"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    CountdwonListView.DataSource = dt;
                    CountdwonListView.DataBind();
                }
            }
        }
    }
    private void CategoriesData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Categoriespro"; // Added WHERE clause for active Categoriespro
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    CategoriesListView.DataSource = dt;
                    CategoriesListView.DataBind();
                }
            }
        }
    }
    private void SpecialData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Special"; // Added WHERE clause for active Special
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    SpecialListView.DataSource = dt;
                    SpecialListView.DataBind();
                }
            }
        }
    }
    private void SpecialProducts()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM SpecialProducts"; // Added WHERE clause for active SpecialProducts
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    SpecialProductsListView.DataSource = dt;
                    SpecialProductsListView.DataBind();
                }
            }
        }
    }
    protected string GenerateStars(int rating)
    {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 5; i++)
        {
            if (i <= rating)
                sb.Append("<i class='fas fa-star'></i>");
            else
                sb.Append("<i class='far fa-star'></i>");
        }
        return sb.ToString();
    }
    private void TrendingProducts()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;";
        using (SqlConnection con = new SqlConnection(constr))
        {
            string sql = "SELECT * FROM TrendingProducts";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                TrendingProductsListView.DataSource = dt;
                TrendingProductsListView.DataBind();
            }
        }
    }
    protected string GetStarRatingTP(int rating)
    {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 5; i++)
        {
            if (i <= rating)
                sb.Append("<i class='fas fa-star'></i>");
            else
                sb.Append("<i class='far fa-star'></i>");
        }
        return sb.ToString();
    }
    
    private void TrendingProducts2()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;";
        using (SqlConnection con = new SqlConnection(constr))
        {
            string sql = "SELECT * FROM TrendingProducts2";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                TrendingProductsListView2.DataSource = dt;
                TrendingProductsListView2.DataBind();
            }
        }
    }
    protected string GetStarRatingTP2(int rating)
    {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 5; i++)
        {
            if (i <= rating)
                sb.Append("<i class='fas fa-star'></i>");
            else
                sb.Append("<i class='far fa-star'></i>");
        }
        return sb.ToString();
    }
    
    private void TrendingProducts3()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;";
        using (SqlConnection con = new SqlConnection(constr))
        {
            string sql = "SELECT * FROM TrendingProducts3";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                TrendingProductsListView3.DataSource = dt;
                TrendingProductsListView3.DataBind();
            }
        }
    }
    protected string GetStarRatingTP3(int rating)
    {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 5; i++)
        {
            if (i <= rating)
                sb.Append("<i class='fas fa-star'></i>");
            else
                sb.Append("<i class='far fa-star'></i>");
        }
        return sb.ToString();
    }
    
    private void TrendingProducts4()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;";
        using (SqlConnection con = new SqlConnection(constr))
        {
            string sql = "SELECT * FROM TrendingProducts4";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                TrendingProductsListView4.DataSource = dt;
                TrendingProductsListView4.DataBind();
            }
        }
    }
    protected string GetStarRatingTP4(int rating)
    {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 5; i++)
        {
            if (i <= rating)
                sb.Append("<i class='fas fa-star'></i>");
            else
                sb.Append("<i class='far fa-star'></i>");
        }
        return sb.ToString();
    }
    
    private void BestSellingProducts()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;";
        using (SqlConnection con = new SqlConnection(constr))
        {
            string sql = "SELECT * FROM BestSellingProducts";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                BestSellingProductListView.DataSource = dt;
                BestSellingProductListView.DataBind();
            }
        }
    }
    private void BestSellingProducts2()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;";
        using (SqlConnection con = new SqlConnection(constr))
        {
            string sql = "SELECT * FROM BestSellingProducts2";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                BestSellingProductListView1.DataSource = dt;
                BestSellingProductListView1.DataBind();
            }
        }
    }
    private void NewarrivalProducts()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM NewarrivalProducts"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    NewArrivalListView.DataSource = dt;
                    NewArrivalListView.DataBind();
                }
            }
        }
    }
    protected string GetStarRatingNA(int rating)
    {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 5; i++)
        {
            if (i <= rating)
                sb.Append("<i class='fas fa-star'></i>");
            else
                sb.Append("<i class='far fa-star'></i>");
        }
        return sb.ToString();
    }
    
    private void bundleBanner()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM BundleBanner "; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    bundleBannerListView.DataSource = dt;
                    bundleBannerListView.DataBind();
                }
            }
        }
    }
    private void Brands()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Brands "; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    BrandsListView.DataSource = dt;
                    BrandsListView.DataBind();
                }
            }
        }
    }
    private void NewsArticles()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM NewsArticles "; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    NewsArticlesListView.DataSource = dt;
                    NewsArticlesListView.DataBind();
                }
            }
        }
    }

    private void FavoriteData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM FavoriteProducts", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    FavoriteListView.DataSource = dt;
                    FavoriteListView.DataBind();
                }
            }
        }
    }
}