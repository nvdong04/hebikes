<%@ Page Title="Sản phẩm" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="DHMshop.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid grid-cols-5 gap-4 mt-4">
        <div class="">
            <div class="h-full px-3 py-4 overflow-y-auto dark:bg-gray-800">
                <h1 class="py-2 px-4 text-white uppercase bg-orange-600">Danh mục sản phẩm</h1>
                <asp:Repeater ID="rpCategorys" runat="server">
                    <ItemTemplate>
                        <ul class="space-y-0.5 mt-2">
                            <li class="flex items-center p-2 text-gray-900 rounded-md dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group border" data-category-id="<%# Eval("id") %>">
                                <asp:LinkButton ID="LinkButton1"
                                    PostBackUrl='<%# String.Format("product.aspx?category={0}",Eval("id")) %>'
                                    runat="server">
                                <span class="flex-1 ml-3 whitespace-nowrap"><%# Eval("name") %></span>  
                                </asp:LinkButton>
                            </li>
                        </ul>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="col-span-4">
            <!--Product section-->
            <div class="product-section">
                <div class="flex flex-col w-full h-auto mt-[3%]">
                    <div class="flex flex-wrap">
                        <asp:ListView ID="lvProducts" runat="server">
                            <EmptyDataTemplate>
                                <table runat="server">
                                    <tr>
                                        <td style="font-size: 16px;">Không có sản phẩm nào.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <div class="grow max-w-[25%] inline-flex px-2 pb-4 min-w-[25%]">
                                    <a href="<%# String.Format("productdetail.aspx?id={0}",Eval("id")) %>" class="relative bg-white inline-flex items-stretch w-full h-full p-0 box-border">
                                        <%--<div class="absolute top-[4px] right-[4px] w-[28px] h-[28px] text-center z-10 rounded-full">
                                <div>
                                    <span class="absolute top-[4px] right-[4px] w-[24px] h-[24px] text-center z-10 rounded-full bg-gray-200">
                                        <div class="absolute top-0 left-0 right-0 bottom-0 m-auto">
                                            <i class="fa-solid fa-heart" style="color: #cc3535;"></i>
                                        </div>
                                    </span>
                                </div>
                            </div>--%>
                                        <div class="relative shadow-md rounded-lg min-w-full flex flex-col">
                                            <div class="relative">
                                                <div class="relative h-0 rounded-t-lg pb-[100%] w-full bg-white text-ellipsis overflow-hidden">
                                                    <div class="bg-no-repeat bg-cover inline-block my-0 mx-auto text-center w-full h-full absolute">
                                                        <img src="<%# Eval("image_url") %>" alt="" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="relative p-2 box-border overflow-hidden grow">
                                                <span class="text-gray-800 max-h-[38px] text-sm font-semibold leading-5 overflow-hidden whitespace-normal break-words"><%# Eval("name") %>
                                                </span>
                                                <div>
                                                    <div class="block w-full text-sm font-bold text-amber-700">
                                                        <%#:String.Format("{0:000,000}", Eval("price"))%> đ
                                                    </div>
                                                </div>
                                                <div class="flex align-items-center text-xs leading-6 mx-0 my-1 text-gray-600">
                                                    <%# Eval("brand") %>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
            <!--End product section-->
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            const queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);        
            if (urlParams.has("category")) {
                let selector = '[data-category-id = "' + urlParams.get("category") + '"]';
                const itemCategory = document.querySelector(selector);
                if (itemCategory) {
                    itemCategory.classList.add("bg-gray-200");
                }               
            }
        });
    </script>
</asp:Content>
