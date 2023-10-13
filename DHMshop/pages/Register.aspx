<%@ Page Title="Đăng ký" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DHMshop.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w-full max-w-sm mx-auto px-4 py-12">
        <h1 class="text-3xl text-slate-800 font-bold mb-6">Xin chào bạn đến với XE ĐẸP! ✨
        </h1>
        <div class="form">
            <div class="space-y-4">
                <div class="form-group">
                    <div class="form-group">
                        <asp:Label ID="lbError" CssClass="alert" Visible="true" ForeColor="Red" runat="server" Text=""></asp:Label>
                    </div>
                    <label
                        class="block text-sm font-medium mb-1 text-slate-600"
                        htmlfor="email">
                        Họ và tên
                     <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtFullName" CssClass="form-input w-full" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtFullName"
                        Display="Dynamic"
                        ForeColor="red" CssClass="text-sm"
                        ErrorMessage="Trường thông tin bắt buộc">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label
                        class="block text-sm font-medium mb-1 text-slate-600"
                        htmlfor="email">
                        Địa chỉ email
                     <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtEmail" CssClass="form-input w-full" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator5" runat="server"
                        ControlToValidate="txtEmail"
                        Display="Dynamic"
                        ForeColor="red" CssClass="text-sm"
                        ErrorMessage="Trường thông tin bắt buộc">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator1"
                        Display="Dynamic"
                        ControlToValidate="txtEmail" ForeColor="Red"
                        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
                        runat="server" ErrorMessage="Email không đúng định dạng">
                    </asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label
                        class="block text-sm font-medium mb-1 text-slate-600"
                        htmlfor="email">
                        Mật khẩu
                     <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-input w-full" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredPassWord" runat="server"
                        ControlToValidate="txtPassword"
                        Display="Dynamic"
                        ForeColor="red" CssClass="text-sm"
                        ErrorMessage="Trường thông tin bắt buộc">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="vldPassWord" runat="server" ForeColor="Red"
                        Display="Dynamic"
                        ControlToValidate="txtPassword" ValidationExpression="^[a-zA-Z0-9]+$"
                        ErrorMessage="Mật khẩu chỉ bao gồm chữ cái và số">
                    </asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label
                        class="block text-sm font-medium mb-1 text-slate-600"
                        htmlfor="email">
                        Xác nhận mật khẩu
                     <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtConfirmPassword" TextMode="Password" CssClass="form-input w-full" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4" runat="server"
                        ControlToValidate="txtConfirmPassword"
                        Display="Dynamic"
                        ForeColor="red" CssClass="text-sm"
                        ErrorMessage="Trường thông tin bắt buộc">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator
                        ID="CompareValidator1" runat="server"
                        ControlToCompare="txtPassword"
                        Display="Dynamic"
                        ControlToValidate="txtConfirmPassword" ForeColor="Red"
                        ErrorMessage="Mật khẩu không giống mật khẩu đã nhập trước đó">
                    </asp:CompareValidator>
                </div>              
                <div class="form-group">
                    <label
                        class="block text-sm font-medium mb-1 text-slate-600"
                        htmlfor="email">
                        Số điện thoại
                     <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtPhone" CssClass="form-input w-full" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator6" runat="server"
                        ControlToValidate="txtPhone"
                        Display="Dynamic"
                        ForeColor="red" CssClass="text-sm"
                        ErrorMessage="Trường thông tin bắt buộc">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator3" ForeColor="Red"
                        Display="Dynamic"
                        ControlToValidate="txtPhone" ValidationExpression="(03|07|08|09|01[2|6|8|9])+([0-9]{8})\b"
                        runat="server" ErrorMessage="Số điện thoại không dúng định dạng">
                    </asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label
                        class="block text-sm font-medium mb-1 text-slate-600"
                        htmlfor="email">
                        Địa chỉ
                     <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtAddress" TextMode="SingleLine" CssClass="form-input w-full" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator7" runat="server"
                        ControlToValidate="txtAddress"
                        Display="Dynamic"
                        ForeColor="red" CssClass="text-sm"
                        ErrorMessage="Trường thông tin bắt buộc">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="flex items-center">
                        <input checked type="checkbox" class="form-checkbox" />
                        <span class="text-sm ml-2">Đồng ý với các điều khoản và điều kiện</span>
                    </label>
                </div>
            </div>
            <div class="form-group flex items-center justify-between mt-6">
                <div class="mr-1">
                    <a
                        class="text-sm underline x_ text-slate-600"
                        href="reset-password.html">Đăng nhập
                    </a>
                </div>
                <asp:Button ID="btnRegister" CssClass="btn" runat="server" Text="Đăng ký" OnClick="btnRegister_Click" />
            </div>
        </div>
    </div>
</asp:Content>
