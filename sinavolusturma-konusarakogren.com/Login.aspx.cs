using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sinavolusturma_konusarakogren.com
{
    public partial class Login : System.Web.UI.Page
    {
        public int memberID = 0;
        public int memberType = 0;
        public string name = String.Empty;
        public string surname = String.Empty;
        public string username = String.Empty;
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("sp_Login", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", usernameTxt.Text);
            cmd.Parameters.AddWithValue("@password", passwordTxt.Text);

            SqlParameter prm_Id = new SqlParameter("@userID", SqlDbType.Int);
            prm_Id.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(prm_Id);

            SqlParameter prm_Name = new SqlParameter("@name", SqlDbType.NVarChar, 50);
            prm_Name.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(prm_Name);

            SqlParameter prm_SurName = new SqlParameter("@surname", SqlDbType.NVarChar, 50);
            prm_SurName.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(prm_SurName);

            SqlParameter prm_Type = new SqlParameter("@memberType", SqlDbType.Int);
            prm_Type.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(prm_Type);

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (SqlException hata)
            {
                throw new Exception(hata.Message);
            }

            name = prm_Name.Value.ToString();
            surname = prm_SurName.Value.ToString();
            username = usernameTxt.Text;
            memberID = Convert.ToInt16(prm_Id.Value.ToString());
            memberType = Convert.ToInt16(prm_Type.Value.ToString());

            if (memberID>0)
            {
                HttpCookie cookie = new HttpCookie("UserInformation");
                cookie["name"] = name;
                cookie["surname"] = surname;
                cookie["username"] = username;
                cookie["memberID"] = memberID.ToString();
                cookie["memberType"] = memberType.ToString();
                cookie.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(cookie);
                Response.Redirect("Default.aspx");
            }
            else
            {
                Label_Error.Text = "Kullanıcı adı veya şifre hatalı.";
            }
        }
    }
}