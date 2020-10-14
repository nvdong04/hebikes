<%@ Page Title="Quản lý đơn hàng" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="DHMshop.admin.order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="grid wide">
            <div class="content-wrap">
                <div class="row">
                    <div class="col l-12">
                        <div class="content-title">
                            <h1>Danh sách đơn hàng</h1>
                        </div>                       
                    </div>
                </div>
                <div class="content-table">
                    <div class="row">
                        <div class="col l-12">
                            <asp:GridView 
                                ID="gvOrder" runat="server" DataKeyNames="id"
                                AllowPaging="True" AllowSorting="True"   
                                AutoGenerateColumns="False" CssClass="table">
                                <Columns>                       
                                    <asp:BoundField DataField="id" HeaderText="Mã đơn hàng" />
                                    <asp:BoundField DataField="order_date" HeaderText="Ngày tạo" />
                                    <asp:BoundField DataField="order_status" HeaderText="Tình trạng đơn hàng" />
                                    <asp:BoundField DataField="order_total_price" HeaderText="Tổng tiền" />
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtid" Text='<%# Eval("id") %>' runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:LinkButton ID="LinkButton1" 
                                               PostBackUrl='<%# String.Format("~/admin/edit-order.aspx?id={0}", Eval("id")) %>' 
                                               runat="server">Edit</asp:LinkButton>
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
