<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DHMshop.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <div class="title">
            Đăng nhập
        </div>
        <div class="form">
            <div class="inputfield">
                <label>Email</label>
                <asp:TextBox ID="txtUser" CssClass="input" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator8" runat="server"
                    ControlToValidate="txtUser"
                    ForeColor="red" CssClass="alert"
                    ErrorMessage="*">
                </asp:RequiredFieldValidator>
            </div>
            <div class="inputfield">
                <label>Mật khẩu</label>
                <asp:TextBox ID="txtPass" TextMode="Password" CssClass="input" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator9" runat="server"
                    ControlToValidate="txtPass"
                    ForeColor="red" CssClass="alert"
                    ErrorMessage="*">
                </asp:RequiredFieldValidator>
            </div>
            <div class="inputfield">
                <asp:Label ID="lbError" CssClass="alert" ForeColor="Red" Visible="false" runat="server" Text=""></asp:Label>
            </div>
            <div style="text-align:right;" class="">
                <a style="font-size:14px;display:block;margin:4px 8px 12px 0;" href="register.aspx">Đăng ký</a>
            </div>
            <div class="inputfield">
                <asp:Button ID="btnLogin" CssClass="btn" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />
            </div>
        </div>
    </div>
</asp:Content>
