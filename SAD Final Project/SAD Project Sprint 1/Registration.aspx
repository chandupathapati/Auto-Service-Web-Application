<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SAD_Project_Sprint_1.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>

        <title></title>

        <style>
            .style1 {
            }

            td {
                align-content: right;
            }

            .row {
                padding-left: 2cm;
            }
        </style>

        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    </head>
         <body>
    <div class=".container">
       
            <div class="row">
                <div class="col-sm-4 col-offset-sm-4">
                    <asp:Literal ID="LiteralMessage" runat="server"></asp:Literal>
                    <table class="style1">
                        <tr>
                            <td>User ID</td>
                            <td>
                                <asp:TextBox ID="TextBoxID" runat="server" /></td>
                            <td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="TextBoxID"
                                        ErrorMessage="Registration ID is a required Field"></asp:RequiredFieldValidator></td>
                            </td>
                        </tr>
                        <tr>
                            <td>First Name</td>
                            <td>
                                <asp:TextBox ID="TextBoxFirstName" runat="server" /></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="TextBoxFirstName"
                                    ErrorMessage="FirstName is a required Field"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>Last name</td>
                            <td>
                                <asp:TextBox ID="TextBoxLastName" runat="server" /></td>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="TextBoxLastName"
                                    ErrorMessage="LastName is a required Field"></asp:RequiredFieldValidator>
                        </tr>

                        <tr>
                            <td>Password</td>
                            <td>
                                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" /></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="TextBoxPassword"
                                    ErrorMessage="Password is a required Field"></asp:RequiredFieldValidator></td>
                            <td>
                                <asp:RegularExpressionValidator ControlToValidate="TextBoxPassword"
                                    ID="RegularExpressionValidator1" ValidationExpression="^[\s\S]{8,}$" runat="server"
                                    ErrorMessage="Minimum 8 characters required."></asp:RegularExpressionValidator></td>
                        </tr>

                    </table>
                    <asp:Button ID="BtnSIgnUp" runat="server" Text="SignUp" OnClick="BtnSIgnUp_Click" />
                    <asp:Button ID="BtnClear" runat="server" Text="Clear" OnClick="BtnClear_Click" />
                    <br />
                    <h2>
                        <asp:Label ID="Label1" runat="server"></asp:Label></h2>
                </div>
            </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</asp:Content>
