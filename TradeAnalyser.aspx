<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TradeAnalyser.aspx.cs" Inherits="TradeAnalyser" %>

<%-- Add content controls here --%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <div class="container">
        <h1>Trade Analysis</h1>
        <form runat="server">
                    <div id="Div1" class="form4" runat="server">
            <div id="Div2" class="form4_col4" runat="server">
                <asp:Label ID="lblModel" runat="server" text="Task Name"></asp:Label>
                <asp:DropDownList ID="ddlModel" runat="server" CssClass="selectClass" style="width: 70% !important;" Display="Dynamic" AutoPostBack="True" ></asp:DropDownList>
            </div>
        </div>
        </form>

    </div>
</asp:Content>

