using System;
using System.Data;


public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loginFailedAlert.Visible = false;
        if (Session["logged"] != null)
            if (bool.Parse(Session["logged"].ToString())) Response.Redirect("~/feeDetails.aspx");
        if (!IsPostBack) return;
        Session["logged"] = "false";
        DataTable teachersLoginDetails = DBHelper.GetTeacherDetails(txtRegID.Value, txtPassword.Value);
        int teachersID = -1;
        int isPasswordExpired = 0;
        if (teachersLoginDetails != null)
        {
            teachersID = int.Parse(teachersLoginDetails.Rows[0][0].ToString());
            Session["teachersID"] = teachersID;
            Session["logged"] = true;

            isPasswordExpired = int.Parse(teachersLoginDetails.Rows[0][1].ToString());
            if (isPasswordExpired == 1)
                Session["passwordExpired"] = true;
            else
                Session["passwordExpired"] = false;

            Response.Redirect("~/feeDetails.aspx");
        }
        else
            loginFailedAlert.Visible = true;

    }
}