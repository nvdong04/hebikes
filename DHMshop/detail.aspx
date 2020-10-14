<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="DHMshop.detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
            <asp:ListView ID="productDetail" runat="server">
                <ItemTemplate>
                    <div class="col l-4 m-4 c-12">
                        <div class="product-img">
                            <img src="<%# Eval("img")%>" alt="<%# Eval("name")%>" width="350px">
                        </div>
                    </div>
                    <div class="col l-8 m-8 c-12">
                        <div class="product-wrap">
                            <h1 class="product-name"><%# Eval("name")%></h1>
                            <h3 class="product-price"><%#:String.Format("{0:000,000}", Eval("price"))%> vnđ</h3>
                            <div class="product-description">
                                <p><%# Eval("description")%></p>
                            </div>

                            <button type="button" class="btn-add-cart btn-cart">Thêm Vào Giỏ</button>
                        </div>
                    </div>
                </ItemTemplate>

            </asp:ListView>
        </div>
    </div>
</asp:Content>
