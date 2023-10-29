﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="DHMshop.admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%if (Session["role"].ToString() == DHMshop.enums.Role.admin.ToString())
        {%>
    <div class="flex justify-between my-6">
        <div>
            <h1 class="text-xl uppercase">Danh sách người dùng</h1>
        </div>
        <a href="user.aspx" class="btn">Thêm người dùng</a>
    </div>
    <asp:GridView 
        ID="gvUsers" 
        DataKeyNames="id"
        AllowPaging="true"
        AllowSorting="true"
        AutoGenerateColumns="false"
        CssClass="w-full text-sm text-left text-gray-500 dark:text-gray-400"
        OnRowDeleting="gvUsers_RowDeleting"
        PageSize="10"
        runat="server">
        <HeaderStyle CssClass="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400" />
        <RowStyle CssClass="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600" />
        <Columns> 
            <asp:TemplateField HeaderText="STT" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>           
            <asp:BoundField DataField="username" HeaderText="Username" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="email" HeaderText="Email" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="role_name" HeaderText="Vai trò" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4 capitalize" />
            <asp:BoundField DataField="is_active" HeaderText="Trạng thái" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="created_at" HeaderText="Thời gian tạo" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:TemplateField HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4">
                <EditItemTemplate>
                    <asp:TextBox ID="txtid" Text='<%# Eval("id") %>' runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton 
                        ID="LinkButton1"
                        CssClass="underline text-blue-600"
                        PostBackUrl='<%# String.Format("~/admin/user.aspx?id={0}", Eval("id")) %>' 
                        runat="server">Cập nhật</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4">
                <ItemTemplate>
                    <asp:LinkButton 
                        ID="LinkButton2" 
                        runat="server"
                        CssClass="underline text-blue-600"
                        CausesValidation="False" 
                        OnClientClick="return confirm('Bạn có chắc chắn muốn xóa k?');" 
                        CommandName="Delete" 
                        Text="Xoá">
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%}
        else
        {%>
    <div class="flex justify-center content-center items-center mt-20">
        <h1 class="text-red-600 font-medium text-lg">Bạn không có quyền truy cập module này</h1>
    </div>
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
