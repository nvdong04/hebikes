<%@ Page Title="Sản phẩm" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="DHMshop.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/cardproduct.css" rel="stylesheet" />
    <style>
        .pagebar {
            text-align: right;
            margin: 12px 16px;
        }
        .btn-cur-page {
            font-size: 14px;
            color: var(--text-color);
            padding: 4px 8px;
            margin:4px 2px;
            background: red;
        }
        .text-info {
            font-size: 14px;
            color: var(--text-color);
            padding: 4px 8px;
            margin:4px 2px;
        }

        .text-success {
            font-size: 14px;
            color: var(--text-color);
            padding: 4px;
            margin:4px 2px;
        }

        .btn-num-page {
            font-size: 14px;
            color: var(--text-color);
            padding: 4px 8px;
            margin:4px 2px;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <div class="row">
            <div class="col l-3 m-3 c-0">
                <div style="border-right:2px solid #eee">
                    <h1>Danh mục sản phẩm</h1>
                    <asp:DataList ID="category" runat="server">
                        <ItemTemplate>
                            <ul>
                                <li class="sub-menu-item">
                                    <asp:LinkButton ID="LinkButton1" 
                                        CssClass="item-category" 
                                        PostBackUrl='<%# String.Format("product.aspx?category={0}",Eval("id")) %>' 
                                        runat="server"><%# Eval("name") %></asp:LinkButton>
                                </li>
                            </ul>
                        </ItemTemplate>
                    </asp:DataList> 
                </div>
            </div>
            <div class="col l-9 m-9 c-12">
                <h1 class="title-l">Sản phẩm</h1>
                <asp:ListView ID="productList" runat="server" OnPagePropertiesChanging="OnPagePropertiesChanging"
                    DataKeyNames="id" GroupItemCount="3">
                    <EmptyDataTemplate>
                        <table runat="server">
                            <tr>
                                <td style="font-size:16px;">No data was returned.</td>
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
                        <div class="card" style="width:270px;">
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
                                            <li>39</li>
                                            <li>40</li>
                                            <li>41</li>
                                            <li>42</li>
                                            <li>43</li>
                                            <li>44</li>
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
                <div class="pagebar">
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="productList" PageSize="12" ClientIDMode="Static">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true"
                                ShowNextPageButton="false" ButtonCssClass="prev-page text-info" />
                            <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn-cur-page text-info"
                                NumericButtonCssClass="btn-num-page text-success" />
                            <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="true" ShowNextPageButton="true"
                                ShowPreviousPageButton="false" ButtonCssClass="next-page text-info" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
