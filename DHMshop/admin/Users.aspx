<%@ Page Title="" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="DHMshop.admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        PageSize="2"
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
        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
