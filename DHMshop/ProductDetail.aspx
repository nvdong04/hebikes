﻿<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="DHMshop.detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="py-6">
            <!-- Breadcrumbs -->
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex items-center space-x-2 text-gray-400 text-sm">
                    <a href="Home.aspx" class="hover:underline hover:text-gray-600">Trang chủ</a>
                    <span>
                        <svg class="h-5 w-5 leading-none text-gray-300" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                        </svg>
                    </span>
                    <a href="Product.aspx" class="hover:underline hover:text-gray-600">Sản phẩm</a>
                    <span>
                        <svg class="h-5 w-5 leading-none text-gray-300" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                        </svg>
                    </span>
                    <span>Xe điện</span>
                </div>
            </div>
            <!-- ./ Breadcrumbs -->

            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-6">
                <div class="flex flex-col md:flex-row -mx-4">
                    <div class="md:flex-1 px-4">
                        <div>
                            <div class="h-64 md:h-80 rounded-lg mb-4">
                                <img src="//bizweb.dktcdn.net/thumb/large/100/443/045/products/vespa-50cc-nioshima-nio-plus-ghi-san-08793298-c311-468f-ac5f-ccf87076bc2b.png?v=1690569784303" alt="Xe ga 50cc Nioshima Nio Plus đèn Led" data-image="//bizweb.dktcdn.net/thumb/medium/100/443/045/products/vespa-50cc-nioshima-nio-plus-ghi-san-08793298-c311-468f-ac5f-ccf87076bc2b.png?v=1690569784303" class="mx-auto d-block w-80">
                            </div>
                        </div>
                    </div>
                    <div class="md:flex-1 px-4">
                        <h2 class="mb-2 leading-tight tracking-tight font-bold text-gray-800 text-2xl md:text-3xl">Xe ga 50cc Nioshima Nio Plus đèn Led</h2>
                        <p class="text-gray-500 text-sm">Thương hiệu: <a href="#" class="text-indigo-600 hover:underline">NIOSHIMA</a></p>

                        <div class="flex items-center space-x-4 my-4">
                            <div>
                                <div class="rounded-lg bg-gray-100 flex py-2 px-3">
                                    <span class="font-bold text-indigo-600 text-3xl">22.900.000</span>
                                    <span class="text-indigo-400 mr-1 mt-1">đ</span>
                                </div>
                            </div>
                            <div class="flex-1">
                                <p class="text-green-500 text-xl font-semibold">Giảm giá 12%</p>
                                <p class="text-gray-400 text-sm">Tiết kiệm: 2.000.000₫ so với giá thị trường</p>
                            </div>
                        </div>

                        <p class="text-gray-500">Lorem ipsum, dolor sit, amet consectetur adipisicing elit. Vitae exercitationem porro saepe ea harum corrupti vero id laudantium enim, libero blanditiis expedita cupiditate a est.</p>

                        <div class="flex py-4 space-x-4">
                            <div class="">
                                <div class="flex">
                                    <span class="inline-block leading-9 h-10 border w-10 bg-gray-100 text-center font-bold cursor-pointer border-r-0">–</span>
                                    <input class="input-number w-11 h-10 px-3 py-0 text-center border" type="text" value="1" min="1" max="10">
                                    <span class="inline-block leading-9 h-10 border w-10 bg-gray-100 text-center font-bold cursor-pointer border-l-0">+</span>
                                </div>
                            </div>

                            <button type="button" class="btn">
                                Thêm vào giỏ hàng
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <script>
        (function () {
            window.inputNumber = function (el) {
                el.forEach(function (input) {
                    var min = input.getAttribute('min') || false;
                    var max = input.getAttribute('max') || false;
                    var dec = input.previousElementSibling;
                    var inc = input.nextElementSibling;

                    console.log(dec)

                    init(input, dec, inc);

                    function init(input, dec, inc) {
                        dec.addEventListener('click', decrement);
                        inc.addEventListener('click', increment);

                        function decrement() {
                            var value = parseInt(input.value);
                            value--;
                            if ((!min || value >= min)) {
                                input.value = value;
                            }
                        }

                        function increment() {
                            var value = parseInt(input.value);
                            value++;
                            if ((!max || value <= max)) {
                                input.value = value;
                            }
                        }
                    }
                });
            };
        })();

        // Sử dụng hàm inputNumber trên các phần tử với lớp 'input-number'
        var inputElements = document.querySelectorAll('.input-number');
        inputNumber(inputElements);
    </script>
</asp:Content>