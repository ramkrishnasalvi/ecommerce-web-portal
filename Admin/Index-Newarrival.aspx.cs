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
    private string ArrivalID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.NewarrivalProducts();
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
    protected void btnSubmitNA_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(ArrivalID),0)+1 from NewarrivalProducts", con);
        ArrivalID = cmdmax.ExecuteScalar().ToString();
        string ArrivalImage = ArrivalID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".png";
        if (FileUpload9.HasFile)
        {
            HttpPostedFile files = FileUpload9.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + ArrivalImage;
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


        SqlCommand cmd1 = new SqlCommand("INSERT INTO NewarrivalProducts (ArrivalID, ArrivalImage, TitleNA, OriginalPriceNA, IsNewNA, RatingNA, ReviewCountNA,  DisplayOrderNA) VALUES ('" + ArrivalID + "', '" + ArrivalImage + "', '" + TxtTitleNA.Text + "', '" + TxtOriginalPriceNA.Text + "', '" + TxtIsNewNA.Text + "', '" + TxtRatingNA.Text + "', '" + TxtReviewCountNA.Text + "',  '" + TxtDisplayOrderNA.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.NewarrivalProducts();
        ClearFormNA();
    }
    protected void btnUpdateNA_Click(object sender, EventArgs e)
    {
        string ArrivalImage = ArrivalID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".png";
        if (FileUpload9.HasFile)
        {
            HttpPostedFile files = FileUpload9.PostedFile;
            string imgPath1 = "~/Admin/img/products/" + ArrivalImage;
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


        

        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update NewarrivalProducts set ArrivalImage='" + ArrivalImage + "', TitleNA='" + TxtTitleNA.Text + "', OriginalPriceNA='" + TxtOriginalPriceNA.Text + "', IsNewNA='" + TxtIsNewNA.Text + "', RatingNA='" + TxtRatingNA.Text + "', ReviewCountNA='" + TxtReviewCountNA.Text + "', DisplayOrderNA='" + TxtDisplayOrderNA.Text + "' where ArrivalID='" + lblArrivalID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.NewarrivalProducts();
        ClearFormNA();
    }
    private void ClearFormNA()
    {
        ArrivalImage.ImageUrl = "";
        TxtTitleNA.Text = "";
        TxtOriginalPriceNA.Text = "";
        TxtIsNewNA.Text = "";
        TxtRatingNA.Text = "";
        TxtReviewCountNA.Text = "";
        TxtDisplayOrderNA.Text = "";
        lblArrivalID.Text = "";
        btnUpdateNA.Visible = false;

    }
    protected void NewArrivalListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string ArrivalID = e.CommandArgument.ToString();
            lblArrivalID.Text = ArrivalID.ToString();
            lblArrivalID.Text = (e.Item.FindControl("lblArrivalID") as Label).Text;
            ArrivalImage.ImageUrl = "img/products/" + (e.Item.FindControl("lblArrivalImage") as Label).Text;
            TxtTitleNA.Text = (e.Item.FindControl("lblTitleNA") as Label).Text;
            TxtOriginalPriceNA.Text = (e.Item.FindControl("lblOriginalPriceNA") as Label).Text;
            TxtIsNewNA.Text = (e.Item.FindControl("lblIsNewNA") as Label).Text;
            TxtRatingNA.Text = (e.Item.FindControl("lblRatingNA") as Label).Text;
            TxtReviewCountNA.Text = (e.Item.FindControl("lblReviewCountNA") as Label).Text;
            TxtDisplayOrderNA.Text = (e.Item.FindControl("lblDisplayOrderNA") as Label).Text;
            btnUpdateNA.Visible = true;
            this.NewarrivalProducts();
            
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
            this.NewarrivalProducts();
        }
    }
    protected void NewArrivalListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void NewArrivalListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}