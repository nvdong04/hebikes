<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/admin/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DHMshop.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Dashboard page</h1>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script language="javascript" type="text/javascript">
    function Notify(msg, title, type, clear, pos, sticky) {
        //        toastr.options.positionClass = "toast-bottom-right";
        //        toastr.options.positionClass = "toast-bottom-left";
        //        toastr.options.positionClass = "toast-top-right";
        //        toastr.options.positionClass = "toast-top-left";
        //        toastr.options.positionClass = "toast-bottom-full-width";
        //        toastr.options.positionClass = "toast-top-full-width";
        //        options = {
        //            tapToDismiss: true,
        //            toastClass: 'toast',
        //            containerId: 'toast-container',
        //            debug: false,
        //            fadeIn: 300,
        //            fadeOut: 1000,
        //            extendedTimeOut: 1000,
        //            iconClass: 'toast-info',
        //            positionClass: 'toast-top-right',
        //            timeOut: 5000, // Set timeOut to 0 to make it sticky
        //            titleClass: 'toast-title',
        //            messageClass: 'toast-message' }


        if (clear == true) {
            toastr.clear();
        }
        if (sticky == true) {
            toastr.tapToDismiss = true;
            toastr.timeOut = 10000;
        }

        toastr.options.onclick = function() {
            //alert('You can perform some custom action after a toast goes away');
        }
        //"toast-top-left";
        toastr.options.positionClass = pos;
        if (type.toLowerCase() == 'info') {
            toastr.options.timeOut = 1000;
            toastr.tapToDismiss = true;
            toastr.info(msg, title);
        }
        if (type.toLowerCase() == 'success') {
            toastr.options.timeOut = 1500;
            toastr.success(msg, title);
        }
        if (type.toLowerCase() == 'warning') {
            toastr.options.timeOut = 3000;
            toastr.warning(msg, title);
        }
        if (type.toLowerCase() == 'error') {
            toastr.options.timeOut = 10000;
            toastr.error(msg, title);
        }
    }
    </script>
</asp:Content>
