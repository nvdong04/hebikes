<%@ Page Title="Danh sách sản phẩm" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="DHMshop.admin.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="grid wide">
            <div class="content-wrap">
                <div class="row">
                    <div class="col l-12">
                        <div class="content-title">
                            <h1>Danh sách sản phẩm</h1>
                        </div>                       
                    </div>
                </div>
                <div class="content-table">
                    <div class="row">
                        <div class="col l-12">
                            <asp:GridView 
                                ID="gvProduct" runat="server" DataKeyNames="id"
                                AllowPaging="False" AllowSorting="True"   
                                AutoGenerateColumns="False" CssClass="table" OnRowDeleting="gvProduct_RowDeleting" PageSize="5" AllowCustomPaging="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="STT">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="name" HeaderText="Sản phẩm" />
                                    <asp:BoundField DataField="price" HeaderText="Giá" />
                                    <asp:BoundField DataField="discount_price" HeaderText="Giảm giá" />
                                    <asp:BoundField DataField="quantity" HeaderText="Số lượng" />
                                    <asp:BoundField DataField="name_category" HeaderText="Loại sản phẩm" />
                                    <asp:BoundField DataField="status" HeaderText="Trạng thái" />
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtid" Text='<%# Eval("id") %>' runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:LinkButton ID="LinkButton1" 
                                               PostBackUrl='<%# String.Format("~/admin/edit-product.aspx?id={0}", Eval("id")) %>' 
                                               runat="server">Edit</asp:LinkButton>
                                       </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa k?');" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        
                    </div>
                </div>
              
            </div>
        </div>
    </div>
</asp:Content>
