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
    private string BlogID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.NewsArticles();
        }
    }
    private void NewsArticles()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM NewsArticles"; // Added WHERE clause for active banners
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(BlogID),0)+1 from NewsArticles", con);
        BlogID = cmdmax.ExecuteScalar().ToString();
        string BlogImage = BlogID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/Blog/" + BlogImage;
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
        SqlCommand cmd1 = new SqlCommand("insert into NewsArticles(BlogID, BlogImage, AuthorName, PublishDate, Title, CommentsCount, DisplayOrder) values('" + BlogID + "', '" + BlogImage + "', '" + TxtAuthorName.Text + "', '" + TxtPublishDate.Text + "', '" + TxtTitle.Text + "', '" + TxtCommentsCount.Text + "',  '" + TxtDisplayOrder.Text + "' )", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.NewsArticles();
        ClearForm();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string BlogImage = BlogID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files1 = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/Blog/" + BlogImage;
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
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update NewsArticles set BlogImage='" + BlogImage + "', AuthorName='" + TxtAuthorName.Text + "', PublishDate='" + TxtPublishDate.Text + "', Title='" + TxtTitle.Text + "', CommentsCount='" + TxtCommentsCount.Text + "', DisplayOrder='" + TxtDisplayOrder.Text + "' where BlogID='" + lblBlogID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.NewsArticles();
        ClearForm();
    }
    private void ClearForm()
    {
        BlogImage.ImageUrl = "";
        TxtAuthorName.Text = "";
        TxtPublishDate.Text = "";
        TxtTitle.Text = "";
        TxtCommentsCount.Text = "";
        TxtDisplayOrder.Text = "";
        BlogID = "";
        btnUpdate.Visible = false;

    }
    protected void NewsArticlesListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string BlogID = e.CommandArgument.ToString();
            lblBlogID.Text = BlogID.ToString();
            lblBlogID.Text = (e.Item.FindControl("lblBlogID") as Label).Text;
            BlogImage.ImageUrl = "img/products/" + (e.Item.FindControl("lblBlogImage") as Label).Text;
            TxtAuthorName.Text = (e.Item.FindControl("lblAuthorName") as Label).Text;
            TxtPublishDate.Text = (e.Item.FindControl("lblPublishDate") as Label).Text;
            TxtTitle.Text = (e.Item.FindControl("lblTitle") as Label).Text;
            TxtCommentsCount.Text = (e.Item.FindControl("lblCommentsCount") as Label).Text;
            TxtDisplayOrder.Text = (e.Item.FindControl("lblDisplayOrder") as Label).Text;
            btnUpdate.Visible = true;
            this.NewsArticles();


        }
        if (e.CommandName == "delete")
        {
            string BlogID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from NewsArticles where BlogID=" + BlogID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@BlogID", BlogID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.NewsArticles();

        }
    }
    protected void NewsArticlesListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void NewsArticlesListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}