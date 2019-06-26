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
    public partial class Signup : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("sp_Signup", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name",nameTxt.Text);
                cmd.Parameters.AddWithValue("@surname",surnameTxt.Text);
                cmd.Parameters.AddWithValue("@username",usernameTxt.Text);
                cmd.Parameters.AddWithValue("@password",passwordTxt.Text);
                cmd.Parameters.AddWithValue("@userType",membertypeList.SelectedValue);
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (SqlException hata)
                {
                    throw new Exception(hata.Message);
                }
                connection.Close();
                Response.Redirect("Login.aspx");
            }
            catch (Exception hata)
            {
                Label_Error.Text = hata.Message;
            }
            
        }
    }
}