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
    private string BannerBID;
    private string FavoriteID;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.bundleBanner();
            this.FavoriteProduct();
        }
    }
    private void bundleBanner()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM BundleBanner"; // Added WHERE clause for active banners
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
    protected void btnSubmitB_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(BannerBID),0)+1 from BundleBanner", con);
        BannerBID = cmdmax.ExecuteScalar().ToString();
        string BannerImageB = BannerBID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload10.HasFile)
        {
            HttpPostedFile files = FileUpload10.PostedFile;
            string imgPath1 = "~/Admin/img/SpecialSlider/" + BannerImageB;
            int widthC = 0;
            int heightC = 0;
            Stream streamC = files.InputStream;
            using (Bitmap imageC = new Bitmap(streamC))
            {
                widthC = imageC.Width;
                heightC = imageC.Height;
                using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format24bppRgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
                    }
                }
            }
        }
        SqlCommand cmd1 = new SqlCommand("insert into BundleBanner(BannerBID, BannerImageB, TitleB, DiscountTextB, OfferTextB, DisplayOrderB) values('" + BannerBID + "', '" + BannerImageB + "', '" + TxtTitleB.Text + "', '" + TxtDiscountTextB.Text + "','" + TxtOfferTextB.Text + "','" + TxtDisplayOrderB.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.bundleBanner();
        ClearFormB();
    }
    protected void btnUpdateB_Click(object sender, EventArgs e)
    {
        string BannerImageB = BannerBID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload10.HasFile)
        {
            HttpPostedFile files1 = FileUpload10.PostedFile;
            string imgPath1 = "~/Admin/img/SpecialSlider/" + BannerImageB;
            int widthC1 = 0;
            int heightC1 = 0;
            Stream streamC1 = files1.InputStream;
            using (Bitmap imageC = new Bitmap(streamC1))
            {
                widthC1 = imageC.Width;
                heightC1 = imageC.Height;
                using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format24bppRgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
                    }
                }
            }
        }
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update BundleBanner set BannerImageB='" + BannerImageB + "', TitleB='" + TxtTitleB.Text + "', DiscountTextB='" + TxtDiscountTextB.Text + "', OfferTextB='" + TxtOfferTextB.Text + "',DisplayOrderB='" + TxtDisplayOrderB.Text + "' where BannerBID='" + lblBannerBID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.bundleBanner();
        ClearFormB();
    }
    private void ClearFormB()
    {
        BannerImageB.ImageUrl = "";
        TxtTitleB.Text = "";
        TxtDiscountTextB.Text = "";
        TxtOfferTextB.Text = "";
        TxtDisplayOrderB.Text = "";
        BannerBID = "";
        btnUpdateB.Visible = false;
    }
    protected void bundleBannerListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string SpecialID = e.CommandArgument.ToString();
            lblBannerBID.Text = SpecialID.ToString();
            lblBannerBID.Text = (e.Item.FindControl("lblBannerBID") as Label).Text;
            BannerImageB.ImageUrl = "img/SpecialSlider/" + (e.Item.FindControl("lblBannerImageB") as Label).Text;
            TxtTitleB.Text = (e.Item.FindControl("lblTitleB") as Label).Text;
            TxtDiscountTextB.Text = (e.Item.FindControl("lblDiscountTextB") as Label).Text;
            TxtOfferTextB.Text = (e.Item.FindControl("lblOfferTextB") as Label).Text;
            TxtDisplayOrderB.Text = (e.Item.FindControl("lblDisplayOrderB") as Label).Text;
            btnUpdateB.Visible = true;
            this.bundleBanner();

        }
        if (e.CommandName == "delete")
        {
            string BannerBID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from BundleBanner where BannerBID=" + BannerBID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@BannerBID", BannerBID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.bundleBanner();

        }
    }
    protected void bundleBannerListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void bundleBannerListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    private void FavoriteProduct()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM FavoriteProducts"; // Added WHERE clause for active banners
                cmd.Connection = con;
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
    protected void btnSubmitF_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(FavoriteID),0)+1 from FavoriteProducts", con);
        FavoriteID = cmdmax.ExecuteScalar().ToString();
        string FavoriteImage = FavoriteID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + FavoriteImage;
            int widthC = 0;
            int heightC = 0;
            Stream streamC = files.InputStream;
            using (Bitmap imageC = new Bitmap(streamC))
            {
                widthC = imageC.Width;
                heightC = imageC.Height;
                using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format24bppRgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
                    }
                }
            }
        }
        SqlCommand cmd1 = new SqlCommand("insert into FavoriteProducts(FavoriteID, FavoriteImage, TitleF, CurrentPriceF, OriginalPriceF,DiscountShowF, IsNewF, RatingF, ReviewCountF, DisplayOrderF) values('" + FavoriteID + "', '" + FavoriteImage + "', '" + TxtTitleF.Text + "', '" + TxtCurrentPriceF.Text + "','" + TxtOriginalPriceF.Text + "', '" + TxtDiscountShowF.Text + "', '" + TxtIsNewF.Text + "', '" + TxtRatingF.Text + "', '" + TxtReviewCountF.Text + "','" + TxtDisplayOrderF.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.FavoriteProduct();
        ClearFormF();
    }
    protected void btnUpdateF_Click(object sender, EventArgs e)
    {
        string FavoriteID = FavoriteImage + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files1 = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + FavoriteImage;
            int widthC1 = 0;
            int heightC1 = 0;
            Stream streamC1 = files1.InputStream;
            using (Bitmap imageC = new Bitmap(streamC1))
            {
                widthC1 = imageC.Width;
                heightC1 = imageC.Height;
                using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format24bppRgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
                    }
                }
            }
        }
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update FavoriteProducts set FavoriteImage='" + FavoriteImage + "', TitleF='" + TxtTitleF.Text + "', CurrentPriceF='" + TxtCurrentPriceF.Text + "', OriginalPriceF='" + TxtOriginalPriceF.Text + "', DiscountShowF='" + TxtDiscountShowF.Text + "', IsNewF='" + TxtIsNewF.Text + "', RatingF='" + TxtRatingF.Text + "', ReviewCountF='" + TxtReviewCountF.Text + "', DisplayOrderF='" + TxtDisplayOrderF.Text + "' where FavoriteID='" + lblFavoriteID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.FavoriteProduct();
        ClearFormF();
    }
    private void ClearFormF()
    {
        FavoriteImage.ImageUrl = "";
        TxtTitleF.Text = "";
        TxtCurrentPriceF.Text = "";
        TxtOriginalPriceF.Text = "";
        TxtDiscountShowF.Text = "";
        TxtIsNewF.Text = "";
        TxtRatingF.Text = "";
        TxtReviewCountF.Text = "";
        TxtDisplayOrderF.Text = "";
        FavoriteID = "";
        btnUpdateF.Visible = false;
    }
    protected void FavoriteListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string FavoriteID = e.CommandArgument.ToString();
            lblFavoriteID.Text = FavoriteID.ToString();
            lblFavoriteID.Text = (e.Item.FindControl("lblFavoriteID") as Label).Text;
            FavoriteImage.ImageUrl = "Admin/img/products/" + (e.Item.FindControl("lblFavoriteImage") as Label).Text;
            TxtTitleF.Text = (e.Item.FindControl("lblTitleF") as Label).Text;
            TxtCurrentPriceF.Text = (e.Item.FindControl("lblCurrentPriceF") as Label).Text;
            TxtOriginalPriceF.Text = (e.Item.FindControl("lblOriginalPriceF") as Label).Text;
            TxtDiscountShowF.Text = (e.Item.FindControl("lblDiscountShowF") as Label).Text;
            TxtIsNewF.Text = (e.Item.FindControl("lblIsNewF") as Label).Text;
            TxtRatingF.Text = (e.Item.FindControl("lblRatingF") as Label).Text;
            TxtReviewCountF.Text = (e.Item.FindControl("lblReviewCountF") as Label).Text;
            TxtDisplayOrderF.Text = (e.Item.FindControl("lblDisplayOrderF") as Label).Text;
            btnUpdateF.Visible = true;
            this.FavoriteProduct();

        }
        if (e.CommandName == "delete")
        {
            string FavoriteID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from FavoriteProducts where FavoriteID=" + FavoriteID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@FavoriteID", FavoriteID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.FavoriteProduct();

        }
    }
    protected void FavoriteListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void FavoriteListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}