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
    private string BrandID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.Brands();
        }
    }
    private void Brands()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Brands "; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    BrandsListView.DataSource = dt;
                    BrandsListView.DataBind();
                }
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(BrandID),0)+1 from Brands", con);
        BrandID = cmdmax.ExecuteScalar().ToString();
        string Brandimage = BrandID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/Brands/" + Brandimage;
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
        SqlCommand cmd1 = new SqlCommand("insert into Brands(BrandID, Brandimage, DisplayOrder) values('" + BrandID + "', '" + Brandimage + "', '" + TxtDisplayOrder.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.Brands();
        ClearForm();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string Brandimage = BrandID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".Png";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files1 = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/Brands/" + Brandimage;
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
        string sql = "update Brands set Brandimage='" + Brandimage + "', DisplayOrder='" + TxtDisplayOrder.Text + "' where BrandID='" + lblBrandID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.Brands();
        ClearForm();
    }
    private void ClearForm()
    {
        Brandimage.ImageUrl = "";
        TxtDisplayOrder.Text = "";
        BrandID = "";
        btnUpdate.Visible = false;

    }
    protected void BrandsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string BrandID = e.CommandArgument.ToString();
            lblBrandID.Text = BrandID.ToString();
            lblBrandID.Text = (e.Item.FindControl("lblBrandID") as Label).Text;
            Brandimage.ImageUrl = "img/Brands/" + (e.Item.FindControl("lblBrandimage") as Label).Text;
            TxtDisplayOrder.Text = (e.Item.FindControl("lblDisplayOrder") as Label).Text;
            btnUpdate.Visible = true;
            this.Brands();

        }
        if (e.CommandName == "delete")
        {
            string BrandID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from Brands where BrandID=" + BrandID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@BrandID", BrandID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.Brands();

        }
    }
    protected void BrandsListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void BrandsListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}