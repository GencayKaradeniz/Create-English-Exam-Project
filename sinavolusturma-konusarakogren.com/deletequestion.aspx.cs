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
    public partial class deletequestion : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        public int cID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            cID = Request.Params["cID"] != null ? Convert.ToInt16(Request.Params["cID"]) : 0;

            HttpCookie cookie = Request.Cookies["UserInformation"];
            if (cookie != null)
            {
                string memberID = "", memberType = "";
                memberType = cookie["memberType"];
                memberID = cookie["memberID"];
                if (memberType=="2" && memberID!="" && cID!=0)
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("sp_DeleteQuestion", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@cID", cID);
                    cmd.ExecuteNonQuery();
                    connection.Close();

                    Response.Redirect("ExamList.aspx?MemberID=" + memberID+"");
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }

            
        }
    }
}