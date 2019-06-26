<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="sinavolusturma_konusarakogren.com.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="pane panel-success">
                <div class="panel-heading">
                    <div class="panel-title">
                        Yeni Üyelik
                    </div>
                </div>
                <div class="panel-body">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="form-group">
                                    <asp:TextBox ID="nameTxt" CssClass="form-control" runat="server" placeholder="Adınız"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="nameTxt" ErrorMessage="Boş geçilemez!"
                                        ForeColor="#f33a3f"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="surnameTxt" CssClass="form-control" runat="server" placeholder="Soyadınız"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="surnameTxt" ErrorMessage="Boş geçilemez!"
                                        ForeColor="#f33a3f"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="usernameTxt" CssClass="form-control" runat="server" placeholder="Kullanıcı Adınız"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="usernameTxt" ErrorMessage="Boş geçilemez!"
                                        ForeColor="#f33a3f"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-6">
                                    <asp:TextBox ID="passwordTxt" CssClass="form-control" runat="server" placeholder="Şifre" TextMode="Password" MaxLength="12" MinLength="8"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="passwordTxt" ErrorMessage="Boş geçilemez!"
                                        ForeColor="#f33a3f"></asp:RequiredFieldValidator><br />
                                    <asp:RegularExpressionValidator Display="Dynamic" 
                                        ControlToValidate="passwordTxt" 
                                        ID="RegularExpressionValidator"
                                        ValidationExpression="^[\s\S]{8,12}$" runat="server"
                                        ErrorMessage="8 veya 12 karakter giriniz." 
                                        ForeColor="#F33A3F"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="repasswordTxt" CssClass="form-control" runat="server" placeholder="Şifre Onay" TextMode="Password" MaxLength="12"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                        ControlToValidate="repasswordTxt" ErrorMessage="Boş geçilemez!"
                                        ForeColor="#f33a3f"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server"
                                        ControlToCompare="passwordTxt" ControlToValidate="repasswordTxt"
                                        ErrorMessage="Parolalar aynı değil!" ForeColor="#f33a3f"></asp:CompareValidator>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:RadioButtonList ID="membertypeList" runat="server">
                                <asp:ListItem Value="student" Selected="True">Öğrenci</asp:ListItem>
                                <asp:ListItem Value="teacher">Öğretmen</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="saveBtn" CssClass="btn btn-success" runat="server" Text="Kaydol" OnClick="saveBtn_Click" />
                            <p class="help-block pull-right">Zaten bir hesabınız var mı? <a href="Login.aspx">Üye Girişi</a></p>
                            <br />
                            <asp:Label ID="Label_Error" runat="server" ForeColor="#F33A3F"></asp:Label>
                        </div>
                    </div>
                    <div class="col-sm-2"></div>
                </div>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
</asp:Content>
