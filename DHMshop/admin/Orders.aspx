<%@ Page Title="" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="DHMshop.admin.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex justify-between my-6">
    <div>
        <h1 class="text-xl uppercase">Danh sách đơn hàng</h1>
    </div> 
</div>
    <asp:GridView 
        ID="gvOrders" 
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
            <asp:BoundField DataField="fullname" HeaderText="Tên khách hàng" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="phone" HeaderText="Số điện thoại" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:BoundField DataField="order_date" HeaderText="Ngày đặt hàng" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4 capitalize" />
            <asp:BoundField DataField="order_total_price" DataFormatString="{0:000,000}đ" HeaderText="Tổng tiền thanh toán" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            <asp:TemplateField HeaderText="Trạng thái" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4">
                <ItemTemplate>
                    <%# Convert.ToBoolean(Eval("status").ToString()) == false ? "Đang giao hàng" : "Đã giao hàng" %>
                </ItemTemplate>
            </asp:TemplateField> 
        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
