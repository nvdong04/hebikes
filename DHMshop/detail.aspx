<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="DHMshop.detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .product-img {
            margin: 36px 0 0 0;
        }

        .product-wrap {
            padding: 12px 16px;
            font-size: 14px;
        }

        .product-name {
            font-size: 24px;
        }

        .product-price {
            padding-bottom: 16px;
        }

        .product-description {
            padding: 12px 0;
        }

        .options {
            padding: 12px 0;
        }

        .options-size {
            padding-bottom: 8px
        }

        .options-colors {
            padding-bottom: 16px;
        }

        .btn-add-to-cart {
            padding: 8px 12px;
        }

        .product-content {
            margin: 36px 0;
            font-size: 14px;
            color: var(--text-color);
        }

        .product-content-c {
            padding-right: 16px;
            line-height: 1.6rem;
        }

        .input-number {
            width: 80px;
            padding: 0 12px;
            vertical-align: top;
            text-align: center;
            outline: none;
        }

        .input-number,
        .input-number-decrement,
        .input-number-increment {
            border: 1px solid #ccc;
            height: 40px;
            user-select: none;
        }

        .input-number-decrement,
        .input-number-increment {
            display: inline-block;
            width: 30px;
            line-height: 38px;
            background: #f1f1f1;
            color: #444;
            text-align: center;
            font-weight: bold;
            cursor: pointer;
        }

            .input-number-decrement:active,
            .input-number-increment:active {
                background: #ddd;
            }

        .input-number-decrement {
            border-right: none;
            border-radius: 4px 0 0 4px;
        }

        .input-number-increment {
            border-left: none;
            border-radius: 0 4px 4px 0;
        }

        .input-quantity {
            margin: 16px 0;
        }

            .input-quantity input {
                padding: 6px;
            }

        .btn-add-cart {
            margin: 0 4px;
            background-color: #192a56;
            border-radius: 5px;
            font: 12px;
            color: #FFF;
            display: block;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            text-transform: capitalize;
            width: 20%;
            transition: box-shadow .3s ease-in-out, transform .3s ease-in-out;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <div class="row">
            <div class="col l-4 m-4 c-12">
                <div class="product-img">
                    <asp:Image ID="Image1" Width="350px" ImageUrl="../public/image/product/MG_5049.jpg" runat="server" />
                    <asp:Image ID="imgProduct" Width="350px" runat="server" />
                </div>
            </div>
            <div class="col l-8 m-8 c-12">
                <div class="product-wrap">
                    <h1 class="product-name">Tên sản phẩm</h1>
                    <div class="product-price">230000vnđ</div>
                    <h1 class="product-name">
                        <asp:Label ID="lbProductName" runat="server" Text=""></asp:Label>
                    </h1>
                    <div class="product-price">
                        <asp:Label ID="lbProductPrice" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="product-description">
                        <p>sàncdjhschsdhfcbjbndsajbfhadsf</p>
                        <span>Mô tả: </span>
                        <span>
                            <asp:Label ID="lbDescription" runat="server" Text=""></asp:Label>
                        </span>
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
                    <div class="input-quantity">
                        <span>Số lượng: </span>
                        <asp:TextBox ID="txtQuantity" Width="50px" CssClass="" Text="1" TextMode="Number" min="1" max="10" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            runat="server" ControlToValidate="txtQuantity" ValidationExpression="/^[1-9][0-9]?$|^10$/"
                            ErrorMessage=""></asp:RegularExpressionValidator>
                    </div>
                    <div>
                        <asp:Button ID="btnAddToCart" CssClass="btn btn--primary btn-add-to-cart" runat="server" Text="Thêm vào giỏ hàng" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col l-12 m-12 c-12">
                <div class="product-content">
                    <div class="product-content-title">
                        <h1>Mô tả chi tiết</h1>
                    </div>
                    <div class="product-content-c">
                        <asp:Label ID="lbDetail" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
</script>
</asp:Content>
