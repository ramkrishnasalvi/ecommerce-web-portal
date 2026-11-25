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
    private string SpecialProductID;
    private string SpecialID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.SpecialProducts();
            this.SpecialData();
        }
    }

    private void SpecialData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Special"; // Added WHERE clause for active banners
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
    protected void btnSubmitOS_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(SpecialID),0)+1 from Special", con);
        SpecialID = cmdmax.ExecuteScalar().ToString();
        string Specialimage = SpecialID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload5.HasFile)
        {
            HttpPostedFile files = FileUpload5.PostedFile;
            string imgPath1 = "~/Admin/img/SpecialSlider/" + Specialimage;
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
        SqlCommand cmd1 = new SqlCommand("insert into Special(SpecialID, Specialimage, TitleOS, DiscountOS, LinkUrlOS, DisplayOrderOS) values('" + SpecialID + "', '" + Specialimage + "', '" + TxtTitleOS.Text + "', '" + TxtDiscountOS.Text + "','" + TxtLinkUrlOS.Text + "','" + txtDisplayOrderOS.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.SpecialData();
        ClearFormOS();
    }
    protected void btnUpdateOS_Click(object sender, EventArgs e)
    {


        string Specialimage = SpecialID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload5.HasFile)
        {
            HttpPostedFile files1 = FileUpload5.PostedFile;
            string imgPath1 = "~/Admin/img/SpecialSlider/" + Specialimage;
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
        string sql = "update Special set Specialimage='" + Specialimage + "', TitleOS='" + TxtTitleOS.Text + "', DiscountOS='" + TxtDiscountOS.Text + "', LinkUrlOS='" + TxtLinkUrlOS.Text + "',DisplayOrderOS='" + txtDisplayOrderOS.Text + "' where SpecialID='" + lblSpecialID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.SpecialData();
        ClearFormOS();
    }
    private void ClearFormOS()
    {
        Specialimage.ImageUrl = "";
        TxtTitleOS.Text = "";
        TxtDiscountOS.Text = "";
        TxtLinkUrlOS.Text = "";
        txtDisplayOrderOS.Text = "";
        SpecialID = "";
        btnUpdateOS.Visible = false;
    }
    protected void SpecialListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string SpecialID = e.CommandArgument.ToString();
            lblSpecialID.Text = SpecialID.ToString();
            lblSpecialID.Text = (e.Item.FindControl("lblSpecialID") as Label).Text;
            Specialimage.ImageUrl = "img/SpecialSlider/" + (e.Item.FindControl("lblSpecialimage") as Label).Text;
            TxtTitleOS.Text = (e.Item.FindControl("lblTitleOS") as Label).Text;
            TxtDiscountOS.Text = (e.Item.FindControl("lblDiscountOS") as Label).Text;
            TxtLinkUrlOS.Text = (e.Item.FindControl("lblLinkUrlOS") as Label).Text;
            txtDisplayOrderOS.Text = (e.Item.FindControl("lblDisplayOrderOS") as Label).Text;
            btnUpdateOS.Visible = true;
            this.SpecialData();

        }
        if (e.CommandName == "delete")
        {
            string SpecialID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from Special where SpecialID=" + SpecialID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@SpecialID", SpecialID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.SpecialData();

        }
    }
    protected void SpecialListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void SpecialListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }

    private void SpecialProducts()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM SpecialProducts"; // Added WHERE clause for active banners
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

    protected void btnSubmitSP_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(SpecialProductID),0)+1 from SpecialProducts", con);
        SpecialProductID = cmdmax.ExecuteScalar().ToString();
        string SpecialimageSP = SpecialProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload6.HasFile)
        {
            HttpPostedFile files = FileUpload6.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + SpecialimageSP;
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
        decimal CurrentPrice, OriginalPriceSP;
        if (decimal.TryParse(TxtCurrentPrice.Text, out CurrentPrice) &&
            decimal.TryParse(TxtOriginalPriceSP.Text, out OriginalPriceSP))
        {
            if (CurrentPrice > 0)
            {
                int DiscountText = (int)(((CurrentPrice - OriginalPriceSP) * 100) / CurrentPrice);
                TxtDiscountText.Text = DiscountText.ToString();

            }
        }
        SqlCommand cmd1 = new SqlCommand("insert into SpecialProducts(SpecialProductID, SpecialimageSP, TitleSP, DiscountText, RatingSP, CurrentPrice, OriginalPriceSP, DisplayOrderSP) values('" + SpecialProductID + "', '" + SpecialimageSP + "', '" + TxtTitleSP.Text + "', '" + TxtDiscountText.Text + "','" + TxtRatingSP.Text + "', '" + TxtCurrentPrice.Text + "', '" + TxtOriginalPriceSP.Text + "', '" + TxtDisplayOrderSP.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.SpecialProducts();
        ClearFormSP();
    }
    protected void btnUpdateSP_Click(object sender, EventArgs e)
    {
        string SpecialimageSP = SpecialProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload6.HasFile)
        {
            HttpPostedFile files1 = FileUpload6.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + SpecialimageSP;
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
        decimal CurrentPrice, OriginalPriceSP;
        if (decimal.TryParse(TxtCurrentPrice.Text, out CurrentPrice) &&
            decimal.TryParse(TxtOriginalPriceSP.Text, out OriginalPriceSP))
        {
            if (CurrentPrice > 0)
            {
                int DiscountText = (int)(((CurrentPrice - OriginalPriceSP) * 100) / CurrentPrice);
                TxtDiscountText.Text = DiscountText.ToString();

            }
        }
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update SpecialProducts set SpecialimageSP='" + SpecialimageSP + "', TitleSP='" + TxtTitleSP.Text + "', DiscountText='" + TxtDiscountText.Text + "', RatingSP='" + TxtRatingSP.Text + "', CurrentPrice='" + TxtCurrentPrice.Text + "', OriginalPriceSP='" + TxtOriginalPriceSP.Text + "' ,DisplayOrderSP='" + TxtDisplayOrderSP.Text + "' where SpecialProductID='" + lblSpecialProductID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.SpecialProducts();
        ClearFormSP();
    }

    private void ClearFormSP()
    {
        SpecialimageSP.ImageUrl = "";
        TxtTitleSP.Text = "";
        TxtDiscountText.Text = "";
        TxtRatingSP.Text = "";
        TxtCurrentPrice.Text = "";
        TxtOriginalPriceSP.Text = "";
        TxtDisplayOrderSP.Text = "";
        SpecialProductID = "";
        btnUpdateSP.Visible = false;
    }
    protected void SpecialProductsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string SpecialProductID = e.CommandArgument.ToString();
            lblSpecialProductID.Text = SpecialProductID.ToString();
            lblSpecialProductID.Text = (e.Item.FindControl("lblSpecialProductID") as Label).Text;
            SpecialimageSP.ImageUrl = "img/products/" + (e.Item.FindControl("lblSpecialimageSP") as Label).Text;
            TxtTitleSP.Text = (e.Item.FindControl("lblTitleSP") as Label).Text;
            TxtDiscountText.Text = (e.Item.FindControl("lblDiscountText") as Label).Text;
            TxtRatingSP.Text = (e.Item.FindControl("lblRatingSP") as Label).Text;
            TxtCurrentPrice.Text = (e.Item.FindControl("lblCurrentPrice") as Label).Text;
            TxtOriginalPriceSP.Text = (e.Item.FindControl("lblOriginalPriceSP") as Label).Text;
            TxtDisplayOrderSP.Text = (e.Item.FindControl("lblDisplayOrderSP") as Label).Text;
            btnUpdateSP.Visible = true;
            this.SpecialProducts();

        }
        if (e.CommandName == "delete")
        {
            string SpecialProductID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from SpecialProducts where SpecialProductID=" + SpecialProductID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@SpecialProductID", SpecialProductID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.SpecialProducts();

        }
    }
    protected void SpecialProductsListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void SpecialProductsListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}