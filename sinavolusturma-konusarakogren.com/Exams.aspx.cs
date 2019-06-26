using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace sinavolusturma_konusarakogren.com
{
    public partial class Exams : System.Web.UI.Page
    {
        public int cID = 0;
        public string title = String.Empty;
        public string content = String.Empty;
        public string answerkey = String.Empty;
        public string[] question = new string[4];
        public string[] answerA = new string[4];
        public string[] answerB = new string[4];
        public string[] answerC = new string[4];
        public string[] answerD = new string[4];
        public static int[] questionanswer = new int[4];
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            cID = Request.Params["cID"] != null ? Convert.ToInt16(Request.Params["cID"]) : 0;

            HttpCookie cookie = Request.Cookies["UserInformation"];
            if (cookie != null)
            {
                string membertype = "", memberID = "";
                int i = 0;
                membertype = cookie["memberType"];
                memberID = cookie["memberID"];
                if (memberID != "" && membertype != "" && cID != 0)
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("sp_GetQuestions", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@cID", cID);
                    cmd.ExecuteNonQuery();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        question[i] = reader["Question"].ToString();
                        questionanswer[i] = Convert.ToInt16(reader["Answer_No"]);
                        answerkey += reader["Answer_No"].ToString();
                        answerA[i] = reader["Answer_A"].ToString();
                        answerB[i] = reader["Answer_B"].ToString();
                        answerC[i] = reader["Answer_C"].ToString();
                        answerD[i] = reader["Answer_D"].ToString();
                        title = reader["C_Title"].ToString();
                        content = reader["C_Content"].ToString();
                        i++;

                    }
                    reader.Close();
                    connection.Close();
                    i = 0;
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        [WebMethod]
        public static string[] GetTrue(int[] answers)
        {
            string[] isCorrect = new string[4];
            for (int i = 0; i < questionanswer.Length; i++)
            {
                if (questionanswer[i] == answers[i])
                {
                    isCorrect[i] = "True";
                }
                else
                {
                    isCorrect[i] = "False";
                }
            }
            return isCorrect;
        }
    }
}