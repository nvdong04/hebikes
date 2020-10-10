<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="DHMshop.detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <div class="row">
            <div class="col l-4 m-4 c-12">
                <div class="product-img">
                    <asp:Image ID="Image1" Width="350px" ImageUrl="../public/image/product/MG_5049.jpg" runat="server" />
                </div>
            </div>
            <div class="col l-8 m-8 c-12">
                <div class="product-wrap">
                    <h1 class="product-name">Tên sản phẩm</h1>
                    <div class="product-price">230000vnđ</div>
                    <div class="product-description">
                        <p>sàncdjhschsdhfcbjbndsajbfhadsf</p>
                    </div>
                    <div class="options">
                        <div class="options-size">
                            <span>Size</span>
                            <asp:DropDownList ID="ddlSize" runat="server">
                                <asp:ListItem Value="37" Text="37"></asp:ListItem>
                                <asp:ListItem Value="38" Text="38"></asp:ListItem>
                                <asp:ListItem Value="39" Text="39"></asp:ListItem>
                                <asp:ListItem Value="40" Text="40"></asp:ListItem>
                                <asp:ListItem Value="41" Text="41"></asp:ListItem>
                                <asp:ListItem Value="42" Text="42"></asp:ListItem>
                                <asp:ListItem Value="43" Text="43"></asp:ListItem>
                                <asp:ListItem Value="44" Text="44"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="options-colors">
                            <span>Color</span>
                            <asp:DropDownList ID="ddlColor" runat="server">
                                <asp:ListItem Value="Trắng" Text="Trắng"></asp:ListItem>
                                <asp:ListItem Value="Đen" Text="Đen"></asp:ListItem>
                                <asp:ListItem Value="Vàng" Text="Vàng"></asp:ListItem>
                                <asp:ListItem Value="Xanh" Text="Xanh"></asp:ListItem>
                                <asp:ListItem Value="Xanh đen" Text="Xanh đen"></asp:ListItem>
                                <asp:ListItem Value="Nâu" Text="Nâu"></asp:ListItem>
                                <asp:ListItem Value="Cam" Text="Cam"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
