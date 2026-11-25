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
    private string FlashSellID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.FlashSellData();
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

    protected void btnSubmitF_Click(object sender, EventArgs e)
    {

        {
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            con.Open();
            SqlCommand cmdmax = new SqlCommand("select isnull(max(FlashSellID),0)+1 from FlashSell", con);
            FlashSellID = cmdmax.ExecuteScalar().ToString();
            string ProductImage = FlashSellID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".png";
            if (FileUpload3.HasFile)
            {
                HttpPostedFile files = FileUpload3.PostedFile;
                string imgPath1 = "~/Admin/img/products/" + ProductImage;
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
            SqlCommand cmd1 = new SqlCommand("INSERT INTO FlashSell (FlashSellID, ProductImage, Title, OriginalPrice, DiscountedPrice, DiscountPercentage, IsNew, Rating, ReviewCount, DisplayOrderFS) VALUES ('" + FlashSellID + "', '" + ProductImage + "', '" + txtTitle.Text + "', '" + txtOriginalPrice.Text + "', '" + txtDiscountedPrice.Text + "', '" + txtDiscountPercentage.Text + "', '" + txtIsNew.Text + "', '" + txtRating.Text + "', '" + txtReviewCount.Text + "','" + txtDisplayOrderFS.Text + "')", con);
            cmd1.ExecuteNonQuery();
            con.Close();
            this.FlashSellData();
            ClearFormF();
        }
    }
    protected void btnUpdateF_Click(object sender, EventArgs e)
    {
        string ProductImage = FlashSellID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".png";
        if (FileUpload3.HasFile)
        {
            HttpPostedFile files = FileUpload3.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + ProductImage;
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
        string sql = "update FlashSell set ProductImage='" + ProductImage + "', Title='" + txtTitle.Text + "', OriginalPrice='" + txtOriginalPrice.Text + "', DiscountedPrice='" + txtDiscountedPrice.Text + "',DiscountPercentage='" + txtDiscountPercentage.Text + "', IsNew='" + txtIsNew.Text + "', Rating='" + txtRating.Text + "', ReviewCount='" + txtReviewCount.Text + "', DisplayOrderFS='" + txtDisplayOrderFS.Text + "' where FlashSellID='" + lblFlashSellID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.FlashSellData();
        ClearFormF();
    }
    private void ClearFormF()
    {
        ProductImage.ImageUrl = "";
        txtTitle.Text = "";
        txtOriginalPrice.Text = "";
        txtDiscountedPrice.Text = "";
        txtDiscountPercentage.Text = "";
        txtIsNew.Text = "";
        txtRating.Text = "";
        txtReviewCount.Text = "";
        txtDisplayOrderFS.Text = "";
        lblFlashSellID.Text = "";
        btnUpdateF.Visible = false;
    }
    protected void FlashSellListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string FlashSellID = e.CommandArgument.ToString();
            lblFlashSellID.Text = FlashSellID.ToString();
            lblFlashSellID.Text = (e.Item.FindControl("lblFlashSellID") as Label).Text;
            ProductImage.ImageUrl = "img/products/" + (e.Item.FindControl("lblProductImage") as Label).Text;
            txtTitle.Text = (e.Item.FindControl("lblTitle") as Label).Text;
            txtOriginalPrice.Text = (e.Item.FindControl("lblOriginalPrice") as Label).Text;
            txtDiscountedPrice.Text = (e.Item.FindControl("lblDiscountedPrice") as Label).Text;
            txtDiscountPercentage.Text = (e.Item.FindControl("lblDiscountPercentage") as Label).Text;
            txtIsNew.Text = (e.Item.FindControl("lblIsNew") as Label).Text;
            txtRating.Text = (e.Item.FindControl("lblRating") as Label).Text;
            txtReviewCount.Text = (e.Item.FindControl("lblReviewCount") as Label).Text;
            txtDisplayOrderFS.Text = (e.Item.FindControl("lblDisplayOrderFS") as Label).Text;
            btnUpdateF.Visible = true;
            this.FlashSellData();
            
        }
        if (e.CommandName == "delete")
        {
            string FlashSellID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from FlashSell where FlashSellID=" + FlashSellID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();

            cmd.Parameters.AddWithValue("@FlashSellID", FlashSellID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.FlashSellData();
        }
    }
    protected void FlashSellListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void FlashSellListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}