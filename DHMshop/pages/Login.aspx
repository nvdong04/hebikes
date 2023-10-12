<%@ Page Title="Đăng Nhập" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DHMshop.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w-full max-w-sm mx-auto px-4 py-12">
        <h1 class="text-3xl text-slate-800 font-bold mb-6">Xin chào bạn đến với XE ĐẸP! ✨
        </h1>
        <div class="form">
            <div class="space-y-4">
                <div>
                    <label
                        class="block text-sm font-medium mb-1 text-slate-600"
                        htmlfor="email">
                        Địa chỉ Email
                     <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtEmail" TextMode="Email" CssClass="form-input w-full" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtEmail"
                        ForeColor="red"
                        CssClass="text-xs"
                        ErrorMessage="Trường thông tin bắt buộc">
                </asp:RequiredFieldValidator>
                </div>
                <div>
                    <label
                        class="block text-sm font-medium mb-1 text-slate-600"
                        htmlfor="password">
                        Mật khẩu
                     <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-input w-full" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtPass"
                        ForeColor="red"
                        CssClass="text-xs"
                        ErrorMessage="Trường thông tin bắt buộc">
                </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="inputfield">
                <asp:Label ID="lbError" CssClass="text-sm" ForeColor="Red" Visible="false" runat="server" Text=""></asp:Label>
            </div>
            <div class="flex items-center justify-between mt-6">
                <div class="mr-1">
                    <a
                        class="text-sm underline x_ text-slate-600"
                        href="reset-password.html">Quên mật khẩu?
                    </a>
                </div>
                <asp:Button ID="btnLogin" CssClass="btn whitespace-nowrap ml-3" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />
            </div>
        </div>
        <div class="pt-5 mt-6 border-t cl border-slate-200">
            <div class="text-sm text-slate-600">
                Bạn chưa có tài khoản?
                  <a
                      class="font-medium text-orange-500 xd"
                      href="register.aspx">Đăng ký
                  </a>
            </div>

        </div>
    </div>

</asp:Content>
