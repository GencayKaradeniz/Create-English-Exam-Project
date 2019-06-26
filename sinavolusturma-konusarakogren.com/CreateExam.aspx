<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateExam.aspx.cs" Inherits="sinavolusturma_konusarakogren.com.CreateExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <div class="panel-title">
                        Sınav Oluştur
                    </div>
                </div>
                <div class="panel-body">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">Yazı seç :</span>
                                <asp:DropDownList ID="texttitleList" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="texttitleList_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:Label ID="LabelError" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                        </div>
                        <asp:Panel ID="questionPanel" runat="server" CssClass="panel-border">
                            <p style="word-wrap:break-word;"><%=content %></p>
                        </asp:Panel>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-12 mar-bot-5">
                                    <div class="input-group">
                                        <span class="input-group-addon">Soru 1</span>
                                        <input type="text" class="form-control" name="question[0]" required />
                                    </div>
                                </div>
                                <div class="col-sm-6 mar-bot-5">
                                    <div class="input-group mar-bot-5">
                                        <span class="input-group-addon">A)</span>
                                        <input type="text" class="form-control" name="answerA[0]" required />
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">C)</span>
                                        <input type="text" class="form-control" name="answerC[0]" required />
                                    </div>
                                </div>
                                <div class="col-sm-6 mar-bot-5">
                                    <div class="input-group mar-bot-5">
                                        <span class="input-group-addon">B)</span>
                                        <input type="text" class="form-control" name="answerB[0]" required />
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">D)</span>
                                        <input type="text" class="form-control" name="answerD[0]" required />
                                    </div>
                                </div>
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon">Doğru cevabı seç :</span>
                                            <select class="form-control" name="correctAnswer[0]">
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                <option value="D">D</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-12 mar-bot-5">
                                    <div class="input-group">
                                        <span class="input-group-addon">Soru 2</span>
                                        <input type="text" class="form-control" name="question[1]" required />
                                    </div>
                                </div>
                                <div class="col-sm-6 mar-bot-5">
                                    <div class="input-group mar-bot-5">
                                        <span class="input-group-addon">A)</span>
                                        <input type="text" class="form-control" name="answerA[1]" required />
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">C)</span>
                                        <input type="text" class="form-control" name="answerC[1]" required />
                                    </div>
                                </div>
                                <div class="col-sm-6 mar-bot-5">
                                    <div class="input-group mar-bot-5">
                                        <span class="input-group-addon">B)</span>
                                        <input type="text" class="form-control" name="answerB[1]" required />
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">D)</span>
                                        <input type="text" class="form-control" name="answerD[1]" required />
                                    </div>
                                </div>
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon">Doğru cevabı seç :</span>
                                            <select class="form-control" name="correctAnswer[1]">
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                <option value="D">D</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-12 mar-bot-5">
                                    <div class="input-group">
                                        <span class="input-group-addon">Soru 3</span>
                                        <input type="text" class="form-control" name="question[2]" required />
                                    </div>
                                </div>
                                <div class="col-sm-6 mar-bot-5">
                                    <div class="input-group mar-bot-5">
                                        <span class="input-group-addon">A)</span>
                                        <input type="text" class="form-control" name="answerA[2]" required />
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">C)</span>
                                        <input type="text" class="form-control" name="answerC[2]" required />
                                    </div>
                                </div>
                                <div class="col-sm-6 mar-bot-5">
                                    <div class="input-group mar-bot-5">
                                        <span class="input-group-addon">B)</span>
                                        <input type="text" class="form-control" name="answerB[2]" required />

                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">D)</span>
                                        <input type="text" class="form-control" name="answerD[2]" required />

                                    </div>
                                </div>
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon">Doğru cevabı seç :</span>
                                            <select class="form-control" name="correctAnswer[2]">
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                <option value="D">D</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-12 mar-bot-5">
                                    <div class="input-group">
                                        <span class="input-group-addon">Soru 4</span>
                                        <input type="text" class="form-control" name="question[3]" required />
                                    </div>
                                </div>
                                <div class="col-sm-6 mar-bot-5">
                                    <div class="input-group mar-bot-5">
                                        <span class="input-group-addon">A)</span>
                                        <input type="text" class="form-control" name="answerA[3]" required />
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">C)</span>
                                        <input type="text" class="form-control" name="answerC[3]" required />
                                    </div>
                                </div>
                                <div class="col-sm-6 mar-bot-5">
                                    <div class="input-group mar-bot-5">
                                        <span class="input-group-addon">B)</span>
                                        <input type="text" class="form-control" name="answerB[3]" required />

                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">D)</span>
                                        <input type="text" class="form-control" name="answerD[3]" required />
                                    </div>
                                </div>
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon">Doğru cevabı seç :</span>
                                            <select class="form-control" name="correctAnswer[3]">
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                <option value="D">D</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>
                        <div class="col-md-4"></div>
                        <div class="col-md-4 text-center">
                            <asp:Button ID="createExamBtn" CssClass="btn btn-lg btn-success" runat="server" Text="SINAVI OLUŞTUR" OnClick="createExamBtn_Click" />
                        </div>
                        <div class="col-md-4"></div>
                    </div>
                    <div class="col-sm-1"></div>
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
</asp:Content>
