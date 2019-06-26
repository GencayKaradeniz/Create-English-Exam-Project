using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sinavolusturma_konusarakogren.com
{
    public partial class SiteMaster : MasterPage
    {
        public string menu = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["UserInformation"];
            if (cookie!=null)
            {
                string name="", surname = "",membertype="",memberID="";
                name = cookie["name"];
                surname = cookie["surname"];
                membertype = cookie["memberType"];
                memberID = cookie["memberID"];
                if (membertype=="1")
                {
                    menu = String.Format("<li><a><b>Hoşgeldiniz,{0} {1}</b></a></li><li><a href='ExamList.aspx?MemberID={2}'><i class='fa fa-file-text-o' aria-hidden='true'></i> Sınavlar</a></li><li><a href='/' OnClick='clearCookies()' runat='server'><i class='fa fa-sign-out'></i> Çıkış</a></li>", name, surname, memberID);
                }
                else if (membertype=="2")
                {
                    menu = String.Format("<li><a><b>Hoşgeldiniz,{0} {1}</b></a></li><li><a href='ExamList.aspx?MemberID={2}'>Sınavlar</a></li><li><a href='CreateExam.aspx?MemberID={2}'><i class='fa fa-file-text-o' aria-hidden='true'></i> Sınav Hazırla</a></li><li><a href='/' OnClick='clearCookies()' runat='server'><i class='fa fa-sign-out'></i> Çıkış</a></li>", name, surname, memberID);
                }
            }
            else
            {
                menu = "<li><a href='Signup.aspx'><span class='glyphicon glyphicon-user'></span> Üye Ol</a></li>"+
                       "<li><a href='Login.aspx' ><span class='glyphicon glyphicon-log-in'></span> Üye Girişi</a></li>";
            }
        }
    }
}