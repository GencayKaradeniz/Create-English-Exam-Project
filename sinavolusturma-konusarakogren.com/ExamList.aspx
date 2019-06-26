<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExamList.aspx.cs" Inherits="sinavolusturma_konusarakogren.com.ExamList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-xs-1">
                        <h4>#</h4>
                    </div>
                    <div class="col-xs-5">
                        <h4>Başlık</h4>
                    </div>
                    <div class="col-xs-6">
                        <h4>Tarih</h4>
                    </div>
                </div>
            </div>
            <%= tests %>
        </div>
        <div class="col-md-3"></div>
    </div>
</asp:Content>
