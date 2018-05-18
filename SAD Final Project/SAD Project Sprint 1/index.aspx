<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SAD_Project_Sprint_1.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <link href="Style%20Sheet/IndexPage.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
   


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="jumbotron" id="cont">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                   
                        <p>
                            Welcome to Apex Auto Store.
                        </p>
                     <h4>Apex Auto Store 2414 Bay Area Blvd in Houston, TX is your go-to destination for quality aftermarket auto parts, do-it-yourself repair advice and tools, 
                         and everything you need to keep your car, truck or SUV running smoothly. Every Apex Store in Houston, 
                         TX offers free in-store Battery Testing, Battery Charging, 
                         Oil Recycling, our Loan-A-Tool® Program and Fix Finder - a simple Check Engine light tool that 
                         utilizes an extensive database from ASE certified mechanics to find the most 
                         likely fix.</h4>
                </div>

            </div>
        </div>
    </div>

    <div class="jumbotron" id="bck">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                   
                       <%-- <p>
                            Welcome to Apex Auto Store.
                        </p>--%>
                </div>
            </div>
            <div class="row">
                <img src="Images/11.jpg" class=" col-lg-4" />
                 <img src="Images/12.jpg" class=" col-lg-4" />
                <img src="Images/13.jpg" class=" col-lg-4" />
                
            </div>

        </div>
    </div>
</asp:Content>
