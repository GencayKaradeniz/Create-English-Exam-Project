<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="sinavolusturma_konusarakogren.com.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="panel-title">
                        Üye Girişi
                    </div>
                </div>
                <div class="panel-body">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="form-group">
                                <asp:TextBox ID="usernameTxt" CssClass="form-control" runat="server" placeholder="Kullanıcı Adınız"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="usernameTxt" ErrorMessage="Boş geçilemez!"
                                    ForeColor="#f33a3f"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <asp:TextBox ID="passwordTxt" CssClass="form-control" runat="server" placeholder="Şifre" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="passwordTxt" ErrorMessage="Boş geçilemez!"
                                    ForeColor="#f33a3f"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <asp:Button ID="loginBtn" CssClass="btn btn-success" runat="server" Text="Giriş" OnClick="loginBtn_Click" />
                                <p class="help-block pull-right">Bir üyeliğiniz yok mu? <a href="Signup.aspx">Üye Ol</a></p>
                                <br />
                                <asp:Label ID="Label_Error" runat="server" ForeColor="#F33A3F"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-2"></div>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
</asp:Content>
