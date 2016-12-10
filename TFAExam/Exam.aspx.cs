using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Exam : System.Web.UI.Page
{
    protected void btnSignOut_Click(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        bool isLogged = false;
        bool isPasswordExpired = false;


        if (Session["logged"] == null) Response.Redirect("~/login.aspx");

        isLogged = bool.Parse(Session["logged"].ToString());

        if (!isLogged) Response.Redirect("~/login.aspx");

        isPasswordExpired = bool.Parse(Session["passwordExpired"].ToString());

        if (isPasswordExpired) Response.Redirect("~/UpdatePassword.aspx");

        int teachers_id = int.Parse(Session["teachersID"].ToString());

        profileDropdownMenu.InnerHtml = DBHelper.GetTeacherName(teachers_id) + " <span class=\"caret\"></span>";
    }


    protected void btnChangePassword_Click(object sender, EventArgs e)
    {

    }
}