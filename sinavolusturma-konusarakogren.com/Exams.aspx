<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Exams.aspx.cs" Inherits="sinavolusturma_konusarakogren.com.Exams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#finishBtn').click(function () {
                var q1Answer = $('#q1 li').filter(".selected-item").index()+1;
                var q2Answer = $('#q2 li').filter(".selected-item").index()+1;
                var q3Answer = $('#q3 li').filter(".selected-item").index()+1;
                var q4Answer = $('#q4 li').filter(".selected-item").index()+1;
                var qAnswers = [q1Answer, q2Answer, q3Answer, q4Answer];
                var anskey = '<%=answerkey%>';
                var ulid = ['#q1','#q2','#q3','#q4'];
                $.ajax({
                    type: 'POST',
                    url: 'Exams.aspx/GetTrue',
                    dataType: 'JSON',
                    data: JSON.stringify({ answers: qAnswers }),
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        for (var i = 0; i < 4; i++) {
                            if (data.d[i] == "True") {
                                $(ulid[i]+ " li").eq(qAnswers[i]-1).css("background-color","green");
                            }
                            else {
                                $(ulid[i] + " li").eq(qAnswers[i] - 1).css("background-color", "red");
                                $(ulid[i] + " li").eq(parseInt(anskey[i]) - 1).css("background-color", "green");
                            }
                        }
                        $("#finishBtn").attr("disabled","disabled");
                    },
                    error: function (hata) {
                        alert("Bir hata oluştu. Lütfen tekrar deneyiniz.");
                    }
                });
            });
        });
        function selected(id, divid) {
            $(divid).children('li').removeClass('selected-item');
            $(id).addClass('selected-item');
        }
    </script>
    <div class="container">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="col-sm-12">
                <div class="row" style="margin-bottom: 20px;">
                    <h4 class="text-center"><%=title %></h4>
                    <br />
                    <p style="word-wrap:break-word;">
                        <%=content %>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <p class="mar-bot-10">1) <%=question[0] %></p>
                    <ul id="q1" class="list-group" style="width: 90%">
                        <li id="q1A" class="list-group-item mar-bot-5" onclick="selected(q1A,q1)">A) <%=answerA[0]%></li>
                        <li id="q1B" class="list-group-item mar-bot-5" onclick="selected(q1B,q1)">B) <%=answerB[0]%></li>
                        <li id="q1C" class="list-group-item mar-bot-5" onclick="selected(q1C,q1)">C) <%=answerC[0]%></li>
                        <li id="q1D" class="list-group-item mar-bot-5" onclick="selected(q1D,q1)">D) <%=answerD[0]%></li>
                    </ul>
                </div>
                <div class="col-sm-6">
                    <p class="mar-bot-10">2) <%=question[1] %></p>
                    <ul id="q2" class="list-group" style="width: 90%">
                        <li id="q2A" class="list-group-item mar-bot-5" onclick="selected(q2A,q2)">A) <%=answerA[1]%></li>
                        <li id="q2B" class="list-group-item mar-bot-5" onclick="selected(q2B,q2)">B) <%=answerB[1]%></li>
                        <li id="q2C" class="list-group-item mar-bot-5" onclick="selected(q2C,q2)">C) <%=answerC[1]%></li>
                        <li id="q2D" class="list-group-item mar-bot-5" onclick="selected(q2D,q2)">D) <%=answerD[1]%></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <p class="mar-bot-10">3) <%=question[2] %></p>
                    <ul id="q3" class="list-group" style="width: 90%">
                        <li id="q3A" class="list-group-item mar-bot-5" onclick="selected(q3A,q3)">A) <%=answerA[2]%></li>
                        <li id="q3B" class="list-group-item mar-bot-5" onclick="selected(q3B,q3)">B) <%=answerB[2]%></li>
                        <li id="q3C" class="list-group-item mar-bot-5" onclick="selected(q3C,q3)">C) <%=answerC[2]%></li>
                        <li id="q3D" class="list-group-item mar-bot-5" onclick="selected(q3D,q3)">D) <%=answerD[2]%></li>
                    </ul>
                </div>
                <div class="col-sm-6">
                    <p class="mar-bot-10">4) <%=question[3] %></p>
                    <ul id="q4" class="list-group" style="width: 90%">
                        <li id="q4A" class="list-group-item mar-bot-5" onclick="selected(q4A,q4)">A) <%=answerA[3]%></li>
                        <li id="q4B" class="list-group-item mar-bot-5" onclick="selected(q4B,q4)">B) <%=answerB[3]%></li>
                        <li id="q4C" class="list-group-item mar-bot-5" onclick="selected(q4C,q4)">C) <%=answerC[3]%></li>
                        <li id="q4D" class="list-group-item mar-bot-5" onclick="selected(q4D,q4)">D) <%=answerD[3]%></li>
                    </ul>
                </div>
            </div>
            <div class="row" style="margin:1em;">
                <div class="col-sm-4"></div>
                <div class="col-sm-4 text-center">
                    <input id="finishBtn" type="button" class="btn btn-success btn-lg" value="SINAVI TAMAMLA" />
                </div>
                <div class="col-sm-4"></div>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</asp:Content>
