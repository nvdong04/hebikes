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
            <asp:BoundField DataField="category" HeaderText="Phân loại" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="product" HeaderText="Tên sản phẩm" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="code" HeaderText="Mã sản phẩm" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4 capitalize" />
            <asp:BoundField DataField="brand" HeaderText="Thương hiệu" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="price" DataFormatString="{0:000,000}đ" HeaderText="Giá sản phẩm" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="discount_price" DataFormatString="{0}%" HeaderText="Khuyến mại" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:TemplateField HeaderText="Trạng thái" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4">
                <ItemTemplate>
                    <%# Convert.ToBoolean(Eval("status").ToString()) == false ? "Đã hết hàng" : "Còn hàng" %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="created_at" HeaderText="Thời gian tạo" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:TemplateField HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4">
                <EditItemTemplate>
                    <asp:TextBox ID="txtid" Text='<%# Eval("id") %>' runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" 
                        CssClass="underline text-blue-600"
                        PostBackUrl='<%# String.Format("~/admin/product.aspx?id={0}", Eval("id")) %>' 
                        runat="server">Cập nhật</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CssClass="underline text-blue-600" runat="server" CausesValidation="False" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa k?');" CommandName="Delete" Text="Xoá"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
