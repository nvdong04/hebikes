<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="DHMshop.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table {
            width: 100%;
            border-collapse: collapse;
            font-size: 1.4rem;
        }

        .table-row {
            padding: 8px 12px;
        }

        table, th, td {
            border: 1px solid #ddd;
            text-align: center;
        }

        th, td {
            padding: 12px 16px;
        }

        thead {
            font-weight: 600;
        }

        tbody tr td a {
            color: blue;
        }

        .check-out {
            font-size: 16px;
            text-align: right;
            border: 1px solid #eee;
            border-radius: 2px;
            padding: 8px 12px;
            color: var(--white-color);
            background: var(--primary-color);
        }

        .lbError {
            padding: 120px 0;
            font-size: 24px;
            display: block;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pb-8 mt-6">
        <h1 class="text-xl mb-5">Giỏ hàng</h1>
        <asp:Label ID="lbThongbao" CssClass="" runat="server" Text=""></asp:Label>
        <asp:GridView
            ID="gvCart"
            DataKeyNames="cart_item_id"
            OnRowDeleting="gvCart_RowDeleting"
            runat="server"
            CssClass="w-full text-sm text-left text-gray-500 dark:text-gray-400"
            AutoGenerateColumns="False">
            <EmptyDataTemplate>
                <h1 class="text-center py-24">Không có sản phẩm nào trong giỏ hàng</h1>
            </EmptyDataTemplate>
            <HeaderStyle CssClass="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400" />
            <RowStyle CssClass="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600" />
            <Columns>
                <asp:TemplateField HeaderText="STT">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Sản phẩm" DataField="product_name" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
                <asp:BoundField HeaderText="Giá" DataField="product_price" DataFormatString="{0:000,000}đ" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
                <asp:BoundField HeaderText="Số lượng" DataField="quantity" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
                <asp:BoundField HeaderText="Thành tiền" DataField="into_money" DataFormatString="{0:000,000}đ" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
                <asp:TemplateField ShowHeader="False" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Xoá"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div style="text-align: right; margin: 32px 0;">
            <asp:LinkButton ID="lbCheckOut" PostBackUrl="~/Checkout.aspx" CssClass="btn" runat="server">Tiến hành đặt hàng</asp:LinkButton>
        </div>
    </div>
</asp:Content>
