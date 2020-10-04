<%@ Page Title="Thêm sản phẩm" Language="C#" MasterPageFile="~/Admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="DHMshop.Admin.addproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="grid wide">
            <div class="content-wrap">
                <div class="row">
                    <div class="col l-12">
                        <div class="content-title">
                            <h1>Thêm sản phẩm</h1>
                        </div>                       
                    </div>
                </div>
                
                <div class="content-wrap">
                    <div class="row">
                        <div class="col l-12 c-12 m12">
                            <%--<form action="/" method="post" enctype="multipart/form-data">--%>
                                <div class="form-group">
                                    <label>Chọn danh mục</label>
                                    <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="" Text="Vui lòng chọn loại hàng"></asp:ListItem>
                                    </asp:DropDownList>                                   
                                </div>
                                <div class="form-group">
                                    <label>Tên sản phẩm</label>
                                    <asp:TextBox ID="txtProductName" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Trích dẫn</label>
                                    <textarea class="form-control" rows="4" name="txtTrichDan" placeholder="Nhập trích dẫn" required></textarea>
                                </div>

                                <div class="form-group">
                                    <label>Ảnh trích dẫn</label>
                                    <%--<input type="file" required name="anhTrichDan" class="form-control" />
                                    <img src="#" alt="" class="form-control picture" />
                                    <button class="btn" name="btnUpload" type="submit" style="">Upload</button>--%>
                                    <asp:FileUpload ID="fileUploadImg" runat="server" CssClass="form-control form-control-img" />
                                    <asp:Image ID="imgUpLoad" runat="server" CssClass="form-control picture" />
                                    <asp:Button ID="btnUpLoad" runat="server" Text="Upload" CssClass="btn" />
                                </div>
                                <div class="form-group">
                                    <label>Nội dung</label>
                                    <textarea class="form-control ckeditor" rows="8" name="txtNoiDung" id="txtNoiDung" required></textarea>
                                </div>

                                <div class="form-group form-btn">
                                    <%--<button class="btn " name="btnThem" type="submit" style="">Thêm</button>--%>
                                    <asp:Button ID="btnThemBaiViet" runat="server" Text="Thêm bài viết" CssClass="btn btn-add-post"/>
                                    <button class="btn " type="reset" style="">Đặt lại</button>
                                </div>
                            <%--</form>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
