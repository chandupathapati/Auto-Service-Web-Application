<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Customer_Interface.aspx.cs" Inherits="SAD_Project_Sprint_1.Customer_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style%20Sheet/Customer_Interface.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="fullpg">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Place an Order" OnClick="Make_an_Order"/>
        &nbsp;
        <asp:Button ID="Button3" runat="server" Text="View Order Status" OnClick="Order_Status" />
        &nbsp;
        <asp:Button ID="Button4" runat="server" Text="Make Payment" OnClick="Payment" />
        <br />
        <asp:Panel ID="OrderPanel" runat="server">
            <br />
            <br />
            &nbsp;
            <asp:Label ID="Label2" runat="server" Text="Car No"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Service"></asp:Label>
            <br />
            <br />
            <fieldset style="width: auto">

                <asp:CheckBox ID="CheckBox1" Text="  Oil Change" runat="server" />
                &nbsp;&nbsp;&nbsp;
              <asp:CheckBox ID="CheckBox2" Text="  Brake change" runat="server" />
                &nbsp;&nbsp;
             <asp:CheckBox ID="CheckBox3" Text=" Tyre  change" runat="server" />
            </fieldset>
            <br />
            <br />
            
            <asp:Button ID="Button1" runat="server" OnClick="Placing_Order" Text="Submit" />
            <br />
            <br />

            <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
            <br />

        </asp:Panel>
        <br />
        <asp:Panel ID="Status_Panel" runat="server">


            <asp:GridView ID="Or_Status" runat="server">
            </asp:GridView>

        </asp:Panel>
        <br />
        <asp:Panel ID="Payment_Panel" runat="server">
            <asp:Panel ID="Diplay_Completed" runat="server">
                <asp:GridView ID="Payments_to_pay" runat="server" OnRowDeleting ="Payments_to_pay_RowCommand">
                    <Columns>
                        <asp:ButtonField ButtonType="Button"  CommandName="Delete" Text="Pay" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
            </asp:Panel>
        </asp:Panel>

        <asp:Panel ID="Payment_Summary" runat="server">

            <asp:Label ID="Label4" runat="server" Text="Car Number   :"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
            <br />
            Total Amount :&nbsp;&nbsp;
            <asp:Label ID="Label7" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" Text="Pay" OnClick="Button5_Click" />
            <br />
            <br />
            <asp:Label ID="Label8" runat="server"></asp:Label>
            <br />
        </asp:Panel>

    </div>
</asp:Content>
