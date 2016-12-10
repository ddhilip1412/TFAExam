using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

public partial class FeeDetails : System.Web.UI.Page
{
    private int teachers_id;

    protected void Page_Load(object sender, EventArgs e)
    {
        bool isLogged = false;
        bool isPasswordExpired = false;


        if (Session["logged"] == null) Response.Redirect("~/login.aspx");

        isLogged = bool.Parse(Session["logged"].ToString());

        if (!isLogged) Response.Redirect("~/login.aspx");

        isPasswordExpired = bool.Parse(Session["passwordExpired"].ToString());

        if (isPasswordExpired) Response.Redirect("~/UpdatePassword.aspx");

        teachers_id = int.Parse(Session["teachersID"].ToString());

        DataTable studentsDetailsDataTable = DBHelper.GetStudentsList(teachers_id);

        studentsDetailsDataTable = DBHelper.GetStudentsFeeDetails(studentsDetailsDataTable, teachers_id);

        PopulateGridView(studentsDetailsDataTable);

        profileDropdownMenu.InnerHtml = DBHelper.GetTeacherName(teachers_id) + " <span class=\"caret\"></span>";
    }



    private void PopulateGridView(DataTable studentsDetails)
    {
        var courses = (from DataRow datar in studentsDetails.Rows
                       orderby (string)datar["Course"]
                       select (string)datar["Course"]).Distinct();
        chkBoxLstCourses.DataSource = courses;
        chkBoxLstCourses.DataBind();
        foreach (ListItem checkbox in chkBoxLstCourses.Items)
        {
            checkbox.Selected = true;
        }

        foreach (DataColumn col in studentsDetails.Columns)
        {
            BoundField bField = new BoundField();
            bField.DataField = col.ColumnName;
            bField.HeaderText = col.ColumnName;
            gvStudentsDetails.Columns.Add(bField);
        }

        gvStudentsDetails.DataSource = studentsDetails;
        gvStudentsDetails.DataBind();
        gvStudentsDetails.Columns[0].Visible = false;
        gvStudentsDetails.HeaderRow.TableSection = TableRowSection.TableHeader;
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session["logged"] = false;
        Response.Redirect("~/login.aspx");
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        if (DBHelper.UpdateTeachersPasswordExpiry(true, teachers_id.ToString()) > 0)
            Session["passwordExpired"] = true;
        Response.Redirect("~/UpdatePassword.aspx");
    }
}