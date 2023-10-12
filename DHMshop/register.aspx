<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutMaster.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="DHMshop.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
            <div class="title">
              Đăng ký
            </div>
            <div class="form">
                <div class="inputfield">
                    <asp:Label ID="lbError" CssClass="alert" Visible="true" ForeColor="Red" runat="server" Text=""></asp:Label>
                </div>
               <div class="inputfield">
                  <label>Họ</label>
                   <asp:TextBox ID="txtFirstName" CssClass="input" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator 
                       ID="RequiredFieldValidator1" runat="server"  
                       ControlToValidate="txtFirstName" 
                       ForeColor="red" CssClass="alert"
                       ErrorMessage="*">
                   </asp:RequiredFieldValidator>
               </div>  
                <div class="inputfield">
                  <label>Tên</label>
                  <asp:TextBox ID="txtLastName" CssClass="input" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                       ID="RequiredFieldValidator2" runat="server"  
                       ControlToValidate="txtLastName" 
                       ForeColor="red" CssClass="alert"
                       ErrorMessage="*">
                   </asp:RequiredFieldValidator>
               </div>  
                <div class="inputfield">
                  <label>Email</label>
                  <asp:TextBox ID="txtEmail" CssClass="input" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                       ID="RequiredFieldValidator5" runat="server"  
                       ControlToValidate="txtEmail" 
                       ForeColor="red" CssClass="alert"
                       ErrorMessage="*">
                   </asp:RequiredFieldValidator>
               </div> 
                <div>
                     <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator1"  
                        ControlToValidate="txtEmail"  ForeColor="Red"
                        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
                        runat="server" ErrorMessage="Email không đúng định dạng">
                    </asp:RegularExpressionValidator>
                </div>
               <div class="inputfield">
                  <label>Mật khẩu</label>
                  <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="input" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                       ID="RequiredPassWord" runat="server"  
                       ControlToValidate="txtPassword" 
                       ForeColor="red" CssClass="alert"
                       ErrorMessage="*">
                   </asp:RequiredFieldValidator>
               </div>  
                <div>
                   <asp:RegularExpressionValidator 
                        ID="vldPassWord" runat="server" ForeColor="Red"
                        ControlToValidate="txtPassword" ValidationExpression="^[a-zA-Z0-9]+$"
                        ErrorMessage="Mật khẩu chỉ bao gồm chữ cái và số">
                    </asp:RegularExpressionValidator>
                </div>
              <div class="inputfield">
                  <label>Xác nhận mật khẩu</label>
                  <asp:TextBox ID="txtConfirmPassword" TextMode="Password" CssClass="input" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator 
                       ID="RequiredFieldValidator4" runat="server"  
                       ControlToValidate="txtConfirmPassword" 
                       ForeColor="red" CssClass="alert"
                       ErrorMessage="*">
                   </asp:RequiredFieldValidator>
              </div> 
                <div>
                   <asp:CompareValidator 
                      ID="CompareValidator1" runat="server"  
                      ControlToCompare="txtPassword" 
                      ControlToValidate="txtConfirmPassword" ForeColor="Red"
                      ErrorMessage="Mật khẩu không giống mật khẩu đã nhập trước đó">
                  </asp:CompareValidator>
                </div>
                <div class="inputfield">
                  <label>Giới tính</label>
                  <div class="custom_select">
                      <asp:DropDownList ID="ddlSex" CssClass="ddlSex" runat="server">
                          <asp:ListItem Value="Nam" Selected>Nam</asp:ListItem>
                          <asp:ListItem Value="Nữ">Nữ</asp:ListItem>
                      </asp:DropDownList>
                  </div>
               </div> 
              <div class="inputfield">
                  <label>Số điện thoại</label>
                  <asp:TextBox ID="txtPhone" CssClass="input" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator 
                       ID="RequiredFieldValidator6" runat="server"  
                       ControlToValidate="txtPhone" 
                       ForeColor="red" CssClass="alert"
                       ErrorMessage="*">
                   </asp:RequiredFieldValidator>
               </div>
                <div>
                    <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator3" ForeColor="Red"
                        ControlToValidate="txtPhone" ValidationExpression="(03|07|08|09|01[2|6|8|9])+([0-9]{8})\b"
                        runat="server" ErrorMessage="Số điện thoại không dúng định dạng">
                    </asp:RegularExpressionValidator>
                </div>
              <div class="inputfield">
                  <label>Địa chỉ</label>
                  <asp:TextBox ID="txtAddress" TextMode="MultiLine" CssClass="textarea" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator 
                       ID="RequiredFieldValidator7" runat="server"  
                       ControlToValidate="txtAddress" 
                       ForeColor="red" CssClass="alert"
                       ErrorMessage="*">
                   </asp:RequiredFieldValidator>
              </div> 
              <div class="inputfield terms">
                  <label class="check">
                    <input checked type="checkbox"/>
                    <span class="checkmark"></span>
                  </label>
                  <p>Đồng ý với các điều khoản và điều kiện</p>
               </div> 
              <div class="inputfield">
                  <asp:Button ID="btnRegister" CssClass="btn" runat="server" Text="Đăng ký" OnClick="btnRegister_Click" />
              </div>
            </div>
        </div>
</asp:Content>
