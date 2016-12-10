using MySql.Data.MySqlClient;
using System.Data;

/// <summary>
/// Summary description for DBHelper
/// </summary>
public static class DBHelper
{
    private static MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["mainDB"].ConnectionString);

    public static DataTable GetStudentsFeeDetails(DataTable student_details, int teacher_id)
    {
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = con;

        student_details.Columns.Add("LastPaidFee");
        con.Open();
        foreach (DataRow student in student_details.Rows)
        {
            cmd.CommandText = "Select max(post_dt),teachers_reg_id from fee_details where students_reg_id=" + student[0] + " and fee_paid_status='yes' group by teachers_reg_id having teachers_reg_id=" + teacher_id;
            student[4] = cmd.ExecuteScalar();
        }
        con.Close();
        return student_details;
    }

    public static DataTable GetStudentsList(int teacher_id)
    {
        MySqlCommand cmd = new MySqlCommand("Select ss.students_reg_id 'Reg No', ss.roll_no 'Roll No',sr.first_name Name,c.course_name Course from students_sub ss inner join students_reg sr on ss.students_reg_id=sr.students_reg_id inner join course c on c.course_id=ss.course_id where ss.reg_teachers_reg_id=@tid and ss.active_status='active'", con);
        cmd.Parameters.AddWithValue("@tid", teacher_id);
        DataTable studentsDetails = new DataTable();

        DataTable ItemTable = new DataTable();

        con.Open();
        MySqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
            studentsDetails.Load(dr);
        con.Close();

        DataSet ds = new DataSet();

        ds.Tables.Add(studentsDetails);

        string xml = ds.GetXml();

        return studentsDetails;
    }

    public static DataTable GetTeacherDetails(string teacherID, string password)
    {
        string getTeacherID = "Select teachers_reg_id,passwordExpired from teachers_passcode where teachers_passcode=@passcode and teachers_reg_id=@teachersid";

        MySqlCommand cmd = new MySqlCommand(getTeacherID, con);
        cmd.Parameters.AddWithValue("@passcode", password);
        cmd.Parameters.AddWithValue("@teachersid", teacherID);


        cmd.Connection = con;
        con.Open();
        MySqlDataReader dr = cmd.ExecuteReader();

        DataTable dt = new DataTable();
        if (dr.HasRows)
            dt.Load(dr);
        con.Close();
        if (dt.Rows.Count > 0)
            return dt;

        return null;
    }

    public static string GetTeacherName(int teacherID)
    {
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Select teacher_name from teachers_reg where teachers_reg_id=@id";
        cmd.Parameters.AddWithValue("@id", teacherID);

        con.Open();
        var name = cmd.ExecuteScalar().ToString();
        con.Close();

        return name;
    }

    public static int UpdateTeachersPassword(string teacherID, string oldPassword, string newPassword)
    {

        string updateTeacherPassword = "Update teachers_passcode Set teachers_passcode=@newPassword where teachers_passcode=@oldPassword and teachers_reg_id=@teachersid";

        MySqlCommand cmd = new MySqlCommand(updateTeacherPassword, con);
        cmd.Parameters.AddWithValue("@newPassword", newPassword);
        cmd.Parameters.AddWithValue("@oldPassword", oldPassword);
        cmd.Parameters.AddWithValue("@teachersid", teacherID);


        cmd.Connection = con;
        con.Open();
        int rowsAffected = cmd.ExecuteNonQuery();
        con.Close();

        return rowsAffected;
    }

    public static int UpdateTeachersPasswordExpiry(bool expiryStatus, string teacherID)
    {
        string updateTeacherPasswordExpiryStatus = "Update teachers_passcode SET passwordExpired=@status where teachers_reg_id=@teachersID";

        MySqlCommand cmd = new MySqlCommand(updateTeacherPasswordExpiryStatus, con);
        cmd.Parameters.AddWithValue("@status", expiryStatus);
        cmd.Parameters.AddWithValue("@teachersid", teacherID);

        con.Open();
        int statusUpdated = cmd.ExecuteNonQuery();
        con.Close();

        return statusUpdated;
    }

    }