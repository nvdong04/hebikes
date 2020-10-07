<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="DHMshop.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/cardproduct.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <div class="row">
            <div class="col l-12 m-12 c-12">
                <h1 class="title-l">Sản phẩm mới nhất</h1>
                <asp:ListView ID="productList" runat="server"
                    DataKeyNames="id" GroupItemCount="4">
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
                                        <ul>
                                            <li>xs</li>
                                            <li>s</li>
                                            <li>m</li>
                                            <li>l</li>
                                            <li>xl</li>
                                        </ul>
                                    </div>

                                    <div class="options-colors">
                                        <h1>colors</h1>
                                        <ul>
                                            <li></li>
                                            <li></li>
                                            <li></li>
                                            <li></li>
                                            <li></li>
                                        </ul>
                                    </div>
                                </div>
                                <div style="display:flex">
                                    <a href="detail.aspx?productID=<%# Eval("id")%>" class="btn-add-cart">Xem chi tiết</a>
                                    <a href="detail.aspx?productID=<%# Eval("id")%>" class="btn-add-cart">add to cart</a>
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
