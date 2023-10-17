﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="DHMshop.admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="bg-white dark:bg-gray-900">
        <div class="py-8 px-4 mx-auto max-w-2xl lg:py-16">
            <h2 class="mb-4 text-xl font-bold text-gray-900 dark:text-white">Thêm mới sản phẩm</h2>
            <!-- start form tag -->
                <div class="grid gap-4 sm:grid-cols-2 sm:gap-6">
                    <div class="sm:col-span-2">
                        <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                            Tên sản phẩm
                            <span class="text-red-500">*</span>
                        </label>
                        <asp:TextBox 
                            ID="txtProductName" 
                            CssClass="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" 
                            runat="server" 
                            placeholder="Nhập tên sản phẩm">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtProductName"
                            ForeColor="Red" CssClass="text-sm"
                            Display="Dynamic"
                            ErrorMessage="Trường thông tin bắt buộc">
                        </asp:RequiredFieldValidator>
                        <%--<input type="text" name="name" id="name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Nhập tên sản phẩm" required="">--%>
                    </div>
                    <div class="w-full">
                        <label for="brand" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                            Thương hiệu
                            <span class="text-red-500">*</span>
                        </label>
                        <asp:TextBox 
                            ID="txtBrand" 
                            CssClass="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" 
                            placeholder="Nhập tên thương hiệu"
                            runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator11" runat="server"
                            ControlToValidate="txtBrand"
                            ForeColor="Red" CssClass="text-sm"
                            Display="Dynamic"
                            ErrorMessage="Trường thông tin bắt buộc">
                        </asp:RequiredFieldValidator>
                        <%--<input type="text" name="brand" id="brand" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Tên thương hiêu" required="">--%>
                    </div>
                    <div class="w-full">
                        <label for="code" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                            Mã sản phẩm
                            <span class="text-red-500">*</span>
                        </label>
                        <asp:TextBox 
                            ID="txtProductCode" 
                            CssClass="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" 
                            placeholder="Nhập mã sản phẩm"
                            runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator10" runat="server"
                            ControlToValidate="txtProductCode"
                            ForeColor="Red" CssClass="text-sm"
                            Display="Dynamic"
                            ErrorMessage="Trường thông tin bắt buộc">
                        </asp:RequiredFieldValidator>
                        <%--<input type="text" name="code" id="code" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Mã sản phẩm" required="">--%>
                    </div>
                    <div class="w-full">
                        <label for="price" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                            Giá
                            <span class="text-red-500">*</span>
                        </label>
                        <asp:TextBox 
                            ID="txtProductPrice" 
                            TextMode="Number"
                            CssClass="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" 
                            placeholder="Eg: 1,200,000đ"
                            runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="txtProductPrice"
                            ForeColor="Red" CssClass="text-sm"
                            Display="Dynamic"
                            ErrorMessage="Trường thông tin bắt buộc">
                        </asp:RequiredFieldValidator>
                        <%--<input type="number" name="price" id="price" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Eg: 1,200,000đ" required="">--%>
                    </div>
                    <div class="w-full">
                        <label for="discount_price" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Khuyến mãi(%)</label>
                        <asp:TextBox 
                            ID="txtDiscountPrice" 
                            TextMode="Number"
                            CssClass="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" 
                            placeholder="Eg: 10%"
                            runat="server">
                        </asp:TextBox>
                        <%--<input type="number" name="discount_price" id="discount_price" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Eg: 10%" required="">--%>
                    </div>
                    <div class="sm:col-span-2">
                        <label for="category" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                            Loại sản phẩm
                            <span class="text-red-500">*</span>
                        </label>
                        <select id="category" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                            <option selected="">Chọn phân loại</option>
                            <option value="TV">TV/Monitors</option>
                            <option value="PC">PC</option>
                            <option value="GA">Gaming/Console</option>
                            <option value="PH">Phones</option>
                        </select>
                    </div>
                    <div class="sm:col-span-2">
                        <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="file_input">
                            Ảnh sản phẩm
                            <span class="text-red-500">*</span>
                        </label>
                        <asp:FileUpload 
                            ID="fileProductImg" 
                            runat="server"
                            aria-describedby="file_input_help"
                            CssClass="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"/>
                        <%--<input class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" aria-describedby="file_input_help" id="file_input" type="file">--%>
                        <p class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="file_input_help">Chỉ chấp nhận ảnh định dạng png,jpg,jpeg.</p>
                    </div>
                    <div>
                        <label class="relative inline-flex items-center cursor-pointer">
                            <%--<asp:CheckBox 
                                ID="cbStatus" 
                                checked
                                CssClass="sr-only peer"
                                runat="server" />--%>
                            <input ID="cbStatus" runat="server" type="checkbox" value="" class="sr-only peer" checked>
                            <div class="w-11 h-6 bg-gray-200 rounded-full peer peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
                            <span class="ml-3 text-sm font-medium text-gray-900 dark:text-gray-300">Còn hàng</span>
                        </label>
                    </div>
                    <div class="sm:col-span-2">
                        <label for="description" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                            Mô tả sản phẩm
                            <span class="text-red-500">*</span>
                        </label>
                         <asp:TextBox 
                            ID="txtDescription" 
                            TextMode="MultiLine"
                            Rows="8"
                            CssClass="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-md focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" 
                            placeholder="Nhập mô tả của bạn tại đây"
                            runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator12" runat="server"
                            ControlToValidate="txtDescription"
                            ForeColor="Red" CssClass="text-sm"
                            Display="Dynamic"
                            ErrorMessage="Trường thông tin bắt buộc">
                        </asp:RequiredFieldValidator>
                        <%--<textarea id="description" rows="8" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-md border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Nhập mô tả của bạn tại đây"></textarea>--%>
                    </div>
                </div>
                <asp:Button 
                    ID="btnAddNewProduct" 
                    runat="server" 
                    Text="Thêm sản phẩm" 
                    CssClass="btn inline-flex items-center px-5 py-2.5 mt-4 sm:mt-6 text-sm font-medium text-center text-white rounded-md focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800" 
                    OnClick="btnAddProduct_Click"/>
                <%--<button type="submit" class="inline-flex items-center px-5 py-2.5 mt-4 sm:mt-6 text-sm font-medium text-center text-white btn rounded-md focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800">
                    Thêm sản phẩm
                </button>--%>
            <!-- end form tag -->
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
