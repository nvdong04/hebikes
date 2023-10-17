<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DHMshop.admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link href="../assets/css/normalize.css" rel="stylesheet" />
    <link href="../assets/css/base.css" rel="stylesheet" />
    <%--<link href="assets/css/untility.css" rel="stylesheet" />--%>
    <link href="../assets/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
    <%--<script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio"></script>
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.7.3/dist/alpine.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.css" rel="stylesheet" />--%>

    <script src="../assets/tailwindcss/tailwindcss.js"></script>
    <link href="../assets/flowbite/flowbite.min.css" rel="stylesheet" />

    <link href="../assets/toastr/toastr.min.css" rel="stylesheet" />
    <script>
        tailwind.config = {
            theme: {
                extend: {

                },
                screens: {
                    'sm': '640px',
                    // => @media (min-width: 640px) { ... }

                    'md': '768px',
                    // => @media (min-width: 768px) { ... }

                    'lg': '1024px',
                    // => @media (min-width: 1024px) { ... }

                    'xl': '1200px',
                    // => @media (min-width: 1280px) { ... }

                    '2xl': '1536px',
                    // => @media (min-width: 1536px) { ... }
                },
            },
            plugins: [
            ],
        }
    </script>
    <style type="text/tailwindcss">
        /* Typography */
        .h1 {
            @apply text-4xl font-extrabold tracking-tighter;
        }

        .h2 {
            @apply text-3xl font-extrabold tracking-tighter;
        }

        .h3 {
            @apply text-3xl font-extrabold;
        }

        .h4 {
            @apply text-2xl font-extrabold tracking-tight;
        }

        @screen md {
            .h1 {
                @apply text-5xl;
            }

            .h2 {
                @apply text-4xl;
            }
        }

        /* Buttons */
        .btn,
        .btn-lg,
        .btn-sm,
        .btn-xs {
            @apply font-medium text-sm inline-flex items-center justify-center border border-transparent rounded leading-5 shadow-sm transition duration-150 ease-in-out;
        }

        .btn {
            @apply px-3 py-2;
            @apply bg-orange-600;
            @apply text-white;
            cursor: pointer;
        }

        .btn-lg {
            @apply px-4 py-3;
        }

        .btn-sm {
            @apply px-2 py-1;
        }

        .btn-xs {
            @apply px-2 py-0.5;
        }

        /* Forms */
        input[type="search"]::-webkit-search-decoration,
        input[type="search"]::-webkit-search-cancel-button,
        input[type="search"]::-webkit-search-results-button,
        input[type="search"]::-webkit-search-results-decoration {
            -webkit-appearance: none;
        }

        .form-input,
        .form-textarea,
        .form-multiselect,
        .form-select,
        .form-checkbox,
        .form-radio {
            @apply bg-white dark:bg-slate-900/30 border focus:ring-0 focus:ring-offset-0 dark:disabled:bg-slate-700/30 dark:disabled:border-slate-700 dark:disabled:hover:border-slate-700;
        }

        .form-input,
        .form-textarea,
        .form-multiselect,
        .form-select,
        .form-checkbox {
            @apply rounded;
        }

        .form-input,
        .form-textarea,
        .form-multiselect,
        .form-select {
            @apply text-sm text-slate-800 dark:text-slate-100 leading-5 py-2 px-3 border-slate-200 hover:border-slate-300 focus:border-slate-300 dark:border-slate-700 dark:hover:border-slate-600 dark:focus:border-slate-600 shadow-sm;
        }

        .form-input,
        .form-textarea {
            @apply placeholder-slate-400 dark:placeholder-slate-500;
        }

        .form-select {
            @apply pr-10;
        }

        .form-checkbox,
        .form-radio {
            @apply text-indigo-500 checked:bg-indigo-500 dark:checked:border-transparent border border-slate-300 focus:border-indigo-300 dark:border-slate-700 dark:focus:border-indigo-500/50;
        }

        /* Switch element */
        .form-switch {
            @apply relative select-none;
            width: 44px;
        }

            .form-switch label {
                @apply block overflow-hidden cursor-pointer h-6 rounded-full;
            }

                .form-switch label > span:first-child {
                    @apply absolute block rounded-full;
                    width: 20px;
                    height: 20px;
                    top: 2px;
                    left: 2px;
                    right: 50%;
                    transition: all .15s ease-out;
                }

            .form-switch input[type="checkbox"]:checked + label {
                @apply bg-indigo-500;
            }

                .form-switch input[type="checkbox"]:checked + label > span:first-child {
                    left: 22px;
                }

            .form-switch input[type="checkbox"]:disabled + label {
                @apply cursor-not-allowed bg-slate-100 dark:bg-slate-700/20 border border-slate-200 dark:border-slate-700;
            }

                .form-switch input[type="checkbox"]:disabled + label > span:first-child {
                    @apply bg-slate-400 dark:bg-slate-600;
                }

        /* Chrome, Safari and Opera */
        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }

        .no-scrollbar {
            -ms-overflow-style: none; /* IE and Edge */
            scrollbar-width: none; /* Firefox */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="w-full mt-20 max-w-sm mx-auto px-4 py-12">
        <h1 class="text-3xl text-slate-800 font-bold mb-6">Admin login! ✨
        </h1>
        <div class="form">
            <div class="space-y-4">
                <div>
                    <label
                        class="block text-sm font-medium mb-1 text-slate-600"
                        htmlfor="email">
                        Email
                     <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtEmail" TextMode="Email" CssClass="form-input w-full" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtEmail"
                        ForeColor="red"
                        Display="Dynamic"
                        CssClass="text-xs"
                        ErrorMessage="Trường thông tin bắt buộc">
                </asp:RequiredFieldValidator>
                </div>
                <div>
                    <label
                        class="block text-sm font-medium mb-1 text-slate-600"
                        htmlfor="password">
                        Mật khẩu
                     <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-input w-full" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtPass"
                        ForeColor="red"
                        Display="Dynamic"
                        CssClass="text-xs"
                        ErrorMessage="Trường thông tin bắt buộc">
                </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="inputfield">
                <asp:Label ID="lbError" CssClass="text-sm" ForeColor="Red" Visible="false" runat="server" Text=""></asp:Label>
            </div>
            <div class="flex items-center justify-between mt-6">
                <div class="mr-1">
                    <a
                        class="text-sm underline x_ text-slate-600"
                        href="reset-password.html">Quên mật khẩu?
                    </a>
                </div>
                <asp:Button ID="btnLogin" CssClass="btn whitespace-nowrap ml-3" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
