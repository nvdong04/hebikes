<%@ Page Title="Danh sách sản phẩm" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="DHMshop.admin.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex justify-between my-6">
    <div>
        <h1 class="text-xl uppercase">Danh sách sản phẩm</h1>
    </div>
    <a href="product.aspx" class="btn">Thêm sản phẩm</a>
</div>
<asp:GridView 
        ID="gvProducts" 
        DataKeyNames="id"
        AllowPaging="true"
        AllowSorting="true"
        AutoGenerateColumns="false"
        CssClass="w-full text-sm text-left text-gray-500 dark:text-gray-400"
        OnRowDeleting="gvProducts_RowDeleting"
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
            <asp:BoundField DataField="category" HeaderText="Phân loại" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="product" HeaderText="Tên sản phẩm" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="code" HeaderText="Mã sản phẩm" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4 capitalize" />
            <asp:BoundField DataField="brand" HeaderText="Thương hiệu" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="price" HeaderText="Giá sản phẩm" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="discount_price" HeaderText="Khuyến mại" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:CheckBoxField DataField="status" HeaderText="Trạng thái" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="created_at" HeaderText="Thời gian tạo" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
        </Columns>
    </asp:GridView>
</asp:Content>
