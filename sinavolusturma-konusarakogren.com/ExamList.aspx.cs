using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sinavolusturma_konusarakogren.com
{
    public partial class ExamList : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        public string tests = String.Empty;
        public int cID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["UserInformation"];
            if (cookie == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string name = "", surname = "", membertype = "", memberID = "";
                string[] tarih;
                int i = 0;
                name = cookie["name"];
                surname = cookie["surname"];
                membertype = cookie["memberType"];
                memberID = cookie["memberID"];
                if (membertype == "2")
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("SELECT DISTINCT C_No,Key_AddTime,C_Title FROM tbl_AnswerKey,tbl_QuestionContent WHERE C_No = C_ID", connection);
                    cmd.ExecuteNonQuery();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        i++;
                        string title = reader["C_Title"].ToString();
                        string date = reader["Key_AddTime"].ToString();
                        tarih = date.Split(' ');
                        date = tarih[0];
                        cID = Convert.ToInt16(reader["C_No"]);
                        tests += "<div class='row' style='margin-bottom:10px;border-top:1px solid grey;border-radius:5px;'>" +
                                    "<div class='col-xs-1'>" + i + "</div>" +
                                    "<div class='col-xs-5'>" + title + "</div>" +
                                    "<div class='col-xs-4'>" + date + "</div>" +
                                    "<div class='col-xs-2'><a href='deletequestion.aspx?cID="+cID.ToString()+"'>Sil</a></div>" +
                                  "</div>";
                    }
                    connection.Close();
                    reader.Close();
                }
                else if(membertype == "1")
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("SELECT DISTINCT C_No,Key_AddTime,C_Title FROM tbl_AnswerKey,tbl_QuestionContent WHERE C_No = C_ID", connection);
                    cmd.ExecuteNonQuery();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        i++;
                        string title = reader["C_Title"].ToString();
                        string date = reader["Key_AddTime"].ToString();
                        tarih = date.Split(' ');
                        date = tarih[0];
                        int cID = Convert.ToInt16(reader["C_No"]);
                        tests += "<div class='row' style='margin-bottom:10px;border-top:1px solid grey;border-radius:5px;'>" +
                                    "<div class='col-xs-1'>" + i + "</div>" +
                                    "<div class='col-xs-5'>" + title + "</div>" +
                                    "<div class='col-xs-4'>" + date + "</div>" +
                                    "<div class='col-xs-2'><a href='Exams.aspx?cID=" + cID.ToString() + "'>Çöz</a></div>" +
                                  "</div>";
                    }
                    connection.Close();
                    reader.Close();
                }
            }
        }
    }
}