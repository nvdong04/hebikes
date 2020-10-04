<%@ Page Title="" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="DHMshop.admin.customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="grid wide">
            <div class="content-wrap">
                <div class="row">
                    <div class="col l-12">
                        <div class="content-title">
                            <h1>Danh sách người dùng</h1>
                        </div>                       
                    </div>
                </div>
                <div class="content-table">
                    <div class="row">
                        <div class="col l-12">
                            <asp:GridView 
                                ID="gvCustomer" runat="server" DataKeyNames="id"
                                AllowPaging="True" AllowSorting="True"   
                                AutoGenerateColumns="false" CssClass="table">
                                <Columns>
                                    <asp:BoundField DataField="email" HeaderText="Email" />
                                    <asp:BoundField DataField="full_name" HeaderText="Họ và tên" />
                                    <asp:BoundField DataField="sex" HeaderText="Giới tính" />
                                    <asp:BoundField DataField="address" HeaderText="Địa chỉ" />
                                    <asp:BoundField DataField="phone_number" HeaderText="Số điện thoại" />
                                    <asp:BoundField DataField="status" HeaderText="Trạng thái" />
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtID" Text='<%# Eval("id") %>' runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:LinkButton ID="LinkButton1" 
                                               PostBackUrl='<%# String.Format("~/admin/customer.aspx?customer={0}", Eval("id")) %>' 
                                               runat="server">Edit</asp:LinkButton>
                                       </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton 
                                                ID="LinkButton2"  PostBackUrl="~/admin/customer.aspx"
                                                runat="server">Delete</asp:LinkButton>
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
