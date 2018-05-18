<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="SAD_Project_Sprint_1.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style%20Sheet/test.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="jumbotron">
        <div class="container">
            <div class="row">
                <div class ="col-lg-12">
                    <p>Service</p>
                    <form>
                        <input type="checkbox" id="option1" name="opt1" value="Oil Change" />

                        <label for="option1">Oil change</label>

                    </form>
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
