using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sinavolusturma_konusarakogren.com
{
    public partial class CreateExam : System.Web.UI.Page
    {
        public String html;
        public Uri url;
        public string list;
        public string content = String.Empty;
        public string[] topicUrl = new string[5];  //son 5 topic urlsini sakla
        public string[] topicTitle = new string[5];
        public string[] topicContent = new string[5];
        public string[] question = new string[4];
        public string[] correctAnswer = new string[4];
        public string[] answerA = new string[4];
        public string[] answerB = new string[4];
        public string[] answerC = new string[4];
        public string[] answerD = new string[4];
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

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
                name = cookie["name"];
                surname = cookie["surname"];
                membertype = cookie["memberType"];
                memberID = cookie["memberID"];
                if (membertype == "1")
                {
                    Response.Redirect("Default.aspx");
                }
                else if (membertype == "2")
                {
                    ServicePointManager.Expect100Continue = true;
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                    for (int i = 0; i < 4; i++)
                    {
                        answerA[i] = Request.Params["answerA[" + i + "]"] != null ? Request.Params["answerA[" + i + "]"].ToString() : String.Empty;
                        answerB[i] = Request.Params["answerB[" + i + "]"] != null ? Request.Params["answerB[" + i + "]"].ToString() : String.Empty;
                        answerC[i] = Request.Params["answerC[" + i + "]"] != null ? Request.Params["answerC[" + i + "]"].ToString() : String.Empty;
                        answerD[i] = Request.Params["answerD[" + i + "]"] != null ? Request.Params["answerD[" + i + "]"].ToString() : String.Empty;
                        question[i] = Request.Params["question[" + i + "]"] != null ? Request.Params["question[" + i + "]"].ToString() : String.Empty;
                        correctAnswer[i] = Request.Params["correctAnswer[" + i + "]"] != null ? Request.Params["correctAnswer[" + i + "]"].ToString() : String.Empty;
                    }

                    string archiveUrl = getdata("https://www.wired.com/sitemap/", "//*[@id=\"app-root\"]/div/div[4]/div/div/div[4]/ul/li[1]/a", list);  //son arşiv linki
                    archiveUrl = archiveUrl.Replace("&amp;", "&");   //asp.net arşivden son haftayı alırken linki bozduğu için

                    for (int i = 0; i < topicUrl.Length; i++)
                    {
                        topicUrl[i] = getdata(archiveUrl, "//*[@id=\"app-root\"]/div/div[4]/div/div/div[4]/ul/li[last()-" + i + "]/a", list);  //son 5 topic linki
                    }
                    for (int i = 0; i < topicUrl.Length; i++)
                    {
                        topicTitle[i] += getdata(topicUrl[i], "//header/h1", list);
                        topicContent[i] += getdata(topicUrl[i], "//article", list);
                    }
                    int count = 0;
                    if (!IsPostBack)
                    {
                        foreach (var item in topicTitle)
                        {
                            texttitleList.Items.Add(new ListItem(item, count.ToString()));
                            count++;
                        }
                    }
                }

            }
        }
        public string getdata(String Url, String XPath, string List)
        {
            try
            {
                url = new Uri(Url);
            }
            catch (UriFormatException)
            {
                LabelError.Text = "Hatalı URL.";
            }
            catch (ArgumentNullException)
            {
                LabelError.Text = "Hatalı argument.";
            }

            WebClient client = new WebClient();
            client.Encoding = Encoding.UTF8;
            try
            {
                html = client.DownloadString(url);
            }
            catch (WebException)
            {
                LabelError.Text = "Hatalı client.";
            }

            HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
            doc.LoadHtml(html);
            try
            {
                List = doc.DocumentNode.SelectSingleNode(XPath).InnerText.ToString();
            }
            catch (NullReferenceException)
            {
                LabelError.Text = "Hatalı XPath";
            }
            return List;
        }

        protected void texttitleList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = Convert.ToInt16(texttitleList.SelectedValue);
            content = topicContent[index];
        }

        protected void createExamBtn_Click(object sender, EventArgs e)
        {
            connection.Open();
            for (int i = 0; i < 4; i++)
            {
                SqlCommand cmd = new SqlCommand("sp_CreateQuestion", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@question", question[i]);
                cmd.Parameters.AddWithValue("@answerA", answerA[i]);
                cmd.Parameters.AddWithValue("@answerB", answerB[i]);
                cmd.Parameters.AddWithValue("@answerC", answerC[i]);
                cmd.Parameters.AddWithValue("@answerD", answerD[i]);
                cmd.Parameters.AddWithValue("@CorrectAnswer", correctAnswer[i]);
                cmd.Parameters.AddWithValue("@questionTitle", texttitleList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@questionContent", content);
                cmd.Parameters.AddWithValue("@date", DateTime.Today.ToShortDateString());
                cmd.ExecuteNonQuery();
            }
            connection.Close();
            Response.Redirect("ExamList.aspx");
        }
    }
}