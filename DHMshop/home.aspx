﻿<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="DHMshop.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/cardproduct.css" rel="stylesheet" />
    <style type="text/css">
        .options-list {
            font-size: 14px;
            color: var(--text-color);
            min-width:32px;
            padding: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <div class="row">
            <div class="col l-12 m-12 c-12">
                <h1 class="title-l">Sản phẩm mới nhất</h1>
                <asp:ListView ID="productList" runat="server"
                    DataKeyNames="id" GroupItemCount="4" OnItemCommand="productList_ItemCommand" >
                    <EmptyDataTemplate>
                        <table runat="server">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        
                        <div class="card">
                            <figure>
                                    <img src="<%# Eval("img")%>" alt="<%# Eval("name")%>">
                            </figure>
                            <section class="details">
                                <div class="min-details">
                                    <h2 class="product-name"><%# Eval("name")%><span>azul</span></h2>
                                    <h2 class="price"><%#:String.Format("{0:000,000}", Eval("price"))%></h2>
                                </div>

                                <div class="options">
                                    <div class="options-size">
                                        <h1>sizes</h1>
                                        <asp:DropDownList CssClass="options-list" ID="ddlSize" runat="server">
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
                                        <h1>colors</h1>
                                        <asp:DropDownList CssClass="options-list" ID="ddlColor" runat="server">
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
                                <div style="display:flex">
                                    <a href="detail.aspx?productID=<%# Eval("id")%>" class="btn-add-cart">Xem chi tiết</a>
                                    <%--<a href="detail.aspx?productID=<%# Eval("id")%>" class="btn-add-cart">add to cart</a>--%>
                                    <asp:Button ID="btnAddtoCart" runat="server" CssClass="btn-add-cart" Text="Add to cart" />
                                </div>
                            </section>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" style="width: 100%;">
                            <tbody>
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                                            <tr id="groupPlaceholder" runat="server"></tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server"></td>
                                </tr>
                                <tr></tr>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </div>
        
    </div>
</asp:Content>
