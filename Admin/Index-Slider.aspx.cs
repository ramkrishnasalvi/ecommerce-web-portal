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
    private string SliderID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.SliderData();
        }
    }
    private void SliderData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Sliders"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    SliderListView.DataSource = dt;
                    SliderListView.DataBind();
                }
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(SliderID),0)+1 from Sliders", con);
        SliderID = cmdmax.ExecuteScalar().ToString();
        string Sliderimage = SliderID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/Slider/" + Sliderimage;
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
        SqlCommand cmd1 = new SqlCommand("insert into Sliders(SliderID, Sliderimage, Heading1, Heading2, LinkUrl, DisplayOrder) values('" + SliderID + "', '" + Sliderimage + "', '" + txtHeading1.Text + "', '" + txtHeading2.Text + "','" + txtLinkUrl.Text + "','" + txtDisplayOrder.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.SliderData();
        ClearFormS();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string Sliderimage = SliderID + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files1 = FileUpload1.PostedFile;
            string imgPath1 = "~/Admin/img/Slider/" + Sliderimage;
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
        string sql = "update Sliders set Sliderimage='" + Sliderimage + "', Heading1='" + txtHeading1.Text + "', Heading2='" + txtHeading2.Text + "', LinkUrl='" + txtLinkUrl.Text + "',DisplayOrder='" + txtDisplayOrder.Text + "' where sliderid='" + lblSliderID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.SliderData();
        ClearFormS();
    }
    private void ClearFormS()
    {
        Sliderimage.ImageUrl = "";
        txtHeading1.Text = "";
        txtHeading2.Text = "";
        txtLinkUrl.Text = "";
        txtDisplayOrder.Text = "";
        lblSliderID.Text = "";
        btnUpdate.Visible = false;
    }
    protected void SliderListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string SliderID = e.CommandArgument.ToString();
            lblSliderID.Text = SliderID.ToString();
            lblSliderID.Text = (e.Item.FindControl("lblSliderID") as Label).Text;
            Sliderimage.ImageUrl = "img/Slider/" + (e.Item.FindControl("lblSliderimage") as Label).Text;
            txtHeading1.Text = (e.Item.FindControl("lblHeading1") as Label).Text;
            txtHeading2.Text = (e.Item.FindControl("lblHeading2") as Label).Text;
            txtLinkUrl.Text = (e.Item.FindControl("lblLinkUrl") as Label).Text;
            txtDisplayOrder.Text = (e.Item.FindControl("lblDisplayOrder") as Label).Text;
            btnUpdate.Visible = true;
            this.SliderData();
        }
        if (e.CommandName == "delete")
        {
            string SliderID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from Sliders where SliderID=" + SliderID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();

            cmd.Parameters.AddWithValue("@SliderID", SliderID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.SliderData();
        }
    }
    protected void SliderListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void SliderListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}