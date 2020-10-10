﻿<%@ Page Title="Sửa sản phẩm" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="edit-product.aspx.cs" Inherits="DHMshop.admin.edit_product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="grid wide">
            <div class="content-wrap">
                <div class="row">
                    <div class="col l-12">
                        <div class="content-title">
                            <h1>Sửa sản phẩm</h1>
                        </div>                       
                    </div>
                </div>                
                <div class="content-wrap">
                    <div class="row">
                        <div class="col l-12 c-12 m12">
                            <%--<form action="/" method="post" enctype="multipart/form-data">--%>
                                <div class="form-group">
                                    <label>Tên sản phẩm</label>
                                    <asp:TextBox ID="txtProductName" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator1" runat="server"  
                                        ControlToValidate="txtProductName" 
                                        ForeColor="Red" CssClass="alert"
                                        ErrorMessage="*">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Loại sản phẩm</label>
                                    <asp:DropDownList ID="ddlProductCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Mô tả (ngắn)</label>
                                    <asp:TextBox ID="txtProductDescription" Rows="4" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator2" runat="server"  
                                        ControlToValidate="txtProductDescription" 
                                        ForeColor="Red" CssClass="alert"
                                        ErrorMessage="*">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label>Giá</label>
                                    <asp:TextBox ID="txtProductPrice" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator4" runat="server"  
                                        ControlToValidate="txtProductPrice" 
                                        ForeColor="Red" CssClass="alert"
                                        ErrorMessage="*">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label>Giảm giá</label>
                                    <asp:TextBox ID="txtProductDiscountPrice" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator5" runat="server"  
                                        ControlToValidate="txtProductDiscountPrice" 
                                        ForeColor="Red" CssClass="alert"
                                        ErrorMessage="*">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label>Size</label>
                                    <asp:TextBox ID="txtProductSize" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator6" runat="server"  
                                        ControlToValidate="txtProductSize" 
                                        ForeColor="Red" CssClass="alert"
                                        ErrorMessage="*">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Màu sắc</label>
                                    <asp:TextBox ID="txtProductColor" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator7" runat="server"  
                                        ControlToValidate="txtProductColor" 
                                        ForeColor="Red" CssClass="alert"
                                        ErrorMessage="*">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Số lượng</label>
                                    <asp:TextBox ID="txtProductQuantity" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator8" runat="server"  
                                        ControlToValidate="txtProductQuantity" 
                                        ForeColor="Red" CssClass="alert"
                                        ErrorMessage="*">
                                    </asp:RequiredFieldValidator>
                                </div>
                                
                                 <div class="form-group">
                                    <label>Ảnh sản phẩm</label>
                                    <asp:FileUpload ID="fileUploadImg" runat="server" CssClass="form-control form-control-img" />
                                    <asp:Image ID="imgUpLoad" runat="server" Width="250px" CssClass="form-control picture" />
                                    <asp:Button ID="btnUpLoad" runat="server" Text="Upload" CssClass="btn" OnClick="btnUpLoad_Click"/>
                                </div>
                                
                                <div class="form-group">
                                    <label>Mô tả chi tiết</label>
                                    <asp:TextBox ID="txtProductDetail" Rows="8" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator3" runat="server"  
                                        ControlToValidate="txtProductDetail" 
                                        ForeColor="Red" CssClass="alert"
                                        ErrorMessage="*">
                                    </asp:RequiredFieldValidator>
                                </div>
                  
                                <div class="form-group">
                                    <label>Trạng thái sản phẩm</label>
                                    <asp:TextBox ID="txtProductStatus" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator9" runat="server"  
                                        ControlToValidate="txtProductStatus" 
                                        ForeColor="Red" CssClass="alert"
                                        ErrorMessage="*">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group form-btn">
                                    <asp:Button ID="btnEditProduct" runat="server" Text="Sửa" CssClass="btn btn-add-post" OnClick="btnEditProduct_Click"/>
                                    <button class="btn " type="reset" style="">Reset</button>
                                </div>
                            <%--</form>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>