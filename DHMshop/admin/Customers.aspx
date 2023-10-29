<%@ Page Title="" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="DHMshop.admin.Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%if (true)
    {%>
<div class="flex justify-between my-6">
    <div>
        <h1 class="text-xl uppercase">Danh sách khách hàng</h1>
    </div>
</div>
<asp:GridView 
    ID="gvCustomers" 
    DataKeyNames="id"
    AllowPaging="true"
    AllowSorting="true"
    AutoGenerateColumns="false"
    CssClass="w-full text-sm text-left text-gray-500 dark:text-gray-400"
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
        <asp:BoundField DataField="fullname" HeaderText="Họ tên" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
        <asp:BoundField DataField="email" HeaderText="Email" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
        <asp:BoundField DataField="phone" HeaderText="Số điện thoại" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
        <asp:BoundField DataField="address" HeaderText="Địa chị" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
        <asp:BoundField DataField="is_active" HeaderText="Trạng thái" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
        <asp:BoundField DataField="created_at" HeaderText="Thời gian tạo" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
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
