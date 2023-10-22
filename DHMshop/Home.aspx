<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DHMshop.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/cardproduct.css" rel="stylesheet" />
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Slideshow container -->
    <div class="py-2.5 mt-4">
        <div class="max-w-screen-xl">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="https://www.facebook.com/xelananh.vn" class="clearfix" title="XE MÁY 50CC- XE ĐIỆN">
                            <picture>
                                <source media="(min-width: 1200px)" srcset="//bizweb.dktcdn.net/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389">
                                <source media="(min-width: 992px)" srcset="//bizweb.dktcdn.net/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389">
                                <source media="(min-width: 569px)" srcset="//bizweb.dktcdn.net/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389">
                                <source media="(max-width: 480px)" srcset="//bizweb.dktcdn.net/thumb/grande/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389">
                                <img src="//bizweb.dktcdn.net/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389" alt="XE MÁY 50CC- XE ĐIỆN" class="img-responsive center-block">
                            </picture>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="https://www.facebook.com/xelananh.vn" class="clearfix" title="XE MÁY 50CC- XE ĐIỆN">
                            <picture>
                                <source media="(min-width: 1200px)" srcset="//bizweb.dktcdn.net/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389">
                                <source media="(min-width: 992px)" srcset="//bizweb.dktcdn.net/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389">
                                <source media="(min-width: 569px)" srcset="//bizweb.dktcdn.net/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389">
                                <source media="(max-width: 480px)" srcset="//bizweb.dktcdn.net/thumb/grande/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389">
                                <img src="//bizweb.dktcdn.net/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389" alt="XE MÁY 50CC- XE ĐIỆN" class="img-responsive center-block">
                            </picture>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="https://www.facebook.com/xelananh.vn" class="clearfix" title="XE MÁY 50CC- XE ĐIỆN">
                            <picture>
                                <source media="(min-width: 1200px)" srcset="//bizweb.dktcdn.net/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389">
                                <source media="(min-width: 992px)" srcset="//bizweb.dktcdn.net/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389">
                                <source media="(min-width: 569px)" srcset="//bizweb.dktcdn.net/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389">
                                <source media="(max-width: 480px)" srcset="//bizweb.dktcdn.net/thumb/grande/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389">
                                <img src="//bizweb.dktcdn.net/100/443/045/themes/844966/assets/slider_1.jpg?1695197142389" alt="XE MÁY 50CC- XE ĐIỆN" class="img-responsive center-block">
                            </picture>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/slider-->
    <!--Product latest section-->
    <div class="product-section mt-4">
        <div class="border-b-2 border-red-600 py-2">
            <span class="py-2 px-4 text-xl text-white uppercase font-medium bg-orange-600">Mới nhất</span>
        </div>
        <div class="flex flex-col w-full h-auto mt-[3%]">
            <div class="flex flex-wrap">
                <asp:ListView ID="lvProductLatest" runat="server">
                    <EmptyDataTemplate>
                        <table runat="server">
                            <tr>
                                <td style="font-size: 16px;">Không có sản phẩm nào.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="grow max-w-[20%] inline-flex px-2 pb-4 min-w-[20%]">
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
    <!--End product latest section-->
    <!--Product saling section-->
    <div class="product-section mt-4">
        <div class="border-b-2 border-red-600 py-2">
            <span class="py-2 px-4 text-xl text-white uppercase font-medium bg-orange-600">Đang giảm giá</span>
        </div>
        <div class="flex flex-col w-full h-auto mt-[3%]">
            <div class="flex flex-wrap">
                <asp:ListView ID="lvProductSaling" runat="server">
                    <EmptyDataTemplate>
                        <table runat="server">
                            <tr>
                                <td style="font-size: 16px;">Không có sản phẩm nào.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="grow max-w-[20%] inline-flex px-2 pb-4 min-w-[20%]">
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
    <!--End product latest section-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script>
        var swiper = new Swiper(".mySwiper", {});
    </script>
</asp:Content>
