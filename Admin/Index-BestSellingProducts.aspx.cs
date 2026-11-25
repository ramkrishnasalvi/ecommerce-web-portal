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
    private string BestSellingProductID;
    private string BestSellingProduct2ID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.BestSellingProducts();
        }

    }
    private void BestSellingProducts()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM BestSellingProducts"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    BestSellingProductListView.DataSource = dt;
                    BestSellingProductListView.DataBind();
                }
            }
        }
    }

    protected void btnSubmitBS_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(BestSellingProductID),0)+1 from BestSellingProducts", con);
        BestSellingProductID = cmdmax.ExecuteScalar().ToString();
        string BestSellingimage = BestSellingProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload8.HasFile)
        {
            HttpPostedFile files = FileUpload8.PostedFile;
            string imgPath1 = "~/Admin/img/BSELLP/" + BestSellingimage;
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

        decimal CurrentPriceBS, OriginalPriceBS;
        if (decimal.TryParse(TxtCurrentPriceBS.Text, out CurrentPriceBS) &&
            decimal.TryParse(TxtOriginalPriceBS.Text, out OriginalPriceBS))
        {

        }
        SqlCommand cmd1 = new SqlCommand("insert into BestSellingProducts(BestSellingProductID, BestSellingimage, TitleBS, CurrentPriceBS, OriginalPriceBS, LinkUrlBS, DisplayOrderBS) values('" + BestSellingProductID + "', '" + BestSellingimage + "', '" + TxtTitleBS.Text + "', '" + TxtCurrentPriceBS.Text + "', '" + TxtOriginalPriceBS.Text + "', '" + TxtLinkUrlBS.Text + "', '" + TxtDisplayOrderBS.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.BestSellingProducts();
        ClearFormBS();
    }
    protected void btnUpdateBS_Click(object sender, EventArgs e)
    {
        string BestSellingimage = BestSellingProductID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload8.HasFile)
        {
            HttpPostedFile files1 = FileUpload8.PostedFile;
            string imgPath1 = "~/Admin/img/BSELLP/" + BestSellingimage;
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
        decimal CurrentPriceBS, OriginalPriceBS;
        if (decimal.TryParse(TxtCurrentPriceBS.Text, out CurrentPriceBS) &&
            decimal.TryParse(TxtOriginalPriceBS.Text, out OriginalPriceBS))
        {

        }
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update BestSellingProducts set BestSellingimage='" + BestSellingimage + "', TitleBS='" + TxtTitleBS.Text + "', CurrentPriceBS='" + TxtCurrentPriceBS.Text + "', OriginalPriceBS='" + TxtOriginalPriceBS.Text + "', LinkUrlBS='" + TxtLinkUrlBS.Text + "' ,DisplayOrderBS='" + TxtDisplayOrderBS.Text + "' where BestSellingProductID='" + lblBestSellingProductID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.BestSellingProducts();
        ClearFormBS();
    }
    private void ClearFormBS()
    {
        BestSellingimage.ImageUrl = "";
        TxtTitleBS.Text = "";
        TxtCurrentPriceBS.Text = "";
        TxtOriginalPriceBS.Text = "";
        TxtLinkUrlBS.Text = "";
        TxtDisplayOrderBS.Text = "";
        BestSellingProductID = "";
        btnUpdateBS.Visible = false;

    }
    protected void BestSellingProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string BestSellingProductID = e.CommandArgument.ToString();
            lblBestSellingProductID.Text = BestSellingProductID.ToString();
            lblBestSellingProductID.Text = (e.Item.FindControl("lblBestSellingProductID") as Label).Text;
            BestSellingimage.ImageUrl = "Admin/img/BSELLP/" + (e.Item.FindControl("lblBestSellingimage") as Label).Text;
            TxtTitleBS.Text = (e.Item.FindControl("lblTitleBS") as Label).Text;
            TxtCurrentPriceBS.Text = (e.Item.FindControl("lblCurrentPriceBS") as Label).Text;
            TxtOriginalPriceBS.Text = (e.Item.FindControl("lblOriginalPriceBS") as Label).Text;
            TxtLinkUrlBS.Text = (e.Item.FindControl("lblLinkUrlBS") as Label).Text;
            TxtDisplayOrderBS.Text = (e.Item.FindControl("lblDisplayOrderBS") as Label).Text;
            btnUpdateBS.Visible = true;
            this.BestSellingProducts();

        }
        if (e.CommandName == "delete")
        {
            string BestSellingProductID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from BestSellingProducts where BestSellingProductID=" + BestSellingProductID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@BestSellingProductID", BestSellingProductID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.BestSellingProducts();

        }
    }
    protected void BestSellingProducts_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void BestSellingProducts_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }

    private void BestSellingProducts2()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM BestSellingProducts2"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    BestSellingProductListView1.DataSource = dt;
                    BestSellingProductListView1.DataBind();
                }
            }
        }
    }

    protected void btnSubmitBS2_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(BestSellingProduct2ID),0)+1 from BestSellingProducts2", con);
        BestSellingProduct2ID = cmdmax.ExecuteScalar().ToString();
        string BestSellingimage2 = BestSellingProduct2ID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/BSELLP/" + BestSellingimage2;
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
        decimal CurrentPriceBS2, OriginalPriceBS2;
        if (decimal.TryParse(TxtCurrentPriceBS2.Text, out CurrentPriceBS2) &&
            decimal.TryParse(TxtOriginalPriceBS2.Text, out OriginalPriceBS2))
        {

        }
        SqlCommand cmd1 = new SqlCommand("insert into BestSellingProducts2(BestSellingProduct2ID, BestSellingimage2, TitleBS2, CurrentPriceBS2, OriginalPriceBS2, LinkUrlBS2, DisplayOrderBS2) values('" + BestSellingProduct2ID + "', '" + BestSellingimage2 + "', '" + TxtTitleBS2.Text + "', '" + TxtCurrentPriceBS2.Text + "', '" + TxtOriginalPriceBS2.Text + "', '" + TxtLinkUrlBS2.Text + "', '" + TxtDisplayOrderBS2.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.BestSellingProducts2();
        ClearFormBS2();
    }
    protected void btnUpdateBS2_Click(object sender, EventArgs e)
    {
        string BestSellingimage2 = BestSellingProduct2ID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files1 = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/BSELLP/" + BestSellingimage2;
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
        decimal CurrentPriceBS2, OriginalPriceBS2;
        if (decimal.TryParse(TxtCurrentPriceBS2.Text, out CurrentPriceBS2) &&
            decimal.TryParse(TxtOriginalPriceBS2.Text, out OriginalPriceBS2))
        {

        }
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update BestSellingProducts2 set BestSellingimage2='" + BestSellingimage2 + "', TitleBS2='" + TxtTitleBS2.Text + "', CurrentPriceBS2='" + TxtCurrentPriceBS2.Text + "', OriginalPriceBS2" + TxtOriginalPriceBS2.Text + "', LinkUrlBS2='" + TxtLinkUrlBS2.Text + "' ,DisplayOrderBS2='" + TxtDisplayOrderBS2.Text + "' where BestSellingProduct2ID='" + lblBestSellingProduct2ID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.BestSellingProducts2();
        ClearFormBS2();
    }
    private void ClearFormBS2()
    {
        BestSellingimage2.ImageUrl = "";
        TxtTitleBS2.Text = "";
        TxtCurrentPriceBS2.Text = "";
        TxtOriginalPriceBS2.Text = "";
        TxtLinkUrlBS2.Text = "";
        TxtDisplayOrderBS2.Text = "";
        BestSellingProduct2ID = "";
        btnUpdateBS2.Visible = false;

    }
    protected void BestSellingProductsListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string BestSellingProduct2ID = e.CommandArgument.ToString();
            lblBestSellingProduct2ID.Text = BestSellingProduct2ID.ToString();
            lblBestSellingProduct2ID.Text = (e.Item.FindControl("lblBestSellingProduct2ID") as Label).Text;
            BestSellingimage2.ImageUrl = "Admin/img/BSELLP/" + (e.Item.FindControl("lblBestSellingimage2") as Label).Text;
            TxtTitleBS2.Text = (e.Item.FindControl("lblTitleBS2") as Label).Text;
            TxtCurrentPriceBS2.Text = (e.Item.FindControl("lblCurrentPriceBS2") as Label).Text;
            TxtOriginalPriceBS2.Text = (e.Item.FindControl("lblOriginalPriceBS2") as Label).Text;
            TxtLinkUrlBS2.Text = (e.Item.FindControl("lblLinkUrlBS2") as Label).Text;
            TxtDisplayOrderBS2.Text = (e.Item.FindControl("lblDisplayOrderBS2") as Label).Text;
            btnUpdateBS2.Visible = true;
            this.BestSellingProducts2();

        }
        if (e.CommandName == "delete")
        {
            string BestSellingProduct2ID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from BestSellingProducts2 where BestSellingProduct2ID=" + BestSellingProduct2ID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@BestSellingProduct2ID", BestSellingProduct2ID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.BestSellingProducts2();

        }
    }
    protected void BestSellingProductsListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void BestSellingProductsListView1_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}