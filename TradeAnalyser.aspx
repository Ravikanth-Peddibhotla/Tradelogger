<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TradeAnalyser.aspx.cs" Inherits="TradeAnalyser" %>

<%-- Add content controls here --%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <div class="container">
        <h1>Trade Analysis</h1>
        <form runat="server">
                    <div id="Div1" class="form4" runat="server">
            <div id="Div2" class="form4_col" runat="server">
                <asp:Label ID="lblmodel" runat="server" >Stock/index</asp:Label>
                <asp:DropDownList ID="ddlmodel" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:DropDownList>
            </div>

            <div id="Div3" class="form4_col" runat="server">
                <asp:Label ID="lblstockname" runat="server">Stock Name</asp:Label>
                <asp:TextBox ID="txtstockname" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:TextBox>
            </div>

           <div id="Div4" class="form4_col" runat="server">
                <asp:Label ID="lbltot" runat="server" >Type of Trading</asp:Label>
                <asp:DropDownList ID="ddltot" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:DropDownList>
            </div>

            <div id="Div5" class="form4_col" runat="server">
                <asp:Label ID="lbldirection" runat="server" >Direction</asp:Label>
                <asp:DropDownList ID="ddldirection" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:DropDownList>
            </div>

            <div id="Div6" class="form4_col" runat="server">
                <asp:Label ID="lblsetup" runat="server" >Setup</asp:Label>
                <asp:DropDownList ID="ddlsetup" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:DropDownList>
            </div>

            <div id="Div7" class="form4_col" runat="server">
                <asp:Label ID="lbltradesetup" runat="server" >Trade Setup</asp:Label>
                <asp:DropDownList ID="ddltradesetup" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:DropDownList>
            </div>

            <div id="Div8" class="form4_col" runat="server">
                <asp:Label ID="lblweapon" runat="server" >Weapon Name</asp:Label>
                <asp:DropDownList ID="ddlweapon" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:DropDownList>
            </div>

            <div id="Div9" class="form4_col" runat="server">
                <asp:Label ID="lblindicator" runat="server" >Indicator</asp:Label>
                <asp:DropDownList ID="ddlindicator" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:DropDownList>
            </div>

            <div id="Div10" class="form4_col" runat="server">
                <asp:Label ID="lblqty" runat="server" >Quantity</asp:Label>
                <asp:TextBox ID="txtqty" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:TextBox>
            </div>

            <div id="Div11" class="form4_col" runat="server">
                <asp:Label ID="lbllots" runat="server" >Lots</asp:Label>
                <asp:TextBox ID="txtlots" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:TextBox>
            </div>

            <div id="Div12" class="form4_col" runat="server">
                <asp:Label ID="lblentry" runat="server" >Entry Price</asp:Label>
                <asp:TextBox ID="txtentry" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:TextBox>
            </div>

            <div id="Div15" class="form4_col" runat="server">
                <asp:Label ID="Label2" runat="server" >Entry Date</asp:Label>
                <asp:Calendar ID="calentrydate" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:Calendar>
            </div>

            <div id="Div13" class="form4_col" runat="server">
                <asp:Label ID="lblsl" runat="server" >Stop Loss</asp:Label>
                <asp:TextBox ID="txtsl" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:TextBox>
            </div>

            <div id="Div14" class="form4_col" runat="server">
                <asp:Label ID="Label1" runat="server" >Stop Loss</asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:TextBox>
            </div>
        </div>
        </form>

    </div>
</asp:Content>

