<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DHMshop.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Dashboard page</h1>
    <button id="triggerElement" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Hide alert</button>

<div id="targetElement" class="p-4 mb-4 text-sm text-blue-800 rounded-lg bg-blue-50 dark:bg-blue-200 dark:text-blue-800" role="alert">
  <span class="font-medium">Info alert!</span> Change a few things up and try submitting again.
</div>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
</asp:Content>
