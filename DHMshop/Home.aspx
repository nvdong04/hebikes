<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DHMshop.home" %>

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
    <!--Product section-->
    <div class="product-section mt-4">
        <div class="border-b-2 border-red-600 py-2">
            <span class="py-2 px-4 text-xl text-white uppercase font-medium bg-orange-600">Sản phẩm mới nhất</span>
        </div>
        <div class="flex flex-col w-full h-auto mt-[3%]">
            <div class="flex flex-wrap">
                <div class="grow max-w-[20%] inline-flex px-2 pb-4 min-w-[20%]">
                    <a href="ProductDetail.aspx?product=1" class="relative bg-white inline-flex items-stretch w-full h-full p-0 box-border">
                        <div class="absolute top-[4px] right-[4px] w-[28px] h-[28px] text-center z-10 rounded-full">
                            <div>
                                <span class="absolute top-[4px] right-[4px] w-[24px] h-[24px] text-center z-10 rounded-full bg-gray-200">
                                    <div class="absolute top-0 left-0 right-0 bottom-0 m-auto">
                                        <i class="fa-solid fa-heart" style="color: #cc3535;"></i>
                                    </div>
                                </span>
                            </div>
                        </div>

                        <div class="relative shadow-md rounded-lg min-w-full flex flex-col">

                            <div class="relative">
                                <div class="relative h-0 rounded-t-lg pb-[100%] w-full bg-white text-ellipsis	overflow-hidden">
                                    <div class="bg-no-repeat bg-cover inline-block my-0 mx-auto text-center w-full h-full absolute">
                                        <img src="https://bizweb.dktcdn.net/100/443/045/products/xe-dap-dien-jvc-eco-g9s-xi-mang-9c68291e-c586-4a10-8f84-443b142a742a.png?v=1691926303330" alt="" />
                                    </div>
                                </div>
                            </div>
                            <div class="relative p-2 box-border overflow-hidden grow">
                                <span class="text-gray-800 max-h-[38px] text-sm font-semibold leading-5 overflow-hidden whitespace-normal break-words		">iPhone 14 Pro Max
                                </span>
                                <div>
                                    <div class="block w-full text-sm font-bold text-amber-700">
                                        $ 1900
                                    </div>
                                </div>
                                <div class="flex align-items-center text-xs leading-6 mx-0 my-1 text-gray-600">
                                    iBox
                                </div>
                                <div class="min-h-[14px] text-xs flex justify-between">
                                    <div class="align-items-center my-1 mx-0">
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <span class="align-midle ml-1 text-gray-600">(1400)
                                        </span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </a>
                </div>

                <div class="grow max-w-[20%] inline-flex px-2 pb-4 min-w-[20%]">
                    <a href="#" class="relative bg-white inline-flex items-stretch w-full h-full p-0 box-border">
                        <div class="absolute top-[4px] right-[4px] w-[28px] h-[28px] text-center z-10 rounded-full">
                            <div>
                                <span class="absolute top-[4px] right-[4px] w-[24px] h-[24px] text-center z-10 rounded-full bg-gray-200">
                                    <div class="absolute top-0 left-0 right-0 bottom-0 m-auto">
                                        <i class="fa-solid fa-heart" style="color: #949494;"></i>
                                    </div>
                                </span>
                            </div>
                        </div>
                        <div class="relative shadow-md rounded-lg min-w-full flex flex-col">
                            <div class="relative">
                                <div class="relative h-0 rounded-t-lg pb-[100%] w-full bg-white text-ellipsis	overflow-hidden">
                                    <div class="bg-no-repeat bg-cover inline-block my-0 mx-auto text-center w-full h-full absolute">
                                        <img src="https://bizweb.dktcdn.net/100/443/045/products/xe-dap-dien-jvc-eco-g9s-xi-mang-9c68291e-c586-4a10-8f84-443b142a742a.png?v=1691926303330" alt="" />
                                    </div>
                                </div>
                            </div>
                            <div class="relative p-2 box-border overflow-hidden grow">
                                <span class="text-gray-800 max-h-[38px] text-sm font-semibold leading-5 overflow-hidden whitespace-normal break-words		">iPhone 14 Pro Max
                                </span>
                                <div>
                                    <div class="block w-full text-sm font-bold text-amber-700">
                                        $ 1900
                                    </div>
                                </div>
                                <div class="flex align-items-center text-xs leading-6 mx-0 my-1 text-gray-600">
                                    iBox
                                </div>
                                <div class="min-h-[14px] text-xs">
                                    <div class="align-items-center my-1 mx-0">
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star-half" style="color: #7a7600;"></i>
                                        <span class="align-midle ml-1 text-gray-600">(1400)
                                        </span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </a>
                </div>

                <div class="grow max-w-[20%] inline-flex px-2 pb-4 min-w-[20%]">
                    <a href="#" class="relative bg-white inline-flex items-stretch w-full h-full p-0 box-border">
                        <div class="absolute top-[4px] right-[4px] w-[28px] h-[28px] text-center z-10 rounded-full">
                            <div>
                                <span class="absolute top-[4px] right-[4px] w-[24px] h-[24px] text-center z-10 rounded-full bg-gray-200">
                                    <div class="absolute top-0 left-0 right-0 bottom-0 m-auto">
                                        <i class="fa-solid fa-heart" style="color: #949494;"></i>
                                    </div>
                                </span>
                            </div>
                        </div>
                        <div class="relative shadow-md rounded-lg min-w-full flex flex-col">
                            <div class="relative">
                                <div class="relative h-0 rounded-t-lg pb-[100%] w-full bg-white text-ellipsis	overflow-hidden">
                                    <div class="bg-no-repeat bg-cover inline-block my-0 mx-auto text-center w-full h-full absolute">
                                        <img src="https://fakeimg.pl/400x400/a5edc0/616161?text=product" alt="" />
                                    </div>
                                </div>
                            </div>
                            <div class="relative p-2 box-border overflow-hidden grow">
                                <span class="text-gray-800 max-h-[38px] text-sm font-semibold leading-5 overflow-hidden whitespace-normal break-words		">iPhone 14 Pro Max
                                </span>
                                <div>
                                    <div class="block w-full text-sm font-bold text-amber-700">
                                        $ 1900
                                    </div>
                                </div>
                                <div class="flex align-items-center text-xs leading-6 mx-0 my-1 text-gray-600">
                                    iBox
                                </div>
                                <div class="min-h-[14px] text-xs">
                                    <div class="align-items-center my-1 mx-0">
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-regular fa-star" style="color: #7a7600;"></i>
                                        <span class="align-midle ml-1 text-gray-600">(1400)
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="grow max-w-[20%] inline-flex px-2 pb-4 min-w-[20%]">
                    <a href="#" class="relative bg-white inline-flex items-stretch w-full h-full p-0 box-border">
                        <div class="absolute top-[4px] right-[4px] w-[28px] h-[28px] text-center z-10 rounded-full">
                            <div>
                                <span class="absolute top-[4px] right-[4px] w-[24px] h-[24px] text-center z-10 rounded-full bg-gray-200">
                                    <div class="absolute top-0 left-0 right-0 bottom-0 m-auto">
                                        <i class="fa-solid fa-heart" style="color: #949494;"></i>
                                    </div>
                                </span>
                            </div>
                        </div>
                        <div class="relative shadow-md rounded-lg min-w-full flex flex-col">
                            <div class="relative">
                                <div class="relative h-0 rounded-t-lg pb-[100%] w-full bg-white text-ellipsis	overflow-hidden">
                                    <div class="bg-no-repeat bg-cover inline-block my-0 mx-auto text-center w-full h-full absolute">
                                        <img src="https://fakeimg.pl/400x400/a5edc0/616161?text=product" alt="" />
                                    </div>
                                </div>
                            </div>
                            <div class="relative p-2 box-border overflow-hidden grow">
                                <span class="text-gray-800 max-h-[38px] text-sm font-semibold leading-5 overflow-hidden whitespace-normal break-words		">iPhone 14 Pro Max
                                </span>
                                <div>
                                    <div class="block w-full text-sm font-bold text-amber-700">
                                        $ 1900
                                    </div>
                                </div>
                                <div class="flex align-items-center text-xs leading-6 mx-0 my-1 text-gray-600">
                                    iBox
                                </div>
                                <div class="min-h-[14px] text-xs">
                                    <div class="align-items-center my-1 mx-0">
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <span class="align-midle ml-1 text-gray-600">(1400)
                                        </span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </a>
                </div>
                <div class="grow max-w-[20%] inline-flex px-2 pb-4 min-w-[20%]">
                    <a href="#" class="relative bg-white inline-flex items-stretch w-full h-full p-0 box-border">
                        <div class="absolute top-[4px] right-[4px] w-[28px] h-[28px] text-center z-10 rounded-full">
                            <div>
                                <span class="absolute top-[4px] right-[4px] w-[24px] h-[24px] text-center z-10 rounded-full bg-gray-200">
                                    <div class="absolute top-0 left-0 right-0 bottom-0 m-auto">
                                        <i class="fa-solid fa-heart" style="color: #949494;"></i>
                                    </div>
                                </span>
                            </div>
                        </div>
                        <div class="relative shadow-md rounded-lg min-w-full flex flex-col">
                            <div class="relative">
                                <div class="relative h-0 rounded-t-lg pb-[100%] w-full bg-white text-ellipsis	overflow-hidden">
                                    <div class="bg-no-repeat bg-cover inline-block my-0 mx-auto text-center w-full h-full absolute">
                                        <img src="https://bizweb.dktcdn.net/100/443/045/products/xe-dap-dien-jvc-eco-g9s-xi-mang-9c68291e-c586-4a10-8f84-443b142a742a.png?v=1691926303330" alt="" />
                                    </div>
                                </div>
                            </div>
                            <div class="relative p-2 box-border overflow-hidden grow">
                                <span class="text-gray-800 max-h-[38px] text-sm font-semibold leading-5 overflow-hidden whitespace-normal break-words		">iPhone 14 Pro Max
                                </span>
                                <div>
                                    <div class="block w-full text-sm font-bold text-amber-700">
                                        $ 1900
                                    </div>
                                </div>
                                <div class="flex align-items-center text-xs leading-6 mx-0 my-1 text-gray-600">
                                    iBox
                                </div>
                                <div class="min-h-[14px] text-xs">
                                    <div class="align-items-center my-1 mx-0">
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star-half" style="color: #7a7600;"></i>
                                        <span class="align-midle ml-1 text-gray-600">(1400)
                                        </span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </a>
                </div>
                <div class="grow max-w-[20%] inline-flex px-2 pb-4 min-w-[20%]">
                    <a href="#" class="relative bg-white inline-flex items-stretch w-full h-full p-0 box-border">
                        <div class="absolute top-[4px] right-[4px] w-[28px] h-[28px] text-center z-10 rounded-full">
                            <div>
                                <span class="absolute top-[4px] right-[4px] w-[24px] h-[24px] text-center z-10 rounded-full bg-gray-200">
                                    <div class="absolute top-0 left-0 right-0 bottom-0 m-auto">
                                        <i class="fa-solid fa-heart" style="color: #949494;"></i>
                                    </div>
                                </span>
                            </div>
                        </div>
                        <div class="relative shadow-md rounded-lg min-w-full flex flex-col">
                            <div class="relative">
                                <div class="relative h-0 rounded-t-lg pb-[100%] w-full bg-white text-ellipsis	overflow-hidden">
                                    <div class="bg-no-repeat bg-cover inline-block my-0 mx-auto text-center w-full h-full absolute">
                                        <img src="https://bizweb.dktcdn.net/100/443/045/products/xe-dap-dien-jvc-eco-g9s-xi-mang-9c68291e-c586-4a10-8f84-443b142a742a.png?v=1691926303330" alt="" />
                                    </div>
                                </div>
                            </div>
                            <div class="relative p-2 box-border overflow-hidden grow">
                                <span class="text-gray-800 max-h-[38px] text-sm font-semibold leading-5 overflow-hidden whitespace-normal break-words		">iPhone 14 Pro Max
                                </span>
                                <div>
                                    <div class="block w-full text-sm font-bold text-amber-700">
                                        $ 1900
                                    </div>
                                </div>
                                <div class="flex align-items-center text-xs leading-6 mx-0 my-1 text-gray-600">
                                    iBox
                                </div>
                                <div class="min-h-[14px] text-xs">
                                    <div class="align-items-center my-1 mx-0">
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star" style="color: #7a7600;"></i>
                                        <i class="fa-solid fa-star-half" style="color: #7a7600;"></i>
                                        <span class="align-midle ml-1 text-gray-600">(1400)
                                        </span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!--End product section-->
    <div class="grid wide">
        <div class="row">
            <div class="col l-12 m-12 c-12">
                <h1 class="title-l">Sản phẩm mới nhất</h1>
                <asp:ListView ID="productList" runat="server"
                    DataKeyNames="id" GroupItemCount="4" OnItemCommand="productList_ItemCommand">
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
                                <div style="display: flex">
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
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        
</asp:ScriptManager>
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script>
        var swiper = new Swiper(".mySwiper", {});
    </script>
    <script>
        function addToCart() {
            console.log("add to cart");
        }

        function viewDetail() {
            console.log("viewDetail");
        }
    </script>

</asp:Content>
