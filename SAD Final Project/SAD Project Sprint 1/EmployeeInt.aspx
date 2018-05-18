<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="EmployeeInt.aspx.cs" Inherits="SAD_Project_Sprint_1.EmployeeInt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
       
        <style>
            #row1 {
                padding-left: 2cm;
                padding-top:1cm;
                align-content:center;
            }
            body{
                background-color:whitesmoke;
            }
            
        </style>

        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    </head>
    <body>

        <div class="row" id="row1">
            <div class="col-sm-4">
                <div class="auto-style1">
                    <asp:Panel ID="panel3" runat="server">
                        <asp:GridView ID="GridView1" runat="server">
                            <asp:Columns>
                                <asp:ButtonField ButtonType="Button" CommandName="edit" Text="modify" />
                            </asp:Columns>
                        </asp:GridView>
                    </asp:Panel>
                </div>

                &nbsp

                <div class="ord">
                    <asp:Button CssClass="btn-primary" ID="Button1" AutoPostBack="true" runat="server"  Text="pending orders" OnClick="notifications" Width="139px" />
                </div>
                &nbsp
                <div class="ord">
                    <asp:Button CssClass="btn-primary" ID="Button2" AutoPostBack="true" runat="server" Text="completed orders" OnClick="Button2_Click" Width="142px" />
                </div>
                &nbsp

             <div class="ord">
            <asp:Button CssClass="btn-primary" ID="Button3" runat="server" Text="View Invoice" OnClick="Button3_Click" Width="136px" />
               </div>
                  <br />
                <br />
               

            </div>

            <div class="col-sm-8">
                <div>
                    <div class="emp">
                        <asp:Panel ID="panel1" runat="server">
                            <asp:GridView ID="OrderDetails" runat="server" OnRowEditing="OrderDetails_RowEditing">
                                <Columns>
                                    <%--<asp:BoundField DataField="order_hed_Id" ReadOnly="true" HeaderText="Ord_Hed_Id" SortExpression="ord_hed_id" />
                        <asp:BoundField DataField="cus_id" ReadOnly="true" HeaderText="Cust_Id" SortExpression="cus_id" />
                        <asp:BoundField DataField="car_no" ReadOnly="true" HeaderText="Car_Num" SortExpression="car_num" />
                        <asp:BoundField DataField="emp_id" ReadOnly="true" HeaderText="Emp_Id" SortExpression="emp_id" />
                        <asp:BoundField DataField="order_date" ReadOnly="true" HeaderText="Ord_Date" SortExpression="Ord_date" />
                        <asp:BoundField DataField="order_status" ReadOnly="true" HeaderText="Order_Stat" SortExpression="Order_Stat" />--%>
                                    <asp:ButtonField ButtonType="Button" CommandName="edit" Text="modify" />
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                    &nbsp
                        <div class="emp">
                    <asp:Panel ID="Panel4" runat="server">
                        <asp:GridView ID="GridView2" runat="server" OnRowCommand="GridView2_RowCommand">
                            <Columns>
                                <asp:ButtonField ButtonType="Button" CommandName="Add line items" Text="Generate Invoice" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </div>
                </div>

                 <div class="Show Invoice">
        </div>
		<div class="Invoice">
			<asp:GridView ID="InvoiceList" runat="server" OnRowCommand="InvoiceList_RowCommand" AutoGenerateColumns="false">
				<Columns>
					<asp:ButtonField ButtonType="Button" CommandName="InvoiceDetail" Text="View Details" />
					<asp:BoundField DataField="inv_hed_id" HeaderText="inv_hed_id" ReadOnly="true" />
					<asp:BoundField DataField="order_hed_id" HeaderText="order_hed_id" ReadOnly="true" />
					<asp:BoundField DataField="total_cost" HeaderText="total_cost" ReadOnly="true" />
				</Columns>
			</asp:GridView>
			
		<br />
		<br />
		</div>

        <asp:Panel ID="InvoiceDetailPanel" runat="server" Visible="false">  
        <div class="Detail">
			   <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" ShowFooter="true">
                        <Columns>
                            <asp:BoundField DataField="Invoice_number" HeaderText="Invoice number"/>
                            <asp:BoundField DataField="Service_id" HeaderText="Service Id"/>
                            <asp:BoundField DataField="Details" HeaderText="Details"/>
                            <asp:BoundField DataField="Amount" HeaderText="Amount"/>
                        </Columns>
                    </asp:GridView>
			
		<br />
		<br />
		</div>
        </asp:Panel> 


                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <table>
                        <tr>
                            <td>blank</td>
                            <td>
                                <asp:TextBox ID="blank" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>ord_hed_id</td>
                            <td>
                                <asp:TextBox ID="ord_hed_id" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>cus_id</td>
                            <td>
                                <asp:TextBox ID="cus_id" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>car_no</td>
                            <td>
                                <asp:TextBox ID="car_no" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>emp_id</td>
                            <td>
                                <asp:TextBox ID="emp_id" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>order_date</td>
                            <td>
                                <asp:TextBox ID="order_date" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>ord_status</td>
                            <td>
                                <asp:TextBox ID="ord_status" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="Btnsave" runat="server" Text="save" OnClick="Btnsave_Click" AutoPostBack="true" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />

            </div>
            </div>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    </body>
    </html>
</asp:Content>
