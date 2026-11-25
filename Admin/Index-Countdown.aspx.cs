using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    private string CountdownID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.CountdwonData();
        }
    }
    private void CountdwonData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM CountdownEvents"; // Added WHERE clause for active banners
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    CountdwonListView.DataSource = dt;
                    CountdwonListView.DataBind();
                }
            }
        }
    }
    protected void btnSubmitCountdown_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();
        SqlCommand cmdmax = new SqlCommand("select isnull(max(CountdownID),0)+1 from CountdownEvents", con);
        CountdownID = cmdmax.ExecuteScalar().ToString();
        DateTime countdownEndDate = DateTime.MinValue;
        SqlCommand cmd1 = new SqlCommand("INSERT INTO CountdownEvents (CountdownID, EventName, CountdownEndDate, CountdownDisplayOrder) VALUES ('" + CountdownID + "','" + txtEventName.Text + "', '" + txtCountdownEndDate.Text + "', '" + txtCountdownDisplayOrder.Text + "')", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.CountdwonData();
        ClearCountdownForm();
    }
    protected void btnUpdateCountdown_Click(object sender, EventArgs e)
    {
        DateTime countdownEndDate = DateTime.MinValue;
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update CountdownEvents set EventName='" + txtEventName.Text + "', CountdownEndDate='" + txtCountdownEndDate.Text + "',  CountdownDisplayOrder='" + txtCountdownDisplayOrder.Text + "' where CountdownID='" + lblCountdownID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.CountdwonData();
        ClearCountdownForm();
    }
    private void ClearCountdownForm()
    {
        txtEventName.Text = "";
        txtCountdownEndDate.Text = "";
        txtCountdownDisplayOrder.Text = "";
        lblCountdownID.Text = "";
        btnUpdateCountdown.Visible = false;
    }
    protected void CountdwonListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string CountdownID = e.CommandArgument.ToString();
            lblCountdownID.Text = CountdownID.ToString();
            lblCountdownID.Text = (e.Item.FindControl("lblCountdownID") as Label).Text;
            txtEventName.Text = (e.Item.FindControl("lblEventName") as Label).Text;
            txtCountdownEndDate.Text = (e.Item.FindControl("lblCountdownEndDate") as Label).Text;
            txtCountdownDisplayOrder.Text = (e.Item.FindControl("lblCountdownDisplayOrder") as Label).Text;
            btnUpdateCountdown.Visible = true;
            this.CountdwonData();
        }
        if (e.CommandName == "delete")
        {
            string CountdownID = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from CountdownEvents where CountdownID=" + CountdownID + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@CountdownID", CountdownID);
            cmd.ExecuteNonQuery();
            con.Close();
            this.CountdwonData();
        }
    }
    protected void CountdwonListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void CountdwonListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}