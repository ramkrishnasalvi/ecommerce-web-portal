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
    string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
    private string ShopProductID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.ProductsShopData();
        }
    }
    private void ProductsShopData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM ProductsShop"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ShopListView.DataSource = dt;
                    ShopListView.DataBind();
                }
            }
        }
    }

    protected void btnSubmitF_Click(object sender, EventArgs e)
    {

        {
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            con.Open();
            SqlCommand cmdmax = new SqlCommand("select isnull(max(ShopProductID),0)+1 from ProductsShop", con);
            ShopProductID = cmdmax.ExecuteScalar().ToString();
            string Shopimage = ShopProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".png";
            if (FileUpload1.HasFile)
            {
                HttpPostedFile files = FileUpload1.PostedFile;
                string imgPath1 = "~/Admin/img/products/" + Shopimage;
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

            decimal OriginalPrice = 0;
            decimal DiscountedPrice = 0;
            int DiscountPercentage = 0;

            // Inputs ko Parse karein
            if (decimal.TryParse(txtOriginalPrice.Text, out OriginalPrice) &&
                decimal.TryParse(txtDiscountedPrice.Text, out DiscountedPrice))
            {
                // Check 1: Original Price valid hona chahiye (OriginalPrice > 0)
                // Check 2: Genuine Discount hona chahiye (OriginalPrice > DiscountedPrice)
                if (OriginalPrice > 0 && OriginalPrice > DiscountedPrice)
                {
                    // Discount Calculation Logic:
                    decimal rawPercentage = ((OriginalPrice - DiscountedPrice) / OriginalPrice) * 100;

                    // Math.Round se percentage ko nearest whole number mein round karein
                    DiscountPercentage = (int)Math.Round(rawPercentage);

                    // Output ko textbox mein set karein
                    txtDiscountPercentage.Text = DiscountPercentage.ToString();
                }
                else
                {
                    // NO DISCOUNT Scenario: 
                    // 1. Original Price ko 0 set karein (Database mein 0 save hoga)
                    OriginalPrice = 0;

                    // 2. Discount Percentage ko 0 set karein
                    DiscountPercentage = 0;
                    txtDiscountPercentage.Text = "0";
                }
            }
            else
            {
                // Agar parsing fail ho jaye (Non-numeric data), toh 0 set karein
                txtDiscountPercentage.Text = "0";
                OriginalPrice = 0;
            }
            SqlCommand cmd1 = new SqlCommand("INSERT INTO ProductsShop (ShopProductID, Shopimage, Title, OriginalPrice, DiscountedPrice, DiscountPercentage, IsNew, Rating, ReviewCount, DisplayOrder) VALUES ('" + ShopProductID + "', '" + Shopimage + "', '" + txtTitle.Text + "', '" + txtOriginalPrice.Text + "', '" + txtDiscountedPrice.Text + "', '" + txtDiscountPercentage.Text + "', '" + txtIsNew.Text + "', '" + txtRating.Text + "', '" + txtReviewCount.Text + "','" + txtDisplayOrder.Text + "')", con);
            cmd1.ExecuteNonQuery();
            con.Close();
            this.ProductsShopData();
            ClearFormF();
        }
    }
    protected void btnUpdateF_Click(object sender, EventArgs e)
    {
        string Shopimage = ShopProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".png";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + Shopimage;
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

        decimal OriginalPrice = 0;
        decimal DiscountedPrice = 0;
        int DiscountPercentage = 0;

        // Inputs ko Parse karein
        if (decimal.TryParse(txtOriginalPrice.Text, out OriginalPrice) &&
            decimal.TryParse(txtDiscountedPrice.Text, out DiscountedPrice))
        {
            // Check 1: Original Price valid hona chahiye (OriginalPrice > 0)
            // Check 2: Genuine Discount hona chahiye (OriginalPrice > DiscountedPrice)
            if (OriginalPrice > 0 && OriginalPrice > DiscountedPrice)
            {
                // Discount Calculation Logic:
                decimal rawPercentage = ((OriginalPrice - DiscountedPrice) / OriginalPrice) * 100;

                // Math.Round se percentage ko nearest whole number mein round karein
                DiscountPercentage = (int)Math.Round(rawPercentage);

                // Output ko textbox mein set karein
                txtDiscountPercentage.Text = DiscountPercentage.ToString();
            }
            else
            {
                // NO DISCOUNT Scenario: 
                // 1. Original Price ko 0 set karein (Database mein 0 save hoga)
                OriginalPrice = 0;

                // 2. Discount Percentage ko 0 set karein
                DiscountPercentage = 0;
                txtDiscountPercentage.Text = "0";
            }
        }
        else
        {
            // Agar parsing fail ho jaye (Non-numeric data), toh 0 set karein
            txtDiscountPercentage.Text = "0";
            OriginalPrice = 0;
        }

        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update ProductsShop set Shopimage='" + Shopimage + "', Title='" + txtTitle.Text + "', OriginalPrice='" + txtOriginalPrice.Text + "', DiscountedPrice='" + txtDiscountedPrice.Text + "',DiscountPercentage='" + txtDiscountPercentage.Text + "', IsNew='" + txtIsNew.Text + "', Rating='" + txtRating.Text + "', ReviewCount='" + txtReviewCount.Text + "', DisplayOrder='" + txtDisplayOrder.Text + "' where ShopProductID='" + lblShopProductID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.ProductsShopData();
        ClearFormF();
    }
    private void ClearFormF()
    {
        Shopimage.ImageUrl = "";
        txtTitle.Text = "";
        txtOriginalPrice.Text = "";
        txtDiscountedPrice.Text = "";
        txtDiscountPercentage.Text = "";
        txtIsNew.Text = "";
        txtRating.Text = "";
        txtReviewCount.Text = "";
        txtDisplayOrder.Text = "";
        lblShopProductID.Text = "";
        btnUpdateF.Visible = false;
    }
    protected void ProductsShopListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string ShopProductID = e.CommandArgument.ToString();
            lblShopProductID.Text = ShopProductID.ToString();
            lblShopProductID.Text = (e.Item.FindControl("lblShopProductID") as Label).Text;
            Shopimage.ImageUrl = "img/products/" + (e.Item.FindControl("lblShopimage") as Label).Text;
            txtTitle.Text = (e.Item.FindControl("lblTitle") as Label).Text;
            txtOriginalPrice.Text = (e.Item.FindControl("lblOriginalPrice") as Label).Text;
            txtDiscountedPrice.Text = (e.Item.FindControl("lblDiscountedPrice") as Label).Text;
            txtDiscountPercentage.Text = (e.Item.FindControl("lblDiscountPercentage") as Label).Text;
            txtIsNew.Text = (e.Item.FindControl("lblIsNew") as Label).Text;
            txtRating.Text = (e.Item.FindControl("lblRating") as Label).Text;
            txtReviewCount.Text = (e.Item.FindControl("lblReviewCount") as Label).Text;
            txtDisplayOrder.Text = (e.Item.FindControl("lblDisplayOrderFS") as Label).Text;
            btnUpdateF.Visible = true;
            this.ProductsShopData();

        }
        if (e.CommandName == "delete")
        {
            string ShopProductID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from ProductsShop where ShopProductID=" + ShopProductID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();

            cmd.Parameters.AddWithValue("@ShopProductID", ShopProductID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.ProductsShopData();
        }
    }
    protected void ProductsShopListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void ProductsShopListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}