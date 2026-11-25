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
    private string CategoryID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.CategoriesData();
        }
    }
    private void CategoriesData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Categoriespro"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    CategoriesListView.DataSource = dt;
                    CategoriesListView.DataBind();
                }
            }
        }
    }
    protected void btnSubmitC_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(CategoryID),0)+1 from Categoriespro", con);
        CategoryID = cmdmax.ExecuteScalar().ToString();
        String CateIconPath = CategoryID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".png";
        if (FileUpload4.HasFile)
        {
            HttpPostedFile files = FileUpload4.PostedFile;
            string imgPath1 = "~/Admin/img/categorySlider/" + CateIconPath;
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
        SqlCommand cmd1 = new SqlCommand("INSERT INTO Categoriespro (CategoryID, CateIconPath, Title, DisplayOrderC) VALUES ('" + CategoryID + "', '" + CateIconPath + "', '" + txtTitle.Text + "', '" + txtDisplayOrderC.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.CategoriesData();
        ClearFormC();

    }
    protected void btnUpdateC_Click(object sender, EventArgs e)
    {
        string CateIconPath = CategoryID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload4.HasFile)
        {
            HttpPostedFile files1 = FileUpload4.PostedFile;
            string imgPath1 = "~/Admin/img/categorySlider/" + CateIconPath;
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
        string sql = "update Categoriespro set CateIconPath='" + CateIconPath + "', Title='" + txtTitle.Text + "', DisplayOrderC='" + txtDisplayOrderC.Text + "' where CategoryID='" + lblCategoryID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.CategoriesData();
        ClearFormC();
    }
    private void ClearFormC()
    {
        CateIconPath.ImageUrl = "";
        txtTitle.Text = "";
        txtDisplayOrderC.Text = "";
        lblCategoryID.Text = "";
        btnUpdateC.Visible = false;
    }
    protected void CategoriesListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string CategoryID = e.CommandArgument.ToString();
            lblCategoryID.Text = CategoryID.ToString();
            lblCategoryID.Text = (e.Item.FindControl("lblCategoryID") as Label).Text;
            txtTitle.Text = (e.Item.FindControl("lblTitle") as Label).Text;
            txtDisplayOrderC.Text = (e.Item.FindControl("lblDisplayOrderC") as Label).Text;
            btnUpdateC.Visible = true;
            this.CategoriesData();

        }
        if (e.CommandName == "delete")
        {
            string CategoryID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from Categoriespro where CategoryID=" + CategoryID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@CategoryID", CategoryID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.CategoriesData();

        }
    }
    protected void CategoriesListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void CategoriesListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}