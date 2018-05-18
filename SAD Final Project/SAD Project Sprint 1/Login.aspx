<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SAD_Project_Sprint_1.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link href="Style%20Sheet/Login.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
        <div class="login">
            <br />
            <div class="login_form">
                <br />
                <h1>Customer Login</h1>
                 <asp:TextBox ID="TextBox1" runat="server" placeholder="User Name" CssClass="Username"></asp:TextBox>
                <br /><br />
                 <asp:TextBox ID="TextBox2" runat="server" placeholder="Password"  TextMode="Password"   CssClass="Password"></asp:TextBox>
                <br /><br />
                
                
                <asp:Button ID="Button1" runat="server" Text="Login" CssClass="Submit" OnClick="Button1_Click1"></asp:Button>

           
            <br />
            <div class="forgotpassword">
                 <a href="Forgotpassword.aspx" >Forgotpassword!</a>
            </div>
            <br /><br />
                <br /><br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
         
        </div>
    </center>

</asp:Content>
