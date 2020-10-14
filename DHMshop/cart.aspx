<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="DHMshop.cart" %>
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
        .lbError{
            padding: 120px 0;
            font-size: 24px;
            display: block;
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <div class="row">
            <div class="col l-12 m-12 c-12">
                <h1 class="title-l">Giỏ hàng</h1>
                <asp:Label ID="lbThongbao" CssClass="" runat="server" Text=""></asp:Label>
                <asp:GridView ID="gvCart" runat="server" CssClass="table" AutoGenerateColumns="False">
                    <EmptyDataTemplate>
                        <h1 style="text-align:center;">Không có sản phẩm nào trong giỏ hàng</h1>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Sản phẩm" DataField="product_name" />
                        <asp:BoundField HeaderText="Giá" DataField="product_price" DataFormatString="{0:000,000}" />
                        <asp:BoundField HeaderText="Số lượng" DataField="quantity" />
                        <asp:BoundField HeaderText="Thành tiền" DataField="thanhtien" DataFormatString="{0:000,000}" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div style="text-align:right; margin: 32px 0;">
                    <asp:LinkButton ID="lbCheckOut" PostBackUrl="~/checkout.aspx" CssClass="check-out" runat="server">Tiến hành đặt hàng</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
