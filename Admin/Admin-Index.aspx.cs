using System;
using System.Collections.Generic;
using System.Configuration;
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
    //private string SliderID;
    //private string BannerID;
    //private string FlashSellID;
    private int OriginalPrice;
    private int DiscountPercentage;
    private int DiscountedPrice;
    //private string CountdownID;
    //private string CategoryID;
    //private string SpecialID;
    //private string SpecialProductID;
    //private string TrendingProductID;
    //private string BestSellingProductID;
    //private string ArrivalID;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            
            // Data binding logic will be added later
            //this.SliderData();
            //this.BannerData();
            //this.FeaturesData();
            //this.FlashSellData();
            //this.CountdwonData();
            //this.CategoriesData();
            //this.SpecialData();
            //this.SpecialProducts();
            //this.TrendingProducts();
            //this.BestSellingProducts();
            //this.NewarrivalProducts();


            // Populate Color Dropdown
            //var colors = new Dictionary<string, string>();
            //colors.Add("Red", "#FF0000");
            //colors.Add("Green", "#008000");
            //colors.Add("Blue", "#0000FF");
            //colors.Add("Orange","#FFA500");
            //colors.Add ("Yellow", "#FFFF00");
            //colors.Add ("Purple", "#800080");
            //colors.Add("Pink", "#FFC0CB");

            //ColorOptions.DataSource = colors;
            //ColorOptions.DataTextField = "Key";
            //ColorOptions.DataValueField = "Value";
            //ColorOptions.DataBind();


            //var colors2 = new Dictionary<string, string>();
            //colors2.Add("Red", "#FF0000");
            //colors2.Add("Green", "#008000");
            //colors2.Add("Blue", "#0000FF");
            //colors2.Add("Orange", "#FFA500");
            //colors2.Add("Yellow", "#FFFF00");
            //colors2.Add("Purple", "#800080");
            //colors2.Add("Pink", "#FFC0CB");

            //ColorOptions2.DataSource = colors2;
            //ColorOptions2.DataTextField = "Key";
            //ColorOptions2.DataValueField = "Value";
            //ColorOptions2.DataBind();

            //var colorsNA = new Dictionary<string, string>();
            //colorsNA.Add("Red", "#FF0000");
            //colorsNA.Add("Green", "#008000");
            //colorsNA.Add("Blue", "#0000FF");
            //colorsNA.Add("Orange", "#FFA500");
            //colorsNA.Add("Yellow", "#FFFF00");
            //colorsNA.Add("Purple", "#800080");
            //colorsNA.Add("Pink", "#FFC0CB");
            
            //ColorOptionsNA.DataSource = colorsNA;
            //ColorOptionsNA.DataTextField = "Key";
            //ColorOptionsNA.DataValueField = "Value";
            //ColorOptionsNA.DataBind();
        }
    }
    //private void SliderData()
    //{
    //    string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "SELECT * FROM Sliders"; // Added WHERE clause for active banners
    //            cmd.Connection = con;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                SliderListView.DataSource = dt;
    //                SliderListView.DataBind();
    //            }
    //        }
    //    }
    //}
   
    //protected void btnSubmit_Click(object sender, EventArgs e)
    //{
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    con.Open();
    //    SqlCommand cmdmax = new SqlCommand("select isnull(max(SliderID),0)+1 from Sliders", con);
    //    SliderID = cmdmax.ExecuteScalar().ToString();
    //    string Sliderimage = SliderID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
    //    if (FileUpload1.HasFile)
    //    {
    //        HttpPostedFile files = FileUpload1.PostedFile;
    //        string imgPath1 = "~/Admin/img/Slider/" + Sliderimage;
    //        int widthC = 0;
    //        int heightC = 0;
    //        Stream streamC = files.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC))
    //        {
    //            widthC = imageC.Width;  
    //            heightC = imageC.Height; 
    //            using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format24bppRgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
    //                }
    //            }
    //        }
    //    }
    //    SqlCommand cmd1 = new SqlCommand("insert into Sliders(SliderID, Sliderimage, Heading1, Heading2, LinkUrl, DisplayOrder) values('"+SliderID+"', '" + Sliderimage + "', '" + txtHeading1.Text + "', '" + txtHeading2.Text + "','" + txtLinkUrl.Text + "','" + txtDisplayOrder.Text + "')", con);
    //    cmd1.ExecuteNonQuery();
    //    con.Close();
    //    this.SliderData();
    //    ClearFormS();
    //}
    //protected void btnUpdate_Click(object sender, EventArgs e)
    //{
    //    string Sliderimage = SliderID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
    //    if (FileUpload1.HasFile)
    //    {
    //        HttpPostedFile files1 = FileUpload1.PostedFile;
    //        string imgPath1 = "~/Admin/img/Slider/" + Sliderimage;
    //        int widthC1 = 0;
    //        int heightC1 = 0;
    //        Stream streamC1 = files1.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC1))
    //        {
    //            widthC1 = imageC.Width;  
    //            heightC1 = imageC.Height; 
    //            using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format24bppRgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
    //                }
    //            }
    //        }
    //    }
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    string sql = "update Sliders set Sliderimage='" + Sliderimage + "', Heading1='" + txtHeading1.Text + "', Heading2='" + txtHeading2.Text + "', LinkUrl='" + txtLinkUrl.Text + "',DisplayOrder='" + txtDisplayOrder.Text + "' where sliderid='" + lblSliderID.Text + "' ";
    //    SqlCommand cmd = new SqlCommand(sql, con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    this.SliderData();
    //    ClearFormS();
    //}
    //private void ClearFormS()
    //{
    //    Sliderimage.ImageUrl = "";
    //    txtHeading1.Text = "";
    //    txtHeading2.Text = "";
    //    txtLinkUrl.Text = "";
    //    txtDisplayOrder.Text = "";
    //    lblSliderID.Text = "";
    //    btnUpdate.Visible = false;
    //}

    //protected void SliderListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "edit")
    //    {
    //        string SliderID = e.CommandArgument.ToString();
    //        lblSliderID.Text = SliderID.ToString();
    //        lblSliderID.Text = (e.Item.FindControl("lblSliderID") as Label).Text;
    //        Sliderimage.ImageUrl = "img/Slider/" + (e.Item.FindControl("lblSliderimage") as Label).Text;
    //        txtHeading1.Text = (e.Item.FindControl("lblHeading1") as Label).Text;
    //        txtHeading2.Text = (e.Item.FindControl("lblHeading2") as Label).Text;
    //        txtLinkUrl.Text = (e.Item.FindControl("lblLinkUrl") as Label).Text;
    //        txtDisplayOrder.Text = (e.Item.FindControl("lblDisplayOrder") as Label).Text;
    //        btnUpdate.Visible = true;
    //        this.SliderData();
    //    }
    //    if (e.CommandName == "delete")
    //    {
    //        string SliderID = e.CommandArgument.ToString();

    //        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //        string sql = "delete from Sliders where SliderID=" + SliderID + "";
    //        SqlCommand cmd = new SqlCommand(sql, con);
    //        con.Open();

    //        cmd.Parameters.AddWithValue("@SliderID", SliderID);
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        this.SliderData();
    //    }
    //}
    //protected void SliderListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{

    //}
    //protected void SliderListView_ItemEditing(object sender, ListViewEditEventArgs e)
    //{

    //}
    //private void BannerData() 
    //{
    //    string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "SELECT * FROM Banners"; // Added WHERE clause for active banners
    //            cmd.Connection = con;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                BannerListView.DataSource = dt;
    //                BannerListView.DataBind();
    //            }
    //        }
    //    }
    //}

    //protected void btnSubmitB_Click(object sender, EventArgs e)
    //{
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    con.Open();
    //    SqlCommand cmdmax = new SqlCommand("select isnull(max(BannerID),0)+1 from Banners", con);
    //    BannerID = cmdmax.ExecuteScalar().ToString();
    //    string Bannerimage = BannerID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
    //    if (FileUpload2.HasFile)
    //    {
    //        HttpPostedFile files = FileUpload2.PostedFile;
    //        string imgPath1 = "~/Admin/img/Banner/" + Bannerimage;
    //        int widthC = 0;
    //        int heightC = 0;
    //        Stream streamC = files.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC))
    //        {
    //            widthC = imageC.Width;
    //            heightC = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format24bppRgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
    //                }
    //            }
    //        }
    //    }
    //    SqlCommand cmd1 = new SqlCommand("insert into Banners(BannerID, Bannerimage, Head1, Head2, LinkUrl2, DisplayOrder2) values('" + BannerID + "', '" + Bannerimage + "', '" + txtHead1.Text + "', '" + txtHead2.Text + "','" + txtLinkUrl2.Text + "','" + txtDisplayOrder2.Text + "')", con);
    //    cmd1.ExecuteNonQuery();
    //    con.Close();
    //    this.BannerData();
    //    ClearFormB();
    //}
    //protected void btnUpdateB_Click(object sender, EventArgs e)
    //{
    //    string Bannerimage = BannerID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
    //    if (FileUpload2.HasFile)
    //    {
    //        HttpPostedFile files1 = FileUpload2.PostedFile;
    //        string imgPath1 = "~/Admin/img/Banner/" + Bannerimage;
    //        int widthC1 = 0;
    //        int heightC1 = 0;
    //        Stream streamC1 = files1.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC1))
    //        {
    //            widthC1 = imageC.Width;
    //            heightC1 = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format24bppRgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
    //                }
    //            }
    //        }
    //    }
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    string sql = "update Banners set Bannerimage='" + Bannerimage + "', Head1='" + txtHead1.Text + "', Head2='" + txtHead2.Text + "', LinkUrl2='" + txtLinkUrl2.Text + "',DisplayOrder2='" + txtDisplayOrder2.Text + "' where Bannerid='" + lblBannerID.Text + "' ";
    //    SqlCommand cmd = new SqlCommand(sql, con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    this.BannerData();
    //    ClearFormB();
    //}
    //private void ClearFormB()
    //{
    //    Bannerimage.ImageUrl = "";
    //    txtHead1.Text = "";
    //    txtHead2.Text = "";
    //    txtLinkUrl2.Text = "";
    //    txtDisplayOrder2.Text = "";
    //    lblBannerID.Text = "";
    //    btnUpdateB.Visible = false;
    //}

    //protected void BannerListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "edit")
    //    {
    //        string BannerID = e.CommandArgument.ToString();
    //        lblBannerID.Text = BannerID.ToString();
    //        lblBannerID.Text = (e.Item.FindControl("lblBannerID") as Label).Text;
    //        Bannerimage.ImageUrl = "img/Banner/" + (e.Item.FindControl("lblBannerimage") as Label).Text;
    //        txtHead1.Text = (e.Item.FindControl("lblHead1") as Label).Text;
    //        txtHead2.Text = (e.Item.FindControl("lblHead2") as Label).Text;
    //        txtLinkUrl2.Text = (e.Item.FindControl("lblLinkUrl2") as Label).Text;
    //        txtDisplayOrder2.Text = (e.Item.FindControl("lblDisplayOrder2") as Label).Text;
    //        btnUpdateB.Visible = true;
    //        this.BannerData();
    //    }
    //    if (e.CommandName == "delete")
    //    {
    //        string BannerID = e.CommandArgument.ToString();

    //        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //        string sql = "delete from Banners where BannerID=" + BannerID + "";
    //        SqlCommand cmd = new SqlCommand(sql, con);
    //        con.Open();

    //        cmd.Parameters.AddWithValue("@BannerID", BannerID);
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        this.BannerData();
    //    }
    //}
    //protected void BannerListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{

    //}
    //protected void BannerListView_ItemEditing(object sender, ListViewEditEventArgs e)
    //{

    //}

    //private void FeaturesData()
    //{
    //    string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "SELECT * FROM Features"; // Added WHERE clause for active banners
    //            cmd.Connection = con;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                FeaturesListView.DataSource = dt;
    //                FeaturesListView.DataBind();
    //            }
    //        }
    //    }
    //}
    //protected void FeaturesListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{

    //}
    //protected void FeaturesListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{

    //}
    //protected void FeaturesListView_ItemEditing(object sender, ListViewEditEventArgs e)
    //{

    //}

    //private void FlashSellData()
    //{
    //    string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "SELECT * FROM FlashSell"; // Added WHERE clause for active banners
    //            cmd.Connection = con;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                FlashSellListView.DataSource = dt;
    //                FlashSellListView.DataBind();
    //            }
    //        }
    //    }
    //}

    //protected void btnSubmitF_Click(object sender, EventArgs e)
    //{

    //    {
    //        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //        con.Open();
    //        SqlCommand cmdmax = new SqlCommand("select isnull(max(FlashSellID),0)+1 from FlashSell", con);
    //        FlashSellID = cmdmax.ExecuteScalar().ToString();
    //        string ProductImage = FlashSellID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".png";
    //        if (FileUpload3.HasFile)
    //        {
    //            HttpPostedFile files = FileUpload3.PostedFile;
    //            string imgPath1 = "~/Admin/img/products/" + ProductImage;
    //            int widthC = 0;
    //            int heightC = 0;
    //            Stream streamC = files.InputStream;
    //            using (Bitmap imageC = new Bitmap(streamC))
    //            {
    //                widthC = imageC.Width;
    //                heightC = imageC.Height;
    //                using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format32bppArgb))
    //                {
    //                    using (Graphics graphicC = Graphics.FromImage(targetC))
    //                    {
    //                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                        graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                        graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
    //                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
    //                    }
    //                }
    //            }
    //        }

    //        decimal OriginalPrice, DiscountedPrice;
    //        if (decimal.TryParse(txtOriginalPrice.Text, out OriginalPrice) &&
    //            decimal.TryParse(txtDiscountedPrice.Text, out DiscountedPrice))
    //        {
    //            if (OriginalPrice > 0)
    //            {
    //                int DiscountPercentage = (int)(((OriginalPrice - DiscountedPrice) * 100) / OriginalPrice);
    //                txtDiscountPercentage.Text = DiscountPercentage.ToString();
    //            }
    //        }
    //        // Get selected colors (comma-separated names)
    //        string selectedColors = string.Join(",", ColorOptions.SelectedItem.Text);
    //        if (ColorOptions.SelectedIndex > 0)
    //        {
    //            selectedColors = string.Join(",", ColorOptions.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Text));
    //        }
    //        SqlCommand cmd1 = new SqlCommand("INSERT INTO FlashSell (FlashSellID, ProductImage, Title, OriginalPrice, DiscountedPrice, DiscountPercentage, IsNew, Rating, ReviewCount, ColorOptions, DisplayOrderFS) VALUES ('" + FlashSellID + "', '" + ProductImage + "', '" + txtTitle.Text + "', '" + txtOriginalPrice.Text + "', '" + txtDiscountedPrice.Text + "', '" + txtDiscountPercentage.Text + "', '" + txtIsNew.Text + "', '" + txtRating.Text + "', '" + txtReviewCount.Text + "', '" + selectedColors + "', '" + txtDisplayOrderFS.Text + "')", con);
    //        cmd1.ExecuteNonQuery();
    //        con.Close();
    //        this.FlashSellData();
    //        ClearFormF();
    //    }
    //}
    //protected void btnUpdateF_Click(object sender, EventArgs e)
    //{
    //    string ProductImage = FlashSellID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".png";
    //    if (FileUpload3.HasFile)
    //    {
    //        HttpPostedFile files = FileUpload3.PostedFile;
    //        string imgPath1 = "~/Admin/img/products/" + ProductImage;
    //        int widthC = 0;
    //        int heightC = 0;
    //        Stream streamC = files.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC))
    //        {
    //            widthC = imageC.Width;
    //            heightC = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format32bppArgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
    //                }
    //            }
    //        }
    //    }

    //    decimal OriginalPrice, DiscountedPrice;
    //    if (decimal.TryParse(txtOriginalPrice.Text, out OriginalPrice) &&
    //        decimal.TryParse(txtDiscountedPrice.Text, out DiscountedPrice))
    //    {
    //        if (OriginalPrice > 0)
    //        {
    //            int DiscountPercentage = (int)(((OriginalPrice - DiscountedPrice) * 100) / OriginalPrice);
    //            txtDiscountPercentage.Text = DiscountPercentage.ToString();
    //        }
    //    }
    //    // Get selected colors (comma-separated names)
    //    string selectedColors = string.Join(",", ColorOptions.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Text));

    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    string sql = "update FlashSell set ProductImage='" + ProductImage + "', Title='" + txtTitle.Text + "', OriginalPrice='" + txtOriginalPrice.Text + "', DiscountedPrice='" + txtDiscountedPrice.Text + "',DiscountPercentage='" + txtDiscountPercentage.Text + "', IsNew='" + txtIsNew.Text + "', Rating='" + txtRating.Text + "', ReviewCount='" + txtReviewCount.Text + "', ColorOptions='" + selectedColors + "', DisplayOrderFS='" + txtDisplayOrderFS.Text + "' where FlashSellID='" + lblFlashSellID.Text + "' ";
    //    SqlCommand cmd = new SqlCommand(sql, con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    this.FlashSellData();
    //    ClearFormF();
    //}
    //private void ClearFormF()
    //{
    //    ProductImage.ImageUrl = "";
    //    txtTitle.Text = "";
    //    txtOriginalPrice.Text = "";
    //    txtDiscountedPrice.Text = "";
    //    txtDiscountPercentage.Text = "";
    //    txtIsNew.Text = "";
    //    txtRating.Text = "";
    //    txtReviewCount.Text = "";
    //    ColorOptions.ClearSelection();
    //    txtDisplayOrderFS.Text = "";
    //    //txtCountdownEndDate.Text = "";
    //    lblFlashSellID.Text = "";
    //    ColorOptions.ClearSelection();
    //    btnUpdateF.Visible = false;
    //}
    //protected void FlashSellListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "edit")
    //    {
    //        string FlashSellID = e.CommandArgument.ToString();
    //        lblFlashSellID.Text = FlashSellID.ToString();
    //        lblFlashSellID.Text = (e.Item.FindControl("lblFlashSellID") as Label).Text;
    //        ProductImage.ImageUrl = "img/products/" + (e.Item.FindControl("lblProductImage") as Label).Text;
    //        txtTitle.Text = (e.Item.FindControl("lblTitle") as Label).Text;
    //        txtOriginalPrice.Text = (e.Item.FindControl("lblOriginalPrice") as Label).Text;
    //        txtDiscountedPrice.Text = (e.Item.FindControl("lblDiscountedPrice") as Label).Text;
    //        txtDiscountPercentage.Text = (e.Item.FindControl("lblDiscountPercentage") as Label).Text;
    //        txtIsNew.Text = (e.Item.FindControl("lblIsNew") as Label).Text;
    //        txtRating.Text = (e.Item.FindControl("lblRating") as Label).Text;
    //        txtReviewCount.Text = (e.Item.FindControl("lblReviewCount") as Label).Text;
    //        string colorrr = (e.Item.FindControl("lblColorOptions") as Label).Text;

    //        if (!string.IsNullOrEmpty(colorrr))
    //        {
    //            // Split if multiple colors are stored like "#DB4437,#638C34"
    //            string[] colors = colorrr.Split(',');

    //            // Clear any previous selections
    //            ColorOptions.ClearSelection();

    //            foreach (string color in colors)
    //            {
    //                var item = ColorOptions.Items.FindByValue(color.Trim());
    //                if (item != null)
    //                {
    //                    item.Selected = true;
    //                }
    //            }
    //        }
    //        txtDisplayOrderFS.Text = (e.Item.FindControl("lblDisplayOrderFS") as Label).Text;
    //        btnUpdateF.Visible = true;
    //        this.FlashSellData();
    //        if (!string.IsNullOrEmpty(ColorOptions.Text))
    //        {
    //            string[] selectedColorNames = ColorOptions.Text.Split(',');
    //            foreach (ListItem item in ColorOptions.Items)
    //            {
    //                if (selectedColorNames.Contains(item.Text))
    //                {
    //                    item.Selected = true;
    //                }
    //            }
    //        }
    //    }
    //    if (e.CommandName == "delete")
    //    {
    //        string FlashSellID = e.CommandArgument.ToString();

    //        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //        string sql = "delete from FlashSell where FlashSellID=" + FlashSellID + "";
    //        SqlCommand cmd = new SqlCommand(sql, con);
    //        con.Open();

    //        cmd.Parameters.AddWithValue("@FlashSellID", FlashSellID);
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        this.FlashSellData();
    //    }
    //}
    //protected void FlashSellListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{

    //}
    //protected void FlashSellListView_ItemEditing(object sender, ListViewEditEventArgs e)
    //{
        
    //}
    //FlashSellDataCountdoWn//
    //private void CountdwonData()
    //{
    //    string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "SELECT * FROM CountdownEvents"; // Added WHERE clause for active banners
    //            cmd.Connection = con;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                CountdwonListView.DataSource = dt;
    //                CountdwonListView.DataBind();
    //            }
    //        }
    //    }
    //}
    //protected void btnSubmitCountdown_Click(object sender, EventArgs e)
    //{
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    con.Open();
    //    SqlCommand cmdmax = new SqlCommand("select isnull(max(CountdownID),0)+1 from CountdownEvents", con);
    //    CountdownID = cmdmax.ExecuteScalar().ToString();
    //    DateTime countdownEndDate = DateTime.MinValue;
    //    SqlCommand cmd1 = new SqlCommand("INSERT INTO CountdownEvents (CountdownID, EventName, CountdownEndDate, CountdownDisplayOrder) VALUES ('" + CountdownID + "','" + txtEventName.Text + "', '" + txtCountdownEndDate.Text + "', '" + txtCountdownDisplayOrder.Text + "')", con);
    //    cmd1.ExecuteNonQuery();
    //    con.Close();
    //    this.CountdwonData();
    //    ClearCountdownForm();
    //}
    //protected void btnUpdateCountdown_Click(object sender, EventArgs e)
    //{
    //    DateTime countdownEndDate = DateTime.MinValue;
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    string sql = "update CountdownEvents set EventName='" + txtEventName.Text + "', CountdownEndDate='" + txtCountdownEndDate.Text + "',  CountdownDisplayOrder='" + txtCountdownDisplayOrder.Text + "' where CountdownID='" + lblCountdownID.Text + "' ";
    //    SqlCommand cmd = new SqlCommand(sql, con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    this.CountdwonData();
    //    ClearCountdownForm();
    //}
    //private void ClearCountdownForm()
    //{
    //    txtEventName.Text = "";
    //    txtCountdownEndDate.Text = "";
    //    txtCountdownDisplayOrder.Text = "";
    //    lblCountdownID.Text = "";
    //    btnUpdateCountdown.Visible = false;
    //}
    //protected void CountdwonListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "edit")
    //    {
    //        string CountdownID = e.CommandArgument.ToString();
    //        lblCountdownID.Text = CountdownID.ToString();
    //        lblCountdownID.Text = (e.Item.FindControl("lblCountdownID") as Label).Text;
    //        txtEventName.Text = (e.Item.FindControl("lblEventName") as Label).Text;
    //        txtCountdownEndDate.Text = (e.Item.FindControl("lblCountdownEndDate") as Label).Text;
    //        txtCountdownDisplayOrder.Text = (e.Item.FindControl("lblCountdownDisplayOrder") as Label).Text;
    //        btnUpdateCountdown.Visible = true;
    //        this.CountdwonData();
    //    }
    //    if (e.CommandName == "delete")
    //    {
    //        string CountdownID = e.CommandArgument.ToString();

    //        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //        string sql = "delete from CountdownEvents where CountdownID=" + CountdownID + "";
    //        SqlCommand cmd = new SqlCommand(sql, con);
    //        con.Open();
    //        cmd.Parameters.AddWithValue("@CountdownID", CountdownID);
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        this.CountdwonData();
    //    }
    //}
    //protected void CountdwonListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{

    //}
    //protected void CountdwonListView_ItemEditing(object sender, ListViewEditEventArgs e)
    //{

    //}

    //private void CategoriesData()
    //{
    //    string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "SELECT * FROM Categoriespro"; // Added WHERE clause for active banners
    //            cmd.Connection = con;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                CategoriesListView.DataSource = dt;
    //                CategoriesListView.DataBind();
    //            }
    //        }
    //    }
    //}
    //protected void btnSubmitC_Click(object sender, EventArgs e)
    //{
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    con.Open();
    //    SqlCommand cmdmax = new SqlCommand("select isnull(max(CategoryID),0)+1 from Categoriespro", con);
    //    CategoryID = cmdmax.ExecuteScalar().ToString();
    //    String CateIconPath = CategoryID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".png";
    //    if (FileUpload4.HasFile)
    //    {
    //        HttpPostedFile files = FileUpload4.PostedFile;
    //        string imgPath1 = "~/Admin/img/categorypro/" + CateIconPath;
    //        int widthC = 0;
    //        int heightC = 0;
    //        Stream streamC = files.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC))
    //        {
    //            widthC = imageC.Width;
    //            heightC = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format32bppArgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
    //                }
    //            }
    //        }
    //    }
    //    SqlCommand cmd1 = new SqlCommand("INSERT INTO Categoriespro (CategoryID, CateIconPath, Title, DisplayOrderC) VALUES ('" + CategoryID + "', '" + CateIconPath + "', '" + txtTitleC.Text + "', '" + txtDisplayOrderC.Text + "')", con);
    //    cmd1.ExecuteNonQuery();
    //    con.Close();
    //    this.CategoriesData();
    //    ClearFormC();

    //}
    //protected void btnUpdateC_Click(object sender, EventArgs e)
    //{
    //    string CateIconPath = CategoryID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
    //    if (FileUpload4.HasFile)
    //    {
    //        HttpPostedFile files1 = FileUpload4.PostedFile;
    //        string imgPath1 = "~/Admin/img/categorypro/" + CateIconPath;
    //        int widthC1 = 0;
    //        int heightC1 = 0;
    //        Stream streamC1 = files1.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC1))
    //        {
    //            widthC1 = imageC.Width;
    //            heightC1 = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format32bppArgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
    //                }
    //            }
    //        }
    //    }
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    string sql = "update Categoriespro set CateIconPath='" + CateIconPath + "', Title='" + txtTitleC.Text + "', DisplayOrder2='" + txtDisplayOrderC.Text + "' where CategoryID='" + lblCategoryID.Text + "' ";
    //    SqlCommand cmd = new SqlCommand(sql, con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    this.CategoriesData();
    //    ClearFormC();
    //}
    //private void ClearFormC()
    //{
    //    CateIconPath.ImageUrl = "";
    //    txtTitleC.Text = "";
    //    txtDisplayOrderC.Text = "";
    //    lblCategoryID.Text = "";
    //    btnUpdateC.Visible = false;
    //}
    //protected void CategoriesListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "edit")
    //    {
    //        string CategoryID = e.CommandArgument.ToString();
    //        lblCategoryID.Text = CategoryID.ToString();
    //        lblCategoryID.Text = (e.Item.FindControl("lblCategoryID") as Label).Text;
    //        txtTitle.Text = (e.Item.FindControl("lblTitle") as Label).Text;
    //        txtDisplayOrderC.Text = (e.Item.FindControl("lblDisplayOrderC") as Label).Text;
    //        btnUpdateC.Visible = true;
    //        this.CategoriesData();

    //    }
    //    if (e.CommandName == "delete")
    //    {
    //        string CategoryID = e.CommandArgument.ToString();

    //        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //        string sql = "delete from Categoriespro where CategoryID=" + CategoryID + "";
    //        SqlCommand cmd = new SqlCommand(sql, con);
    //        con.Open();
    //        cmd.Parameters.AddWithValue("@CategoryID", CategoryID);
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        this.CategoriesData();

    //    }
    //}
    //protected void CategoriesListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{

    //}
    //protected void CategoriesListView_ItemEditing(object sender, ListViewEditEventArgs e)
    //{

    //}

    //private void SpecialData()
    //{
    //    string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "SELECT * FROM Special"; // Added WHERE clause for active banners
    //            cmd.Connection = con;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                SpecialListView.DataSource = dt;
    //                SpecialListView.DataBind();
    //            }
    //        }
    //    }
    //}
    //protected void btnSubmitOS_Click(object sender, EventArgs e)
    //{
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    con.Open();
    //    SqlCommand cmdmax = new SqlCommand("select isnull(max(SpecialID),0)+1 from Special", con);
    //    SpecialID = cmdmax.ExecuteScalar().ToString();
    //    string Specialimage = SpecialID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
    //    if (FileUpload5.HasFile)
    //    {
    //        HttpPostedFile files = FileUpload5.PostedFile;
    //        string imgPath1 = "~/Admin/img/SpecialSlider/" + Specialimage;
    //        int widthC = 0;
    //        int heightC = 0;
    //        Stream streamC = files.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC))
    //        {
    //            widthC = imageC.Width;
    //            heightC = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format24bppRgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
    //                }
    //            }
    //        }
    //    }
    //    SqlCommand cmd1 = new SqlCommand("insert into Special(SpecialID, Specialimage, TitleOS, DiscountOS, LinkUrlOS, DisplayOrderOS) values('" + SpecialID + "', '" + Specialimage + "', '" + TxtTitleOS.Text + "', '" + TxtDiscountOS.Text + "','" + TxtLinkUrlOS.Text + "','" + txtDisplayOrderOS.Text + "')", con);
    //    cmd1.ExecuteNonQuery();
    //    con.Close();
    //    this.SpecialData();
    //    ClearFormOS();
    //}
    //protected void btnUpdateOS_Click(object sender, EventArgs e)
    //{


    //    string Specialimage = SpecialID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
    //    if (FileUpload5.HasFile)
    //    {
    //        HttpPostedFile files1 = FileUpload5.PostedFile;
    //        string imgPath1 = "~/Admin/img/SpecialSlider/" + Specialimage;
    //        int widthC1 = 0;
    //        int heightC1 = 0;
    //        Stream streamC1 = files1.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC1))
    //        {
    //            widthC1 = imageC.Width;
    //            heightC1 = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format24bppRgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
    //                }
    //            }
    //        }
    //    }
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    string sql = "update Special set Specialimage='" + Specialimage + "', TitleOS='" + TxtTitleOS.Text + "', DiscountOS='" + TxtDiscountOS.Text + "', LinkUrlOS='" + TxtLinkUrlOS.Text + "',DisplayOrderOS='" + txtDisplayOrderOS.Text + "' where SpecialID='" + lblSpecialID.Text + "' ";
    //    SqlCommand cmd = new SqlCommand(sql, con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    this.SpecialData();
    //    ClearFormOS();
    //}
    //private void ClearFormOS()
    //{
    //    Specialimage.ImageUrl = "";
    //    TxtTitleOS.Text = "";
    //    TxtDiscountOS.Text = "";
    //    TxtLinkUrlOS.Text = "";
    //    txtDisplayOrderOS.Text = "";
    //    SpecialID = "";
    //    btnUpdateOS.Visible = false;
    //}
    //protected void SpecialListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "edit")
    //    {
    //        string SpecialID = e.CommandArgument.ToString();
    //        lblSpecialID.Text = SpecialID.ToString();
    //        lblSpecialID.Text = (e.Item.FindControl("lblSpecialID") as Label).Text;
    //        Specialimage.ImageUrl = "img/SpecialSlider/" + (e.Item.FindControl("lblSpecialimage") as Label).Text;
    //        TxtTitleOS.Text = (e.Item.FindControl("lblTitleOS") as Label).Text;
    //        TxtDiscountOS.Text = (e.Item.FindControl("lblDiscountOS") as Label).Text;
    //        TxtLinkUrlOS.Text = (e.Item.FindControl("lblLinkUrlOS") as Label).Text;
    //        txtDisplayOrderOS.Text = (e.Item.FindControl("lblDisplayOrderOS") as Label).Text;
    //        btnUpdateOS.Visible = true;
    //        this.SpecialData();

    //    }
    //    if (e.CommandName == "delete")
    //    {
    //        string SpecialID = e.CommandArgument.ToString();

    //        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //        string sql = "delete from Special where SpecialID=" + SpecialID + "";
    //        SqlCommand cmd = new SqlCommand(sql, con);
    //        con.Open();
    //        cmd.Parameters.AddWithValue("@SpecialID", SpecialID);
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        this.SpecialData();

    //    }
    //}
    //protected void SpecialListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{

    //}
    //protected void SpecialListView_ItemEditing(object sender, ListViewEditEventArgs e)
    //{

    //}

    //private void SpecialProducts()
    //{
    //    string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "SELECT * FROM SpecialProducts"; // Added WHERE clause for active banners
    //            cmd.Connection = con;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                SpecialProductsListView.DataSource = dt;
    //                SpecialProductsListView.DataBind();
    //            }
    //        }
    //    }
    //}

    //protected void btnSubmitSP_Click(object sender, EventArgs e)
    //{
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    con.Open();
    //    SqlCommand cmdmax = new SqlCommand("select isnull(max(SpecialProductID),0)+1 from SpecialProducts", con);
    //    SpecialProductID = cmdmax.ExecuteScalar().ToString();
    //    string SpecialimageSP = SpecialProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
    //    if (FileUpload6.HasFile)
    //    {
    //        HttpPostedFile files = FileUpload6.PostedFile;
    //        string imgPath1 = "~/Admin/img/products/" + SpecialimageSP;
    //        int widthC = 0;
    //        int heightC = 0;
    //        Stream streamC = files.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC))
    //        {
    //            widthC = imageC.Width;
    //            heightC = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format32bppArgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
    //                }
    //            }
    //        }
    //    }
    //    decimal CurrentPrice, OriginalPriceSP;
    //    if (decimal.TryParse(TxtCurrentPrice.Text, out CurrentPrice) &&
    //        decimal.TryParse(TxtOriginalPriceSP.Text, out OriginalPriceSP))
    //    {
    //        if (CurrentPrice > 0)
    //        {
    //            int DiscountText = (int)(((CurrentPrice - OriginalPriceSP) * 100) / CurrentPrice);
    //            TxtDiscountText.Text = DiscountText.ToString();

    //        }
    //    }
    //    SqlCommand cmd1 = new SqlCommand("insert into SpecialProducts(SpecialProductID, SpecialimageSP, TitleSP, DiscountText, RatingSP, CurrentPrice, OriginalPriceSP, DisplayOrderSP) values('" + TrendingProductID + "', '" + SpecialimageSP + "', '" + TxtTitleSP.Text + "', '" + TxtDiscountText.Text + "','" + TxtRatingSP.Text + "', '" + TxtCurrentPrice.Text + "', '" + TxtOriginalPriceSP.Text + "', '" + TxtDisplayOrderSP.Text + "')", con);
    //    cmd1.ExecuteNonQuery();
    //    con.Close();
    //    this.SpecialProducts();
    //    ClearFormSP();
    //}
    //protected void btnUpdateSP_Click(object sender, EventArgs e)
    //{
    //    string SpecialimageSP = SpecialProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
    //    if (FileUpload6.HasFile)
    //    {
    //        HttpPostedFile files1 = FileUpload6.PostedFile;
    //        string imgPath1 = "~/Admin/img/products/" + SpecialimageSP;
    //        int widthC1 = 0;
    //        int heightC1 = 0;
    //        Stream streamC1 = files1.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC1))
    //        {
    //            widthC1 = imageC.Width;
    //            heightC1 = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format24bppRgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
    //                }
    //            }
    //        }
    //    }
    //    decimal CurrentPrice, OriginalPriceSP;
    //    if (decimal.TryParse(TxtCurrentPrice.Text, out CurrentPrice) &&
    //        decimal.TryParse(TxtOriginalPriceSP.Text, out OriginalPriceSP))
    //    {
    //        if (CurrentPrice > 0)
    //        {
    //            int DiscountText = (int)(((CurrentPrice - OriginalPriceSP) * 100) / CurrentPrice);
    //            TxtDiscountText.Text = DiscountText.ToString();

    //        }
    //    }
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    string sql = "update SpecialProducts set SpecialimageSP='" + SpecialimageSP + "', TitleSP='" + TxtTitleSP.Text + "', DiscountText='" + TxtDiscountText.Text + "', RatingSP='" + TxtRatingSP.Text + "', CurrentPrice='" + TxtCurrentPrice.Text + "', OriginalPriceSP='" + TxtOriginalPriceSP.Text + "' ,DisplayOrderSP='" + TxtDisplayOrderSP.Text + "' where SpecialProductID='" + lblSpecialProductID.Text + "' ";
    //    SqlCommand cmd = new SqlCommand(sql, con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    this.SpecialProducts();
    //    ClearFormSP();
    //}

    //private void ClearFormSP()
    //{
    //    SpecialimageSP.ImageUrl = "";
    //    TxtTitleSP.Text = "";
    //    TxtDiscountText.Text = "";
    //    TxtRatingSP.Text = "";
    //    TxtCurrentPrice.Text = "";
    //    TxtOriginalPriceSP.Text = "";
    //    TxtDisplayOrderSP.Text = "";
    //    SpecialProductID = "";
    //    btnUpdateSP.Visible = false;
    //}
    //protected void SpecialProductsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "edit")
    //    {
    //        string SpecialProductID = e.CommandArgument.ToString();
    //        lblSpecialProductID.Text = SpecialProductID.ToString();
    //        lblSpecialProductID.Text = (e.Item.FindControl("lblSpecialProductID") as Label).Text;
    //        SpecialimageSP.ImageUrl = "img/products/" + (e.Item.FindControl("lblSpecialimageSP") as Label).Text;
    //        TxtTitleSP.Text = (e.Item.FindControl("lblTitleSP") as Label).Text;
    //        TxtDiscountText.Text = (e.Item.FindControl("lblDiscountText") as Label).Text;
    //        TxtRatingSP.Text = (e.Item.FindControl("lblRatingSP") as Label).Text;
    //        TxtCurrentPrice.Text = (e.Item.FindControl("lblCurrentPrice") as Label).Text;
    //        TxtOriginalPriceSP.Text = (e.Item.FindControl("lblOriginalPriceSP") as Label).Text;
    //        TxtDisplayOrderSP.Text = (e.Item.FindControl("lblDisplayOrderSP") as Label).Text;
    //        btnUpdateSP.Visible = true;
    //        this.SpecialProducts();

    //    }
    //    if (e.CommandName == "delete")
    //    {
    //        string SpecialProductID = e.CommandArgument.ToString();

    //        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //        string sql = "delete from SpecialProducts where SpecialProductID=" + SpecialProductID + "";
    //        SqlCommand cmd = new SqlCommand(sql, con);
    //        con.Open();
    //        cmd.Parameters.AddWithValue("@SpecialProductID", SpecialProductID);
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        this.SpecialProducts();

    //    }
    //}
    //protected void SpecialProductsListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{

    //}
    //protected void SpecialProductsListView_ItemEditing(object sender, ListViewEditEventArgs e)
    //{

    //}
    //private void TrendingProducts()
    //{
    //    string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "SELECT * FROM TrendingProducts"; // Added WHERE clause for active banners
    //            cmd.Connection = con;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                TrendingProductsListView.DataSource = dt;
    //                TrendingProductsListView.DataBind();
    //            }
    //        }
    //    }
    //}

    //protected void btnSubmitTP_Click(object sender, EventArgs e)
    //{
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    con.Open();
    //    SqlCommand cmdmax = new SqlCommand("select isnull(max(TrendingProductID),0)+1 from TrendingProducts", con);
    //    TrendingProductID = cmdmax.ExecuteScalar().ToString();
    //    string TrendingimageTP = TrendingProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
    //    if (FileUpload7.HasFile)
    //    {
    //        HttpPostedFile files = FileUpload7.PostedFile;
    //        string imgPath1 = "~/Admin/img/products/" + TrendingimageTP;
    //        int widthC = 0;
    //        int heightC = 0;
    //        Stream streamC = files.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC))
    //        {
    //            widthC = imageC.Width;
    //            heightC = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format32bppArgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
    //                }
    //            }
    //        }
    //    }
    //    decimal CurrentPriceTP, OriginalPriceTP;
    //    if (decimal.TryParse(TxtCurrentPriceTP.Text, out CurrentPriceTP) &&
    //        decimal.TryParse(TxtOriginalPriceTP.Text, out OriginalPriceTP))
    //    {
    //        if (CurrentPriceTP > 0)
    //        {
    //            int DiscountShowTP = (int)(((CurrentPriceTP - OriginalPriceTP) * 100) / CurrentPriceTP);
    //            TxtDiscountShowTP.Text = DiscountShowTP.ToString();

    //        }
    //    }
    //    // Get selected colors (comma-separated names)
    //    string selectedColors2 = string.Join(",", ColorOptions2.SelectedItem.Text);
    //    if (ColorOptions2.SelectedIndex > 0)
    //    {
    //        selectedColors2 = string.Join(",", ColorOptions2.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Text));
    //    }
    //    SqlCommand cmd1 = new SqlCommand("insert into TrendingProducts(TrendingProductID, TrendingimageTP, TitleTP, CurrentPriceTP, OriginalPriceTP, DiscountShowTP, RatingTP, ReviewCountTP, IsNewTP, ColorOptions2, DisplayOrderTP) values('" + TrendingProductID + "', '" + TrendingimageTP + "', '" + TxtTitleTP.Text + "', '" + TxtCurrentPriceTP.Text + "', '" + TxtOriginalPriceTP.Text + "', '" + TxtDiscountShowTP.Text + "',  '" + TxtRatingTP.Text + "', '" + TxtReviewCountTP.Text + "', '" + TxtIsNewTP.Text + "', '" + selectedColors2 + "', '" + TxtDisplayOrderTP.Text + "')", con);
    //    cmd1.ExecuteNonQuery();
    //    con.Close();
    //    this.TrendingProducts();
    //    ClearFormTP();
    //}
    //protected void btnUpdateTP_Click(object sender, EventArgs e)
    //{
    //    string TrendingimageTP = TrendingProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
    //    if (FileUpload7.HasFile)
    //    {
    //        HttpPostedFile files1 = FileUpload7.PostedFile;
    //        string imgPath1 = "~/Admin/img/products/" + TrendingimageTP;
    //        int widthC1 = 0;
    //        int heightC1 = 0;
    //        Stream streamC1 = files1.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC1))
    //        {
    //            widthC1 = imageC.Width;
    //            heightC1 = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format32bppArgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
    //                }
    //            }
    //        }
    //    }
    //    decimal CurrentPriceTP, OriginalPriceTP;
    //    if (decimal.TryParse(TxtCurrentPriceTP.Text, out CurrentPriceTP) &&
    //        decimal.TryParse(TxtOriginalPriceTP.Text, out OriginalPriceTP))
    //    {
    //        if (CurrentPriceTP > 0)
    //        {
    //            int DiscountShowTP = (int)(((CurrentPriceTP - OriginalPriceTP) * 100) / CurrentPriceTP);
    //            TxtDiscountShowTP.Text = DiscountShowTP.ToString();

    //        }
    //    }
    //    // Get selected colors (comma-separated names)
    //    string selectedColors2 = string.Join(",", ColorOptions2.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Text));
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    string sql = "update TrendingProducts set TrendingimageTP='" + TrendingimageTP + "', TitleTP='" + TxtTitleTP.Text + "', CurrentPriceTP='" + TxtCurrentPriceTP.Text + "', OriginalPriceTP='" + TxtOriginalPriceTP.Text + "', DiscountShowTP='" + TxtDiscountShowTP.Text + "', RatingTP='" + TxtRatingTP.Text + "', ReviewCountTP='" + TxtReviewCountTP.Text + "', IsNewTP='" + TxtIsNewTP.Text + "', ColorOptions2='" + selectedColors2 + "' ,DisplayOrderTP='" + TxtDisplayOrderTP.Text + "' where TrendingProductID='" + lblTrendingProductID.Text + "' ";
    //    SqlCommand cmd = new SqlCommand(sql, con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    this.TrendingProducts();
    //    ClearFormTP();
    //}
    //private void ClearFormTP()
    //{
    //    TrendingimageTP.ImageUrl = "";
    //    TxtTitleTP.Text = "";
    //    TxtCurrentPriceTP.Text = "";
    //    TxtOriginalPriceTP.Text = "";
    //    TxtDiscountShowTP.Text = "";
    //    TxtRatingTP.Text = ""; 
    //    TxtReviewCountTP.Text = "";
    //    TxtIsNewTP.Text = "";
    //    ColorOptions2.ClearSelection();
    //    TxtDisplayOrderTP.Text = "";
    //    TrendingProductID = "";
    //    btnUpdateTP.Visible = false;

    //}
    //protected void TrendingProductsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "edit")
    //    {
    //        string TrendingProductID = e.CommandArgument.ToString();
    //        lblTrendingProductID.Text = TrendingProductID.ToString();
    //        lblTrendingProductID.Text = (e.Item.FindControl("lblTrendingProductID") as Label).Text;
    //        TrendingimageTP.ImageUrl = "img/products/" + (e.Item.FindControl("lblTrendingimageTP") as Label).Text;
    //        TxtTitleTP.Text = (e.Item.FindControl("lblTitleTP") as Label).Text;
    //        TxtDiscountShowTP.Text = (e.Item.FindControl("lblDiscountShowTP") as Label).Text;
    //        TxtRatingTP.Text = (e.Item.FindControl("lblRatingTP") as Label).Text;
    //        TxtCurrentPriceTP.Text = (e.Item.FindControl("lblCurrentPriceTP") as Label).Text;
    //        TxtOriginalPriceTP.Text = (e.Item.FindControl("lblOriginalPriceTP") as Label).Text;
    //        TxtDisplayOrderTP.Text = (e.Item.FindControl("lblDisplayOrderTP") as Label).Text;
    //        btnUpdateTP.Visible = true;
    //        this.TrendingProducts();

    //    }
    //    if (e.CommandName == "delete")
    //    {
    //        string TrendingProductID = e.CommandArgument.ToString();

    //        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //        string sql = "delete from TrendingProducts where TrendingProductID=" + TrendingProductID + "";
    //        SqlCommand cmd = new SqlCommand(sql, con);
    //        con.Open();
    //        cmd.Parameters.AddWithValue("@TrendingProductID", TrendingProductID);
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        this.TrendingProducts();

    //    }
    //}
    //protected void TrendingProductsListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{

    //}
    //protected void TrendingProductsListView_ItemEditing(object sender, ListViewEditEventArgs e)
    //{

    //}

    //private void BestSellingProducts()
    //{
    //    string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "SELECT * FROM BestSellingProducts"; // Added WHERE clause for active banners
    //            cmd.Connection = con;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                BestSellingProductListView.DataSource = dt;
    //                BestSellingProductListView.DataBind();
    //            }
    //        }
    //    }
    //}

    //protected void btnSubmitBS_Click(object sender, EventArgs e)
    //{
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    con.Open();
    //    SqlCommand cmdmax = new SqlCommand("select isnull(max(BestSellingProductID),0)+1 from BestSellingProducts", con);
    //    BestSellingProductID = cmdmax.ExecuteScalar().ToString();
    //    string BestSellingimage = BestSellingProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
    //    if (FileUpload8.HasFile)
    //    {
    //        HttpPostedFile files = FileUpload8.PostedFile;
    //        string imgPath1 = "~/Admin/img/BSELLP/" + BestSellingimage;
    //        int widthC = 0;
    //        int heightC = 0;
    //        Stream streamC = files.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC))
    //        {
    //            widthC = imageC.Width;
    //            heightC = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format32bppArgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
    //                }
    //            }
    //        }
    //    }
    //    decimal CurrentPriceBS, OriginalPriceBS;
    //    if (decimal.TryParse(TxtCurrentPriceBS.Text, out CurrentPriceBS) &&
    //        decimal.TryParse(TxtOriginalPriceBS.Text, out OriginalPriceBS))
    //    {
         
    //    }
    //    SqlCommand cmd1 = new SqlCommand("insert into BestSellingProducts(BestSellingProductID, BestSellingimage, TitleBS, CurrentPriceBS, OriginalPriceBS, LinkUrlBS, DisplayOrderBS) values('" + BestSellingProductID + "', '" + BestSellingimage + "', '" + TxtTitleBS.Text + "', '" + TxtCurrentPriceBS.Text + "', '" + TxtOriginalPriceBS.Text + "', '" + TxtLinkUrlBS.Text + "', '" + TxtDisplayOrderBS.Text + "')", con);
    //    cmd1.ExecuteNonQuery();
    //    con.Close();
    //    this.BestSellingProducts();
    //    ClearFormBS();
    //}
    //protected void btnUpdateBS_Click(object sender, EventArgs e)
    //{
    //    string BestSellingimage = BestSellingProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
    //    if (FileUpload8.HasFile)
    //    {
    //        HttpPostedFile files1 = FileUpload8.PostedFile;
    //        string imgPath1 = "~/Admin/img/BSELLP/" + BestSellingimage;
    //        int widthC1 = 0;
    //        int heightC1 = 0;
    //        Stream streamC1 = files1.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC1))
    //        {
    //            widthC1 = imageC.Width;
    //            heightC1 = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format24bppRgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
    //                }
    //            }
    //        }
    //    }
    //    decimal CurrentPriceBS, OriginalPriceBS;
    //    if (decimal.TryParse(TxtCurrentPriceBS.Text, out CurrentPriceBS) &&
    //        decimal.TryParse(TxtOriginalPriceBS.Text, out OriginalPriceBS))
    //    {

    //    }
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    string sql = "update BestSellingProducts set BestSellingimage='" + BestSellingimage + "', TitleSP='" + TxtTitleBS.Text + "', CurrentPriceBS='" + TxtCurrentPriceBS.Text + "', OriginalPriceBS" + TxtOriginalPriceBS.Text + "', LinkUrlBS='" + TxtLinkUrlBS.Text + "' ,DisplayOrderBS='" + TxtDisplayOrderBS.Text + "' where BestSellingProductID='" + lblBestSellingProductID.Text + "' ";
    //    SqlCommand cmd = new SqlCommand(sql, con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    this.BestSellingProducts();
    //    ClearFormBS();
    //}
    //private void ClearFormBS()
    //{
    //    BestSellingimage.ImageUrl = "";
    //    TxtTitleBS.Text = "";
    //    TxtCurrentPriceBS.Text = "";
    //    TxtOriginalPriceBS.Text = "";
    //    TxtLinkUrlBS.Text = "";
    //    TxtDisplayOrderBS.Text = "";
    //    BestSellingProductID = "";
    //    btnUpdateBS.Visible = false;

    //}
    //protected void BestSellingProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "edit")
    //    {
    //        string BestSellingProductID = e.CommandArgument.ToString();
    //        lblBestSellingProductID.Text = BestSellingProductID.ToString();
    //        lblBestSellingProductID.Text = (e.Item.FindControl("lblBestSellingProductID") as Label).Text;
    //        BestSellingimage.ImageUrl = "Admin/img/BSELLP/" + (e.Item.FindControl("lblBestSellingimage") as Label).Text;
    //        TxtTitleBS.Text = (e.Item.FindControl("lblTitleBS") as Label).Text;
    //        TxtCurrentPriceBS.Text = (e.Item.FindControl("lblCurrentPriceBS") as Label).Text;
    //        TxtOriginalPriceBS.Text = (e.Item.FindControl("lblOriginalPriceBS") as Label).Text;
    //        TxtLinkUrlBS.Text = (e.Item.FindControl("lblLinkUrlBS") as Label).Text;
    //        TxtDisplayOrderBS.Text = (e.Item.FindControl("lblDisplayOrderBS") as Label).Text;
    //        btnUpdateBS.Visible = true;
    //        this.BestSellingProducts();

    //    }
    //    if (e.CommandName == "delete")
    //    {
    //        string BestSellingProductID = e.CommandArgument.ToString();

    //        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //        string sql = "delete from BestSellingProducts where BestSellingProductID=" + BestSellingProductID + "";
    //        SqlCommand cmd = new SqlCommand(sql, con);
    //        con.Open();
    //        cmd.Parameters.AddWithValue("@BestSellingProductID", BestSellingProductID);
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        this.BestSellingProducts();

    //    }
    //}
    //protected void BestSellingProducts_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{

    //}
    //protected void BestSellingProducts_ItemEditing(object sender, ListViewEditEventArgs e)
    //{

    //}

    //private void NewarrivalProducts()
    //{
    //    string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "SELECT * FROM NewarrivalProducts"; // Added WHERE clause for active banners
    //            cmd.Connection = con;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                NewArrivalListView.DataSource = dt;
    //                NewArrivalListView.DataBind();
    //            }
    //        }
    //    }
    //}
    //protected void btnSubmitNA_Click(object sender, EventArgs e)
    //{
    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    con.Open();
    //    SqlCommand cmdmax = new SqlCommand("select isnull(max(ArrivalID),0)+1 from NewarrivalProducts", con);
    //    ArrivalID = cmdmax.ExecuteScalar().ToString();
    //    string ArrivalImage = ArrivalID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".png";
    //    if (FileUpload9.HasFile)
    //    {
    //        HttpPostedFile files = FileUpload9.PostedFile;
    //        string imgPath1 = "~/Admin/img/products/" + ArrivalImage;
    //        int widthC = 0;
    //        int heightC = 0;
    //        Stream streamC = files.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC))
    //        {
    //            widthC = imageC.Width;
    //            heightC = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format32bppArgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
    //                }
    //            }
    //        }
    //    }

        
    //    // Get selected colors (comma-separated names)
    //    string selectedColorsNA = string.Join(",", ColorOptionsNA.SelectedItem.Text);
    //    if (ColorOptionsNA.SelectedIndex > 0)
    //    {
    //        selectedColorsNA = string.Join(",", ColorOptionsNA.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Text));
    //    }
    //    SqlCommand cmd1 = new SqlCommand("INSERT INTO NewarrivalProducts (ArrivalID, ArrivalImage, TitleNA, OriginalPriceNA, IsNewNA, RatingNA, ReviewCountNA, ColorOptionsNA, DisplayOrderNA) VALUES ('" + ArrivalID + "', '" + ArrivalImage + "', '" + TxtTitleNA.Text + "', '" + TxtOriginalPriceNA.Text + "', '" + TxtIsNewNA.Text + "', '" + TxtRatingNA.Text + "', '" + TxtReviewCountNA.Text + "', '" + selectedColorsNA + "', '" + TxtDisplayOrderNA.Text + "')", con);
    //    cmd1.ExecuteNonQuery();
    //    con.Close();
    //    this.NewarrivalProducts();
    //    ClearFormNA();
    //}
    //protected void btnUpdateNA_Click(object sender, EventArgs e)
    //{
    //    string ArrivalImage = ArrivalID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".png";
    //    if (FileUpload9.HasFile)
    //    {
    //        HttpPostedFile files = FileUpload9.PostedFile;
    //        string imgPath1 = "~/Admin/img/products/" + ArrivalImage;
    //        int widthC = 0;
    //        int heightC = 0;
    //        Stream streamC = files.InputStream;
    //        using (Bitmap imageC = new Bitmap(streamC))
    //        {
    //            widthC = imageC.Width;
    //            heightC = imageC.Height;
    //            using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format32bppArgb))
    //            {
    //                using (Graphics graphicC = Graphics.FromImage(targetC))
    //                {
    //                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
    //                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
    //                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
    //                    graphicC.CompositingMode = CompositingMode.SourceCopy;
    //                    graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
    //                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Png);
    //                }
    //            }
    //        }
    //    }

        
    //    // Get selected colors (comma-separated names)
    //    string selectedColorsNA = string.Join(",", ColorOptionsNA.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Text));

    //    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //    string sql = "update NewarrivalProducts set ArrivalImage='" + ArrivalImage + "', TitleNA='" + TxtTitleNA.Text + "', OriginalPriceNA='" + TxtOriginalPriceNA.Text + "', IsNewNA='" + TxtIsNewNA.Text + "', RatingNA='" + TxtRatingNA.Text + "', ReviewCountNA='" + TxtReviewCountNA.Text + "', ColorOptionsNA='" + selectedColorsNA + "', DisplayOrderNA='" + TxtDisplayOrderNA.Text + "' where ArrivalID='" + lblArrivalID.Text + "' ";
    //    SqlCommand cmd = new SqlCommand(sql, con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    this.NewarrivalProducts();
    //    ClearFormNA();
    //}
    //private void ClearFormNA()
    //{
    //    ArrivalImage.ImageUrl = "";
    //    TxtTitleNA.Text = "";
    //    TxtOriginalPriceNA.Text = "";
    //    TxtIsNewNA.Text = "";
    //    TxtRatingNA.Text = "";
    //    TxtReviewCountNA.Text = "";
    //    ColorOptionsNA.ClearSelection();
    //    TxtDisplayOrderNA.Text = "";
    //    lblArrivalID.Text = "";
    //    btnUpdateNA.Visible = false;

    //}
    //protected void NewArrivalListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "edit")
    //    {
    //        string ArrivalID = e.CommandArgument.ToString();
    //        lblArrivalID.Text = ArrivalID.ToString();
    //        lblArrivalID.Text = (e.Item.FindControl("lblArrivalID") as Label).Text;
    //        ArrivalImage.ImageUrl = "img/products/" + (e.Item.FindControl("lblArrivalImage") as Label).Text;
    //        TxtTitleNA.Text = (e.Item.FindControl("lblTitleNA") as Label).Text;
    //        TxtOriginalPriceNA.Text = (e.Item.FindControl("lblOriginalPriceNA") as Label).Text;
    //        TxtIsNewNA.Text = (e.Item.FindControl("lblIsNewNA") as Label).Text;
    //        TxtRatingNA.Text = (e.Item.FindControl("lblRatingNA") as Label).Text;
    //        TxtReviewCountNA.Text = (e.Item.FindControl("lblReviewCountNA") as Label).Text;
    //        btnUpdateNA.Visible = true;
    //        string colorNA = (e.Item.FindControl("lblColorOptionsNA") as Label).Text;

    //        if (!string.IsNullOrEmpty(colorNA))
    //        {
    //            // Split if multiple colors are stored like "#DB4437,#638C34"
    //            string[] colors = colorNA.Split(',');

    //            // Clear any previous selections
    //            ColorOptionsNA.ClearSelection();

    //            foreach (string color in colors)
    //            {
    //                var item = ColorOptionsNA.Items.FindByValue(color.Trim());
    //                if (item != null)
    //                {
    //                    item.Selected = true;
    //                }
    //            }
    //        }
    //        TxtDisplayOrderNA.Text = (e.Item.FindControl("lblDisplayOrderNA") as Label).Text;
    //        btnUpdateNA.Visible = true;
    //        this.NewarrivalProducts();
    //        if (!string.IsNullOrEmpty(ColorOptionsNA.Text))
    //        {
    //            string[] selectedColorNames = ColorOptionsNA.Text.Split(',');
    //            foreach (ListItem item in ColorOptionsNA.Items)
    //            {
    //                if (selectedColorNames.Contains(item.Text))
    //                {
    //                    item.Selected = true;
    //                }
    //            }
    //        }
    //    }
    //    if (e.CommandName == "delete")
    //    {
    //        string FlashSellID = e.CommandArgument.ToString();

    //        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
    //        string sql = "delete from FlashSell where FlashSellID=" + FlashSellID + "";
    //        SqlCommand cmd = new SqlCommand(sql, con);
    //        con.Open();

    //        cmd.Parameters.AddWithValue("@FlashSellID", FlashSellID);
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        this.NewarrivalProducts();
    //    }
    //}
    //protected void NewArrivalListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{

    //}
    //protected void NewArrivalListView_ItemEditing(object sender, ListViewEditEventArgs e)
    //{

    //}

    
}