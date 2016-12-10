using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdatePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loginFailedAlert.Visible = false;
        passwordChangeFailedAlert.Visible = false;
        profileDropdownMenu.InnerHtml = DBHelper.GetTeacherName(int.Parse(Session["teachersID"].ToString())) + " <span class=\"caret\"></span>";
        txtRegID.Value = Session["teachersID"].ToString();
        if (Session["logged"] == null) Response.Redirect("~/login.aspx");
        else if (!bool.Parse(Session["logged"].ToString()))
            Response.Redirect("~/login.aspx");

        if (Session["passwordExpired"] == null) Response.Redirect("~/login.aspx");

        bool isPasswordExpired = bool.Parse(Session["passwordExpired"].ToString());

        if (!isPasswordExpired) Response.Redirect("~/FeeDetails.aspx");

        if (!IsPostBack) return;

        int passwordUpdated = DBHelper.UpdateTeachersPassword(txtRegID.Value, txtOldPassword.Value, txtNewPassword.Value);

        if (passwordUpdated > 0)
            if (DBHelper.UpdateTeachersPasswordExpiry(false, txtRegID.Value) > 0)
            {
                Session["logged"] = true;
                Session["passwordExpired"] = false;
                Response.Redirect("~/FeeDetails.aspx");
            }
            else
                passwordChangeFailedAlert.Visible = true;
        else
            loginFailedAlert.Visible = true;
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session["logged"] = false;
        if (DBHelper.UpdateTeachersPasswordExpiry(false, txtRegID.Value) > 0)
            Session["passwordExpired"] = false;
        Response.Redirect("~/login.aspx");
    }
}