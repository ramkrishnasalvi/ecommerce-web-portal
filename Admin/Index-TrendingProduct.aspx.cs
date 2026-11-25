using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    private string TrendingProductID;
    private string TrendingProduct2ID;
    private string TrendingProduct3ID;
    private string TrendingProduct4ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.TrendingProducts();
            this.TrendingProducts2();
            this.TrendingProducts3();
            this.TrendingProducts4();
        }
    }
    private void TrendingProducts()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM TrendingProducts"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    TrendingProductsListView.DataSource = dt;
                    TrendingProductsListView.DataBind();
                }
            }
        }
    }
    protected void btnSubmitTP_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(TrendingProductID),0)+1 from TrendingProducts", con);
        TrendingProductID = cmdmax.ExecuteScalar().ToString();
        string TrendingimageTP = TrendingProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + TrendingimageTP;
            int widthC = 0;
            int heightC = 0;
            Stream streamC = files.InputStream;
            using (Bitmap imageC = new Bitmap(streamC))
            {
                widthC = imageC.Width;
                heightC = imageC.Height;
                using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format32bppArgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
                    }
                }
            }
        }
        
        decimal OriginalPriceTP = 0;
        decimal CurrentPriceTP = 0;
        int DiscountShowTP = 0;

        // Inputs ko Parse karein
        if (decimal.TryParse(TxtOriginalPriceTP.Text, out OriginalPriceTP) &&
            decimal.TryParse(TxtCurrentPriceTP.Text, out CurrentPriceTP))
        {
            // Check 1: Original Price valid hona chahiye (OriginalPrice > 0)
            // Check 2: Genuine Discount hona chahiye (OriginalPrice > DiscountedPrice)
            if (OriginalPriceTP > 0 && OriginalPriceTP > CurrentPriceTP)
            {
                // Discount Calculation Logic:
                decimal rawPercentage = ((OriginalPriceTP - CurrentPriceTP) / OriginalPriceTP) * 100;

                // Math.Round se percentage ko nearest whole number mein round karein
                DiscountShowTP = (int)Math.Round(rawPercentage);

                // Output ko textbox mein set karein
                TxtDiscountShowTP.Text = DiscountShowTP.ToString();
            }
            else
            {
                // NO DISCOUNT Scenario: 
                // 1. Original Price ko 0 set karein (Database mein 0 save hoga)
                OriginalPriceTP = 0;

                // 2. Discount Percentage ko 0 set karein
                DiscountShowTP = 0;
                TxtDiscountShowTP.Text = "0";
            }
        }
        else
        {
            // Agar parsing fail ho jaye (Non-numeric data), toh 0 set karein
            TxtDiscountShowTP.Text = "0";
            OriginalPriceTP = 0;
        }
        
        SqlCommand cmd1 = new SqlCommand("insert into TrendingProducts(TrendingProductID, TrendingimageTP, TitleTP, CurrentPriceTP, OriginalPriceTP, DiscountShowTP, RatingTP, ReviewCountTP, IsNewTP, DisplayOrderTP) values('" + TrendingProductID + "', '" + TrendingimageTP + "', '" + TxtTitleTP.Text + "', '" + TxtCurrentPriceTP.Text + "', '" + TxtOriginalPriceTP.Text + "', '" + TxtDiscountShowTP.Text + "',  '" + TxtRatingTP.Text + "', '" + TxtReviewCountTP.Text + "', '" + TxtIsNewTP.Text + "', '" + TxtDisplayOrderTP.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.TrendingProducts();
        ClearFormTP();
    }
    protected void btnUpdateTP_Click(object sender, EventArgs e)
    {
        string TrendingimageTP = TrendingProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files1 = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + TrendingimageTP;
            int widthC1 = 0;
            int heightC1 = 0;
            Stream streamC1 = files1.InputStream;
            using (Bitmap imageC = new Bitmap(streamC1))
            {
                widthC1 = imageC.Width;
                heightC1 = imageC.Height;
                using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format32bppArgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
                    }
                }
            }
        }
        decimal OriginalPriceTP = 0;
        decimal CurrentPriceTP = 0;
        int DiscountShowTP = 0;

        // Inputs ko Parse karein
        if (decimal.TryParse(TxtOriginalPriceTP.Text, out OriginalPriceTP) &&
            decimal.TryParse(TxtCurrentPriceTP.Text, out CurrentPriceTP))
        {
            // Check 1: Original Price valid hona chahiye (OriginalPrice > 0)
            // Check 2: Genuine Discount hona chahiye (OriginalPrice > DiscountedPrice)
            if (OriginalPriceTP > 0 && OriginalPriceTP > CurrentPriceTP)
            {
                // Discount Calculation Logic:
                decimal rawPercentage = ((OriginalPriceTP - CurrentPriceTP) / OriginalPriceTP) * 100;

                // Math.Round se percentage ko nearest whole number mein round karein
                DiscountShowTP = (int)Math.Round(rawPercentage);

                // Output ko textbox mein set karein
                TxtDiscountShowTP.Text = DiscountShowTP.ToString();
            }
            else
            {
                // NO DISCOUNT Scenario: 
                // 1. Original Price ko 0 set karein (Database mein 0 save hoga)
                OriginalPriceTP = 0;

                // 2. Discount Percentage ko 0 set karein
                DiscountShowTP = 0;
                TxtDiscountShowTP.Text = "0";
            }
        }
        else
        {
            // Agar parsing fail ho jaye (Non-numeric data), toh 0 set karein
            TxtDiscountShowTP.Text = "0";
            OriginalPriceTP = 0;
        }
        
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update TrendingProducts set TrendingimageTP='" + TrendingimageTP + "', TitleTP='" + TxtTitleTP.Text + "', CurrentPriceTP='" + TxtCurrentPriceTP.Text + "', OriginalPriceTP='" + TxtOriginalPriceTP.Text + "', DiscountShowTP='" + TxtDiscountShowTP.Text + "', RatingTP='" + TxtRatingTP.Text + "', ReviewCountTP='" + TxtReviewCountTP.Text + "', IsNewTP='" + TxtIsNewTP.Text + "', DisplayOrderTP='" + TxtDisplayOrderTP.Text + "' where TrendingProductID='" + lblTrendingProductID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.TrendingProducts();
        ClearFormTP();
    }
    private void ClearFormTP()
    {
        TrendingimageTP.ImageUrl = "";
        TxtTitleTP.Text = "";
        TxtCurrentPriceTP.Text = "";
        TxtOriginalPriceTP.Text = "";
        TxtDiscountShowTP.Text = "";
        TxtRatingTP.Text = "";
        TxtReviewCountTP.Text = "";
        TxtIsNewTP.Text = "";
        TxtDisplayOrderTP.Text = "";
        TrendingProductID = "";
        btnUpdateTP.Visible = false;

    }
    protected void TrendingProductsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            //Western
            string TrendingProductID = e.CommandArgument.ToString();
            lblTrendingProductID.Text = TrendingProductID.ToString();
            lblTrendingProductID.Text = (e.Item.FindControl("lblTrendingProductID") as Label).Text;
            TrendingimageTP.ImageUrl = "img/products/" + (e.Item.FindControl("lblTrendingimageTP") as Label).Text;
            TxtTitleTP.Text = (e.Item.FindControl("lblTitleTP") as Label).Text;
            TxtDiscountShowTP.Text = (e.Item.FindControl("lblDiscountShowTP") as Label).Text;
            TxtRatingTP.Text = (e.Item.FindControl("lblRatingTP") as Label).Text;
            TxtReviewCountTP.Text = (e.Item.FindControl("lblReviewCountTP") as Label).Text;
            TxtIsNewTP.Text = (e.Item.FindControl("lblIsNewTP") as Label).Text;
            TxtCurrentPriceTP.Text = (e.Item.FindControl("lblCurrentPriceTP") as Label).Text;
            TxtOriginalPriceTP.Text = (e.Item.FindControl("lblOriginalPriceTP") as Label).Text;
            TxtDisplayOrderTP.Text = (e.Item.FindControl("lblDisplayOrderTP") as Label).Text;
            btnUpdateTP.Visible = true;
            this.TrendingProducts();
            

        }
        if (e.CommandName == "delete")
        {
            string TrendingProductID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from TrendingProducts where TrendingProductID=" + TrendingProductID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@TrendingProductID", TrendingProductID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.TrendingProducts();

        }
    }
    protected void TrendingProductsListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void TrendingProductsListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    //Tops
    private void TrendingProducts2()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM TrendingProducts2"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    TrendingProductsListView2.DataSource = dt;
                    TrendingProductsListView2.DataBind();
                }
            }
        }
    }
    protected void btnSubmitTP2_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(TrendingProduct2ID),0)+1 from TrendingProducts2", con);
        TrendingProduct2ID = cmdmax.ExecuteScalar().ToString();
        string TrendingimageTP2 = TrendingProduct2ID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload2.HasFile)
        {
            HttpPostedFile files = FileUpload2.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + TrendingimageTP2;
            int widthC = 0;
            int heightC = 0;
            Stream streamC = files.InputStream;
            using (Bitmap imageC = new Bitmap(streamC))
            {
                widthC = imageC.Width;
                heightC = imageC.Height;
                using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format32bppArgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
                    }
                }
            }
        }
        decimal OriginalPriceTP2 = 0;
        decimal CurrentPriceTP2 = 0;
        int DiscountShowTP2 = 0;

        // Inputs ko Parse karein
        if (decimal.TryParse(TxtOriginalPriceTP2.Text, out OriginalPriceTP2) &&
            decimal.TryParse(TxtCurrentPriceTP2.Text, out CurrentPriceTP2))
        {
            // Check 1: Original Price valid hona chahiye (OriginalPrice > 0)
            // Check 2: Genuine Discount hona chahiye (OriginalPrice > DiscountedPrice)
            if (OriginalPriceTP2 > 0 && OriginalPriceTP2 > CurrentPriceTP2)
            {
                // Discount Calculation Logic:
                decimal rawPercentage = ((OriginalPriceTP2 - CurrentPriceTP2) / OriginalPriceTP2) * 100;

                // Math.Round se percentage ko nearest whole number mein round karein
                DiscountShowTP2 = (int)Math.Round(rawPercentage);

                // Output ko textbox mein set karein
                TxtDiscountShowTP.Text = DiscountShowTP2.ToString();
            }
            else
            {
                // NO DISCOUNT Scenario: 
                // 1. Original Price ko 0 set karein (Database mein 0 save hoga)
                OriginalPriceTP2 = 0;

                // 2. Discount Percentage ko 0 set karein
                DiscountShowTP2 = 0;
                TxtDiscountShowTP.Text = "0";
            }
        }
        else
        {
            // Agar parsing fail ho jaye (Non-numeric data), toh 0 set karein
            TxtDiscountShowTP.Text = "0";
            OriginalPriceTP2 = 0;
        }
        
        SqlCommand cmd1 = new SqlCommand("insert into TrendingProducts2(TrendingProduct2ID, TrendingimageTP2, TitleTP2, CurrentPriceTP2, OriginalPriceTP2, DiscountShowTP2, RatingTP2, ReviewCountTP2, IsNewTP2,  DisplayOrderTP2) values('" + TrendingProduct2ID + "', '" + TrendingimageTP2 + "', '" + TxtTitleTP2.Text + "', '" + TxtCurrentPriceTP2.Text + "', '" + TxtOriginalPriceTP2.Text + "', '" + TxtDiscountShowTP2.Text + "',  '" + TxtRatingTP2.Text + "', '" + TxtReviewCountTP2.Text + "', '" + TxtIsNewTP2.Text + "', '" + TxtDisplayOrderTP2.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.TrendingProducts2();
        ClearFormTP2();
    }
    protected void btnUpdateTP2_Click(object sender, EventArgs e)
    {
        string TrendingimageTP2 = TrendingProduct2ID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload2.HasFile)
        {
            HttpPostedFile files1 = FileUpload2.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + TrendingimageTP2;
            int widthC1 = 0;
            int heightC1 = 0;
            Stream streamC1 = files1.InputStream;
            using (Bitmap imageC = new Bitmap(streamC1))
            {
                widthC1 = imageC.Width;
                heightC1 = imageC.Height;
                using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format32bppArgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
                    }
                }
            }
        }
        decimal OriginalPriceTP2 = 0;
        decimal CurrentPriceTP2 = 0;
        int DiscountShowTP2 = 0;

        // Inputs ko Parse karein
        if (decimal.TryParse(TxtOriginalPriceTP2.Text, out OriginalPriceTP2) &&
            decimal.TryParse(TxtCurrentPriceTP2.Text, out CurrentPriceTP2))
        {
            // Check 1: Original Price valid hona chahiye (OriginalPrice > 0)
            // Check 2: Genuine Discount hona chahiye (OriginalPrice > DiscountedPrice)
            if (OriginalPriceTP2 > 0 && OriginalPriceTP2 > CurrentPriceTP2)
            {
                // Discount Calculation Logic:
                decimal rawPercentage = ((OriginalPriceTP2 - CurrentPriceTP2) / OriginalPriceTP2) * 100;

                // Math.Round se percentage ko nearest whole number mein round karein
                DiscountShowTP2 = (int)Math.Round(rawPercentage);

                // Output ko textbox mein set karein
                TxtDiscountShowTP.Text = DiscountShowTP2.ToString();
            }
            else
            {
                // NO DISCOUNT Scenario: 
                // 1. Original Price ko 0 set karein (Database mein 0 save hoga)
                OriginalPriceTP2 = 0;

                // 2. Discount Percentage ko 0 set karein
                DiscountShowTP2 = 0;
                TxtDiscountShowTP.Text = "0";
            }
        }
        else
        {
            // Agar parsing fail ho jaye (Non-numeric data), toh 0 set karein
            TxtDiscountShowTP.Text = "0";
            OriginalPriceTP2 = 0;
        }
        
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update TrendingProducts2 set TrendingimageTP2='" + TrendingimageTP2 + "', TitleTP2='" + TxtTitleTP2.Text + "', CurrentPriceTP2='" + TxtCurrentPriceTP2.Text + "', OriginalPriceTP2='" + TxtOriginalPriceTP2.Text + "', DiscountShowTP2='" + TxtDiscountShowTP2.Text + "', RatingTP2='" + TxtRatingTP2.Text + "', ReviewCountTP2='" + TxtReviewCountTP2.Text + "', IsNewTP2='" + TxtIsNewTP2.Text + "',DisplayOrderTP2='" + TxtDisplayOrderTP2.Text + "' where TrendingProduct2ID='" + lblTrendingProduct2ID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.TrendingProducts2();
        ClearFormTP2();
    }
    private void ClearFormTP2()
    {
        TrendingimageTP2.ImageUrl = "";
        TxtTitleTP2.Text = "";
        TxtCurrentPriceTP2.Text = "";
        TxtOriginalPriceTP2.Text = "";
        TxtDiscountShowTP2.Text = "";
        TxtRatingTP2.Text = "";
        TxtReviewCountTP2.Text = "";
        TxtIsNewTP2.Text = "";
        TxtDisplayOrderTP2.Text = "";
        TrendingProduct2ID = "";
        btnUpdateTP2.Visible = false;

    }
    protected void TrendingProductsListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            //tops
            string TrendingProduct2ID = e.CommandArgument.ToString();
            lblTrendingProduct2ID.Text = TrendingProduct2ID.ToString();
            lblTrendingProduct2ID.Text = (e.Item.FindControl("lblTrendingProduct2ID") as Label).Text;
            TrendingimageTP2.ImageUrl = "img/products/" + (e.Item.FindControl("lblTrendingimageTP2") as Label).Text;
            TxtTitleTP2.Text = (e.Item.FindControl("lblTitleTP2") as Label).Text;
            TxtDiscountShowTP2.Text = (e.Item.FindControl("lblDiscountShowTP2") as Label).Text;
            TxtRatingTP2.Text = (e.Item.FindControl("lblRatingTP2") as Label).Text;
            TxtReviewCountTP2.Text = (e.Item.FindControl("lblReviewCountTP2") as Label).Text;
            TxtIsNewTP2.Text = (e.Item.FindControl("lblIsNewTP2") as Label).Text;
            TxtCurrentPriceTP2.Text = (e.Item.FindControl("lblCurrentPriceTP2") as Label).Text;
            TxtOriginalPriceTP2.Text = (e.Item.FindControl("lblOriginalPriceTP2") as Label).Text;
            TxtDisplayOrderTP2.Text = (e.Item.FindControl("lblDisplayOrderTP2") as Label).Text;
            btnUpdateTP2.Visible = true;
            this.TrendingProducts2();
        }
        if (e.CommandName == "delete")
        {
            string TrendingProduct2ID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from TrendingProducts2 where TrendingProduct2ID=" + TrendingProduct2ID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@TrendingProduct2ID", TrendingProduct2ID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.TrendingProducts2();

        }
    }
    protected void TrendingProductsListView2_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void TrendingProductsListView2_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    //Bags
    private void TrendingProducts3()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM TrendingProducts3"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    TrendingProductsListView3.DataSource = dt;
                    TrendingProductsListView3.DataBind();
                }
            }
        }
    }
    protected void btnSubmitTP3_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(TrendingProduct3ID),0)+1 from TrendingProducts3", con);
        TrendingProduct3ID = cmdmax.ExecuteScalar().ToString();
        string TrendingimageTP3 = TrendingProduct3ID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload3.HasFile)
        {
            HttpPostedFile files = FileUpload3.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + TrendingimageTP3;
            int widthC = 0;
            int heightC = 0;
            Stream streamC = files.InputStream;
            using (Bitmap imageC = new Bitmap(streamC))
            {
                widthC = imageC.Width;
                heightC = imageC.Height;
                using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format32bppArgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
                    }
                }
            }
        }
        decimal OriginalPriceTP3 = 0;
        decimal CurrentPriceTP3 = 0;
        int DiscountShowTP3 = 0;

        // Inputs ko Parse karein
        if (decimal.TryParse(TxtOriginalPriceTP3.Text, out OriginalPriceTP3) &&
            decimal.TryParse(TxtCurrentPriceTP3.Text, out CurrentPriceTP3))
        {
            // Check 1: Original Price valid hona chahiye (OriginalPrice > 0)
            // Check 2: Genuine Discount hona chahiye (OriginalPrice > DiscountedPrice)
            if (OriginalPriceTP3 > 0 && OriginalPriceTP3 > CurrentPriceTP3)
            {
                // Discount Calculation Logic:
                decimal rawPercentage = ((OriginalPriceTP3 - CurrentPriceTP3) / OriginalPriceTP3) * 100;

                // Math.Round se percentage ko nearest whole number mein round karein
                DiscountShowTP3 = (int)Math.Round(rawPercentage);

                // Output ko textbox mein set karein
                TxtDiscountShowTP.Text = DiscountShowTP3.ToString();
            }
            else
            {
                // NO DISCOUNT Scenario: 
                // 1. Original Price ko 0 set karein (Database mein 0 save hoga)
                OriginalPriceTP3 = 0;

                // 2. Discount Percentage ko 0 set karein
                DiscountShowTP3 = 0;
                TxtDiscountShowTP.Text = "0";
            }
        }
        else
        {
            // Agar parsing fail ho jaye (Non-numeric data), toh 0 set karein
            TxtDiscountShowTP.Text = "0";
            OriginalPriceTP3 = 0;
        }
        
        SqlCommand cmd1 = new SqlCommand("insert into TrendingProducts3(TrendingProduct3ID, TrendingimageTP3, TitleTP3, CurrentPriceTP3, OriginalPriceTP3, DiscountShowTP3, RatingTP3, ReviewCountTP3, IsNewTP3,  DisplayOrderTP3) values('" + TrendingProduct3ID + "', '" + TrendingimageTP3 + "', '" + TxtTitleTP3.Text + "', '" + TxtCurrentPriceTP3.Text + "', '" + TxtOriginalPriceTP3.Text + "', '" + TxtDiscountShowTP3.Text + "',  '" + TxtRatingTP3.Text + "', '" + TxtReviewCountTP3.Text + "', '" + TxtIsNewTP3.Text + "',  '" + TxtDisplayOrderTP3.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.TrendingProducts3();
        ClearFormTP3();
    }
    protected void btnUpdateTP3_Click(object sender, EventArgs e)
    {
        string TrendingimageTP3 = TrendingProduct3ID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload3.HasFile)
        {
            HttpPostedFile files1 = FileUpload3.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + TrendingimageTP3;
            int widthC1 = 0;
            int heightC1 = 0;
            Stream streamC1 = files1.InputStream;
            using (Bitmap imageC = new Bitmap(streamC1))
            {
                widthC1 = imageC.Width;
                heightC1 = imageC.Height;
                using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format32bppArgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
                    }
                }
            }
        }
        decimal OriginalPriceTP3 = 0;
        decimal CurrentPriceTP3 = 0;
        int DiscountShowTP3 = 0;

        // Inputs ko Parse karein
        if (decimal.TryParse(TxtOriginalPriceTP3.Text, out OriginalPriceTP3) &&
            decimal.TryParse(TxtCurrentPriceTP3.Text, out CurrentPriceTP3))
        {
            // Check 1: Original Price valid hona chahiye (OriginalPrice > 0)
            // Check 2: Genuine Discount hona chahiye (OriginalPrice > DiscountedPrice)
            if (OriginalPriceTP3 > 0 && OriginalPriceTP3 > CurrentPriceTP3)
            {
                // Discount Calculation Logic:
                decimal rawPercentage = ((OriginalPriceTP3 - CurrentPriceTP3) / OriginalPriceTP3) * 100;

                // Math.Round se percentage ko nearest whole number mein round karein
                DiscountShowTP3 = (int)Math.Round(rawPercentage);

                // Output ko textbox mein set karein
                TxtDiscountShowTP.Text = DiscountShowTP3.ToString();
            }
            else
            {
                // NO DISCOUNT Scenario: 
                // 1. Original Price ko 0 set karein (Database mein 0 save hoga)
                OriginalPriceTP3 = 0;

                // 2. Discount Percentage ko 0 set karein
                DiscountShowTP3 = 0;
                TxtDiscountShowTP.Text = "0";
            }
        }
        else
        {
            // Agar parsing fail ho jaye (Non-numeric data), toh 0 set karein
            TxtDiscountShowTP.Text = "0";
            OriginalPriceTP3 = 0;
        }
        
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update TrendingProducts3 set TrendingimageTP3='" + TrendingimageTP3 + "', TitleTP3='" + TxtTitleTP3.Text + "', CurrentPriceTP3='" + TxtCurrentPriceTP3.Text + "', OriginalPriceTP3='" + TxtOriginalPriceTP3.Text + "', DiscountShowTP3='" + TxtDiscountShowTP3.Text + "', RatingTP3='" + TxtRatingTP3.Text + "', ReviewCountTP3='" + TxtReviewCountTP3.Text + "', IsNewTP3='" + TxtIsNewTP3.Text + "', DisplayOrderTP3='" + TxtDisplayOrderTP3.Text + "' where TrendingProduct3ID='" + lblTrendingProduct3ID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.TrendingProducts3();
        ClearFormTP3();
    }
    private void ClearFormTP3()
    {
        TrendingimageTP3.ImageUrl = "";
        TxtTitleTP3.Text = "";
        TxtCurrentPriceTP3.Text = "";
        TxtOriginalPriceTP3.Text = "";
        TxtDiscountShowTP3.Text = "";
        TxtRatingTP3.Text = "";
        TxtReviewCountTP3.Text = "";
        TxtIsNewTP3.Text = "";
        TxtDisplayOrderTP3.Text = "";
        TrendingProduct3ID = "";
        btnUpdateTP3.Visible = false;

    }
    protected void TrendingProductsListView3_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            //tops
            string TrendingProduct3ID = e.CommandArgument.ToString();
            lblTrendingProduct3ID.Text = TrendingProduct3ID.ToString();
            lblTrendingProduct3ID.Text = (e.Item.FindControl("lblTrendingProduct3ID") as Label).Text;
            TrendingimageTP3.ImageUrl = "img/products/" + (e.Item.FindControl("lblTrendingimageTP3") as Label).Text;
            TxtTitleTP3.Text = (e.Item.FindControl("lblTitleTP3") as Label).Text;
            TxtDiscountShowTP3.Text = (e.Item.FindControl("lblDiscountShowTP3") as Label).Text;
            TxtRatingTP3.Text = (e.Item.FindControl("lblRatingTP3") as Label).Text;
            TxtReviewCountTP3.Text = (e.Item.FindControl("lblReviewCountTP3") as Label).Text;
            TxtIsNewTP3.Text = (e.Item.FindControl("lblIsNewTP3") as Label).Text;
            TxtCurrentPriceTP3.Text = (e.Item.FindControl("lblCurrentPriceTP3") as Label).Text;
            TxtOriginalPriceTP3.Text = (e.Item.FindControl("lblOriginalPriceTP3") as Label).Text;
            TxtDisplayOrderTP3.Text = (e.Item.FindControl("lblDisplayOrderTP3") as Label).Text;
            btnUpdateTP3.Visible = true;
            this.TrendingProducts3();
        }
        if (e.CommandName == "delete")
        {
            string TrendingProduct3ID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from TrendingProducts3 where TrendingProduct3ID=" + TrendingProduct3ID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@TrendingProduct3ID", TrendingProduct3ID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.TrendingProducts3();

        }
    }
    protected void TrendingProductsListView3_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void TrendingProductsListView3_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    //Shoes
    private void TrendingProducts4()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM TrendingProducts4"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    TrendingProductsListView4.DataSource = dt;
                    TrendingProductsListView4.DataBind();
                }
            }
        }
    }
    protected void btnSubmitTP4_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(TrendingProduct4ID),0)+1 from TrendingProducts4", con);
        TrendingProduct4ID = cmdmax.ExecuteScalar().ToString();
        string TrendingimageTP4 = TrendingProduct4ID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload4.HasFile)
        {
            HttpPostedFile files = FileUpload4.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + TrendingimageTP4;
            int widthC = 0;
            int heightC = 0;
            Stream streamC = files.InputStream;
            using (Bitmap imageC = new Bitmap(streamC))
            {
                widthC = imageC.Width;
                heightC = imageC.Height;
                using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format32bppArgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
                    }
                }
            }
        }
        decimal OriginalPriceTP4 = 0;
        decimal CurrentPriceTP4 = 0;
        int DiscountShowTP4 = 0;

        // Inputs ko Parse karein
        if (decimal.TryParse(TxtOriginalPriceTP4.Text, out OriginalPriceTP4) &&
            decimal.TryParse(TxtCurrentPriceTP4.Text, out CurrentPriceTP4))
        {
            // Check 1: Original Price valid hona chahiye (OriginalPrice > 0)
            // Check 2: Genuine Discount hona chahiye (OriginalPrice > DiscountedPrice)
            if (OriginalPriceTP4 > 0 && OriginalPriceTP4 > CurrentPriceTP4)
            {
                // Discount Calculation Logic:
                decimal rawPercentage = ((OriginalPriceTP4 - CurrentPriceTP4) / OriginalPriceTP4) * 100;

                // Math.Round se percentage ko nearest whole number mein round karein
                DiscountShowTP4 = (int)Math.Round(rawPercentage);

                // Output ko textbox mein set karein
                TxtDiscountShowTP.Text = DiscountShowTP4.ToString();
            }
            else
            {
                // NO DISCOUNT Scenario: 
                // 1. Original Price ko 0 set karein (Database mein 0 save hoga)
                OriginalPriceTP4 = 0;

                // 2. Discount Percentage ko 0 set karein
                DiscountShowTP4 = 0;
                TxtDiscountShowTP.Text = "0";
            }
        }
        else
        {
            // Agar parsing fail ho jaye (Non-numeric data), toh 0 set karein
            TxtDiscountShowTP.Text = "0";
            OriginalPriceTP4 = 0;
        }
        
        SqlCommand cmd1 = new SqlCommand("insert into TrendingProducts4(TrendingProduct4ID, TrendingimageTP4, TitleTP4, CurrentPriceTP4, OriginalPriceTP4, DiscountShowTP4, RatingTP4, ReviewCountTP4, IsNewTP4,  DisplayOrderTP4) values('" + TrendingProduct4ID + "', '" + TrendingimageTP4 + "', '" + TxtTitleTP4.Text + "', '" + TxtCurrentPriceTP4.Text + "', '" + TxtOriginalPriceTP4.Text + "', '" + TxtDiscountShowTP4.Text + "',  '" + TxtRatingTP4.Text + "', '" + TxtReviewCountTP4.Text + "', '" + TxtIsNewTP4.Text + "',  '" + TxtDisplayOrderTP4.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.TrendingProducts4();
        ClearFormTP4();
    }
    protected void btnUpdateTP4_Click(object sender, EventArgs e)
    {
        string TrendingimageTP4 = TrendingProduct4ID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload4.HasFile)
        {
            HttpPostedFile files1 = FileUpload4.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + TrendingimageTP4;
            int widthC1 = 0;
            int heightC1 = 0;
            Stream streamC1 = files1.InputStream;
            using (Bitmap imageC = new Bitmap(streamC1))
            {
                widthC1 = imageC.Width;
                heightC1 = imageC.Height;
                using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format32bppArgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
                    }
                }
            }
        }
        decimal OriginalPriceTP4 = 0;
        decimal CurrentPriceTP4 = 0;
        int DiscountShowTP4 = 0;

        // Inputs ko Parse karein
        if (decimal.TryParse(TxtOriginalPriceTP4.Text, out OriginalPriceTP4) &&
            decimal.TryParse(TxtCurrentPriceTP4.Text, out CurrentPriceTP4))
        {
            // Check 1: Original Price valid hona chahiye (OriginalPrice > 0)
            // Check 2: Genuine Discount hona chahiye (OriginalPrice > DiscountedPrice)
            if (OriginalPriceTP4 > 0 && OriginalPriceTP4 > CurrentPriceTP4)
            {
                // Discount Calculation Logic:
                decimal rawPercentage = ((OriginalPriceTP4 - CurrentPriceTP4) / OriginalPriceTP4) * 100;

                // Math.Round se percentage ko nearest whole number mein round karein
                DiscountShowTP4 = (int)Math.Round(rawPercentage);

                // Output ko textbox mein set karein
                TxtDiscountShowTP.Text = DiscountShowTP4.ToString();
            }
            else
            {
                // NO DISCOUNT Scenario: 
                // 1. Original Price ko 0 set karein (Database mein 0 save hoga)
                OriginalPriceTP4 = 0;

                // 2. Discount Percentage ko 0 set karein
                DiscountShowTP4 = 0;
                TxtDiscountShowTP.Text = "0";
            }
        }
        else
        {
            // Agar parsing fail ho jaye (Non-numeric data), toh 0 set karein
            TxtDiscountShowTP.Text = "0";
            OriginalPriceTP4 = 0;
        }
        
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update TrendingProducts4 set TrendingimageTP4='" + TrendingimageTP4 + "', TitleTP4='" + TxtTitleTP4.Text + "', CurrentPriceTP4='" + TxtCurrentPriceTP4.Text + "', OriginalPriceTP4='" + TxtOriginalPriceTP4.Text + "', DiscountShowTP4='" + TxtDiscountShowTP4.Text + "', RatingTP4='" + TxtRatingTP4.Text + "', ReviewCountTP4='" + TxtReviewCountTP4.Text + "', IsNewTP4='" + TxtIsNewTP4.Text + "', DisplayOrderTP4='" + TxtDisplayOrderTP4.Text + "' where TrendingProduct4ID='" + lblTrendingProduct4ID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.TrendingProducts4();
        ClearFormTP4();
    }
    private void ClearFormTP4()
    {
        TrendingimageTP4.ImageUrl = "";
        TxtTitleTP4.Text = "";
        TxtCurrentPriceTP4.Text = "";
        TxtOriginalPriceTP4.Text = "";
        TxtDiscountShowTP4.Text = "";
        TxtRatingTP4.Text = "";
        TxtReviewCountTP4.Text = "";
        TxtIsNewTP4.Text = "";
        TxtDisplayOrderTP4.Text = "";
        TrendingProduct4ID = "";
        btnUpdateTP4.Visible = false;

    }
    protected void TrendingProductsListView4_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            //tops
            string TrendingProduct4ID = e.CommandArgument.ToString();
            lblTrendingProduct4ID.Text = TrendingProduct4ID.ToString();
            lblTrendingProduct4ID.Text = (e.Item.FindControl("lblTrendingProduct4ID") as Label).Text;
            TrendingimageTP4.ImageUrl = "img/products/" + (e.Item.FindControl("lblTrendingimageTP4") as Label).Text;
            TxtTitleTP4.Text = (e.Item.FindControl("lblTitleTP4") as Label).Text;
            TxtDiscountShowTP4.Text = (e.Item.FindControl("lblDiscountShowTP4") as Label).Text;
            TxtRatingTP4.Text = (e.Item.FindControl("lblRatingTP4") as Label).Text;
            TxtReviewCountTP4.Text = (e.Item.FindControl("lblReviewCountTP4") as Label).Text;
            TxtIsNewTP4.Text = (e.Item.FindControl("lblIsNewTP4") as Label).Text;
            TxtCurrentPriceTP4.Text = (e.Item.FindControl("lblCurrentPriceTP4") as Label).Text;
            TxtOriginalPriceTP4.Text = (e.Item.FindControl("lblOriginalPriceTP4") as Label).Text;
            TxtDisplayOrderTP4.Text = (e.Item.FindControl("lblDisplayOrderTP4") as Label).Text;
            btnUpdateTP4.Visible = true;
            this.TrendingProducts4();
        }
        if (e.CommandName == "delete")
        {
            string TrendingProduct4ID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from TrendingProducts4 where TrendingProduct4ID=" + TrendingProduct4ID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@TrendingProduct4ID", TrendingProduct4ID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.TrendingProducts4();

        }
    }
    protected void TrendingProductsListView4_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void TrendingProductsListView4_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}