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
    private string BannerID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.BannerData();
        }
    }
    private void BannerData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Banners"; // Added WHERE clause for active banners
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

    protected void btnSubmitB_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(BannerID),0)+1 from Banners", con);
        BannerID = cmdmax.ExecuteScalar().ToString();
        string Bannerimage = BannerID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload2.HasFile)
        {
            HttpPostedFile files = FileUpload2.PostedFile;
            string imgPath1 = "~/Admin/img/Banner/" + Bannerimage;
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
        SqlCommand cmd1 = new SqlCommand("insert into Banners(BannerID, Bannerimage, Head1, Head2, LinkUrl2, DisplayOrder2) values('" + BannerID + "', '" + Bannerimage + "', '" + txtHead1.Text + "', '" + txtHead2.Text + "','" + txtLinkUrl2.Text + "','" + txtDisplayOrder2.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.BannerData();
        ClearFormB();
    }
    protected void btnUpdateB_Click(object sender, EventArgs e)
    {
        string Bannerimage = BannerID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload2.HasFile)
        {
            HttpPostedFile files1 = FileUpload2.PostedFile;
            string imgPath1 = "~/Admin/img/Banner/" + Bannerimage;
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
        string sql = "update Banners set Bannerimage='" + Bannerimage + "', Head1='" + txtHead1.Text + "', Head2='" + txtHead2.Text + "', LinkUrl2='" + txtLinkUrl2.Text + "',DisplayOrder2='" + txtDisplayOrder2.Text + "' where Bannerid='" + lblBannerID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.BannerData();
        ClearFormB();
    }
    private void ClearFormB()
    {
        Bannerimage.ImageUrl = "";
        txtHead1.Text = "";
        txtHead2.Text = "";
        txtLinkUrl2.Text = "";
        txtDisplayOrder2.Text = "";
        lblBannerID.Text = "";
        btnUpdateB.Visible = false;
    }

    protected void BannerListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string BannerID = e.CommandArgument.ToString();
            lblBannerID.Text = BannerID.ToString();
            lblBannerID.Text = (e.Item.FindControl("lblBannerID") as Label).Text;
            Bannerimage.ImageUrl = "img/Banner/" + (e.Item.FindControl("lblBannerimage") as Label).Text;
            txtHead1.Text = (e.Item.FindControl("lblHead1") as Label).Text;
            txtHead2.Text = (e.Item.FindControl("lblHead2") as Label).Text;
            txtLinkUrl2.Text = (e.Item.FindControl("lblLinkUrl2") as Label).Text;
            txtDisplayOrder2.Text = (e.Item.FindControl("lblDisplayOrder2") as Label).Text;
            btnUpdateB.Visible = true;
            this.BannerData();
        }
        if (e.CommandName == "delete")
        {
            string BannerID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from Banners where BannerID=" + BannerID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();

            cmd.Parameters.AddWithValue("@BannerID", BannerID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.BannerData();
        }
    }
    protected void BannerListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void BannerListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}