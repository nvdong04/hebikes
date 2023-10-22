<%@ Page Title="Thanh toán" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="DHMshop.checkout" %>

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

        .check-info {
            margin: 12px;
        }

        .checkout-item {
            padding: 12px;
            font-size: 14px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pb-8 mt-6">
        <h1 class="text-xl mb-5">Chi tiết thanh toán</h1>
        <asp:GridView ID="gvCart"
            CssClass="w-full text-sm text-left text-gray-500 dark:text-gray-400"
            runat="server"
            OnRowDataBound="gvCart_RowDataBound"
            AutoGenerateColumns="False">
            <EmptyDataTemplate>
                <h2 style="text-align: center;">Không có sản phẩm nao trong giỏ hàng</h2>
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
                <asp:BoundField HeaderText="Giá" DataField="product_price" DataFormatString="{0:000,000}" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
                <asp:BoundField HeaderText="Số lượng" DataField="quantity" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
                <asp:BoundField HeaderText="Thành tiền" DataField="into_money" DataFormatString="{0:000,000}" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
            </Columns>
        </asp:GridView>
        <div class="check-info">
            <div class="checkout-item text-right font-medium">
                <span>Tổng tiền thanh toán:</span>
                <asp:Label ID="lbTotalPrice" runat="server" Text=""></asp:Label>
            </div>
            <div class="checkout-item">
                <span>Tên khách hàng:</span>
                <asp:Label ID="lbFullname" CssClass="font-medium" runat="server" Text=""></asp:Label>
            </div>
            <div class="checkout-item">
                <span>Địa chỉ nhận hàng:</span>
                <asp:Label ID="lbAdress" CssClass="font-medium" runat="server" Text=""></asp:Label>
            </div>
            <div class="checkout-item">
                <span>Số điện thoại khách hàng:</span>
                <asp:Label ID="lbPhoneNumber" CssClass="font-medium" runat="server" Text=""></asp:Label>
            </div>
            <div class="checkout-item">
                <span>Ghi chú(Nếu có):</span>
                <asp:TextBox ID="txtOrderNote" CssClass="form-input mt-2" Width="100%" TextMode="MultiLine" Rows="4" runat="server"></asp:TextBox>
            </div>
            <div class="checkout-item">
                <p>Bạn vui lòng kiểm tra lại thông tin trước khi đặt hàng, chúng tôi không chịu trách nhiệm nếu thông tin quý khách đưa ra không đúng.</p>
            </div>
            <div class="checkout-item text-right">
                <asp:Button ID="btnOrder" OnClick="btnOrder_Click" CssClass="btn btn--primary" runat="server" Text="Đặt hàng" />
            </div>
        </div>
    </div>
</asp:Content>
