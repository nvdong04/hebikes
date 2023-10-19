<%@ Page Title="" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="DHMshop.admin.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="bg-white dark:bg-gray-900">
        <div class="py-8 px-4 mx-auto max-w-2xl lg:py-16">
            <h2 class="mb-4 text-xl font-bold text-gray-900 dark:text-white">Thêm mới người dùng</h2>
            <!-- start form tag -->
                <div class="grid gap-4 sm:grid-cols-2 sm:gap-6">
                    <div class="sm:col-span-2">
                        <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                            Username
                            <span class="text-red-500">*</span>
                        </label>
                        <asp:TextBox 
                            ID="txtUsername" 
                            CssClass="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" 
                            runat="server" 
                            placeholder="Nhập username">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtUsername"
                            ForeColor="Red" CssClass="text-sm"
                            Display="Dynamic"
                            ErrorMessage="Trường thông tin bắt buộc">
                        </asp:RequiredFieldValidator>                      
                    </div>
                    <div class="sm:col-span-2">
                        <label for="brand" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                            Email
                            <span class="text-red-500">*</span>
                        </label>
                        <asp:TextBox 
                            ID="txtEmail" 
                            CssClass="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" 
                            placeholder="Nhập email"
                            runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator11" runat="server"
                            ControlToValidate="txtEmail"
                            ForeColor="Red" CssClass="text-sm"
                            Display="Dynamic"
                            ErrorMessage="Trường thông tin bắt buộc">
                        </asp:RequiredFieldValidator>                 
                    </div>
                    <div class="sm:col-span-2">
                        <label for="code" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                            Mật khẩu
                            <span class="text-red-500">*</span>
                        </label>
                        <asp:TextBox 
                            ID="txtPassword" 
                            TextMode="Password"
                            CssClass="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" 
                            placeholder="Nhập mật khẩu"
                            runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator10" runat="server"
                            ControlToValidate="txtPassword"
                            ForeColor="Red" CssClass="text-sm"
                            Display="Dynamic"
                            ErrorMessage="Trường thông tin bắt buộc">
                        </asp:RequiredFieldValidator>                       
                    </div>
                    <div class="sm:col-span-2">
                        <label for="category" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                            Vai trò
                            <span class="text-red-500">*</span>
                        </label>
                         <asp:DropDownList 
                             ID="ddlRole" 
                             CssClass="capitalize bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" 
                             runat="server">
                         </asp:DropDownList>
                        <%--<select id="category" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                            <option selected="">Chọn vai trò người dùng</option>
                            <option value="admin">Admin</option>
                            <option value="staff">Nhân Viên</option>
                        </select>--%>
                    </div>                   
                    <div>
                        <label class="relative inline-flex items-center cursor-pointer">
                            <input ID="cbStatus" runat="server" type="checkbox" value="" class="sr-only peer" checked>
                            <div class="w-11 h-6 bg-gray-200 rounded-full peer peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
                            <span class="ml-3 text-sm font-medium text-gray-900 dark:text-gray-300">Hoạt động</span>
                        </label>
                    </div>
                    
                </div>
                <asp:Button 
                    ID="btnAddNewUser" 
                    runat="server" 
                    Text="Thêm người dùng" 
                    CssClass="btn inline-flex items-center px-5 py-2.5 mt-4 sm:mt-6 text-sm font-medium text-center text-white rounded-md focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800" 
                    OnClick="btnAddNewUser_Click"/>             
            <!-- end form tag -->
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
