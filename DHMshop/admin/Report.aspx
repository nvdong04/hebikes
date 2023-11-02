<%@ Page Title="" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="DHMshop.admin.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%if (Session["role"].ToString() == DHMshop.enums.Role.admin.ToString())
        {%>
        <div class="grid grid-cols-2 gap-6 mt-4">           
            <div>
                <h1 class="uppercase mb-2">Sản phẩm theo loại, trạng thái (TOP 5)</h1>
                <asp:GridView 
                    ID="gvReport" 
                    AllowPaging="true"
                    AllowSorting="true"
                    AutoGenerateColumns="false"
                    CssClass="w-full text-sm text-left text-gray-500 dark:text-gray-400"
                    PageSize="10"
                    runat="server">
                    <HeaderStyle CssClass="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400" />
                    <RowStyle CssClass="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600" />
                    <Columns> 
                        <asp:TemplateField HeaderText="STT" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>           
                        <asp:BoundField DataField="category_name" HeaderText="Phân loại" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />        
                        <asp:TemplateField HeaderText="Trạng thái" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4">
                            <ItemTemplate>
                                <%# Eval("status").ToString() == "0" ? "Đã hết hàng" : "Còn hàng" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="product_count" HeaderText="Số lượng" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
                    </Columns>
                </asp:GridView>
            </div>
            <div>
                <h1 class="mb-2 uppercase">Số lượng sản phẩm đã bán (TOP 5)</h1>
                <asp:GridView 
                    ID="GridView1" 
                    AllowPaging="true"
                    AllowSorting="true"
                    AutoGenerateColumns="false"
                    CssClass="w-full text-sm text-left text-gray-500 dark:text-gray-400"
                    PageSize="10"
                    runat="server">
                    <HeaderStyle CssClass="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400" />
                    <RowStyle CssClass="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600" />
                    <Columns> 
                        <asp:TemplateField HeaderText="STT" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>           
                        <asp:BoundField DataField="product_name" HeaderText="Sản phẩm" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />        
                        <asp:BoundField DataField="total_quantity_sold" HeaderText="Số lượng(đã bán)" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="grid grid-cols-2 gap-6 mt-4">
                <div>
    <h1 class="mb-2 uppercase">Số lượng đơn hàng trong năm theo tháng</h1>
    <asp:GridView 
        ID="GridView2" 
        AllowPaging="true"
        AllowSorting="true"
        AutoGenerateColumns="false"
        CssClass="w-full text-sm text-left text-gray-500 dark:text-gray-400"
        PageSize="10"
        runat="server">
        <HeaderStyle CssClass="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400" />
        <RowStyle CssClass="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600" />
        <Columns> 
            <asp:TemplateField HeaderText="STT" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>           
            <asp:BoundField DataField="order_year" HeaderText="Năm" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />  
            <asp:BoundField DataField="order_month" HeaderText="Tháng" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" /> 
            <asp:BoundField DataField="order_count" HeaderText="Số lượng đơn hàng" HeaderStyle-CssClass="px-6 py-3" ItemStyle-CssClass="px-6 py-4" />
        </Columns>
    </asp:GridView>
</div>
            </div>
        <%}
        else
        {%>
    <div class="flex justify-center content-center items-center mt-20">
        <h1 class="text-red-600 font-medium text-lg">Bạn không có quyền truy cập module này</h1>
    </div>
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
