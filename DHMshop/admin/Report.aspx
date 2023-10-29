<%@ Page Title="" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="DHMshop.admin.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%if (Session["role"].ToString() == DHMshop.enums.Role.admin.ToString())
        {%>
        <div class="flex justify-between my-6">
            <div>
                <h1 class="text-xl uppercase">Báo cáo</h1>
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
