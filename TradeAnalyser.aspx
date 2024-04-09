<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TradeAnalyser.aspx.cs" Inherits="TradeAnalyser" %>

<%-- Add content controls here --%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <script type="text/javascript" src="Select/select2.js"></script>
    <link rel="stylesheet" type="text/css" href="Select/select2.css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


     <script type="text/javascript">
         $(function () {
             $("#datepicker").datepicker({
                 changeMonth: true,
                 changeYear: true
             });
         });
    </script>
    <style>
        .form4_col { width: 18.5% !important; }

        .GridPager a, .GridPager span
    {
        display: block;
        height: 15px;
        width: 15px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
    }
    .GridPager a
    {
        background-color: #f5f5f5;
        color: #969696;
        border: 1px solid #969696;
    }
    .GridPager span
    {
        background-color: #A1DCF2;
        color: #000;
        border: 1px solid #3AC0F2;
    }
    </style>
    <div class="container">
        <h1>Trade Analysis</h1>
        <div>
            <asp:Label runat="server" ID="lblErrorDisplay" ForeColor="Red" FontBold="true" Visible="false" Font-Size="Medium" ></asp:Label>
        </div>
        <form runat="server">
          <div id="Div1" class="form4" runat="server">
            <div id="Div2" class="form4_col" runat="server">
                <asp:Label ID="lblmodel" runat="server" CssClass="star">Stock/index</asp:Label>
                <asp:DropDownList ID="ddlmodel" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" OnSelectedIndexChanged="ddlSelectedModel" data-rel="chosen" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvmodel" CssClass="errorMessage" InitialValue="0" runat="server" ControlToValidate="ddlmodel" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Select Trade"></asp:RequiredFieldValidator>
            </div>

            <div id="divtxtstockname" class="form4_col" runat="server" >
                <asp:Label ID="lblstockname" runat="server" CssClass="star">Stock Name</asp:Label>
                <asp:TextBox ID="txtstockname" runat="server" CssClass="selectClass" AutoPostBack="false" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvstockname" CssClass="errorMessage" runat="server" ControlToValidate="txtstockname" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Enter Stock Name"></asp:RequiredFieldValidator>
            </div>

            <div id="divddlindex" class="form4_col" runat="server" >
                <asp:Label ID="lblindex" runat="server" CssClass="star">Index Name</asp:Label>
                <asp:DropDownList ID="ddlindex" runat="server" CssClass="selectClass"  Display="Dynamic" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvindex" CssClass="errorMessage" InitialValue="0" runat="server" ControlToValidate="ddlindex" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Select Index"></asp:RequiredFieldValidator>
            </div>

           <div id="Div4" class="form4_col" runat="server">
                <asp:Label ID="lbltot" runat="server"  CssClass="star">Type of Trading</asp:Label>
                <asp:DropDownList ID="ddltot" runat="server" CssClass="selectClass" >
                    <asp:ListItem runat="server" Value="0">--select--</asp:ListItem>
                    <asp:ListItem runat="server" Value="1">Equity CNC</asp:ListItem>
                    <asp:ListItem runat="server" Value="2">Equity Intraday</asp:ListItem>
                    <asp:ListItem runat="server" Value="3">F&O CNC</asp:ListItem>
                    <asp:ListItem runat="server" Value="4">F&O Intraday</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div id="Div5" class="form4_col" runat="server" >
                <asp:Label ID="lbldirection" runat="server" CssClass="star">Direction</asp:Label>
                <asp:DropDownList ID="ddldirection" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" OnSelectedIndexChanged="ddlSelectedsetup"></asp:DropDownList>
            </div>

            <div id="Div6" class="form4_col" runat="server">
                <asp:Label ID="lblsetup" runat="server" >Setup</asp:Label>
                <asp:TextBox ID ="txtsetup" runat="server" autocomplete="off" />
            </div>

            <div id="Div7" class="form4_col" runat="server" >
                <asp:Label ID="lbltradesetup" runat="server" CssClass="star">Trade Setup</asp:Label>
                <asp:DropDownList ID="ddltradesetup" runat="server" CssClass="selectClass"  Display="Dynamic" OnSelectedIndexChanged="ddlSelectedtradesetup" AutoPostBack="True"></asp:DropDownList>
            </div>

            <div id="Div8" class="form4_col" runat="server" >
                <asp:Label ID="lblweapon" runat="server" CssClass="star">Weapon Name</asp:Label>
                <asp:DropDownList ID="ddlweapon" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" ></asp:DropDownList>
            </div>

            <div id="Div9" class="form4_col" runat="server">
                <asp:Label ID="lblindicator" runat="server" >Indicator</asp:Label>
                <asp:TextBox ID="txtindicator" runat="server" autocomplete="off" TextMode="MultiLine"></asp:TextBox>
            </div>

            <div id="divqty" class="form4_col" runat="server">
                <asp:Label ID="lblqty" runat="server" >Quantity</asp:Label>
                <asp:TextBox ID="txtqty" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" autocomplete="off" ></asp:TextBox>
            </div>

            <div id="divlots" class="form4_col" runat="server">
                <asp:Label ID="lbllots" runat="server" >Lots</asp:Label>
                <asp:TextBox ID="txtlots" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" autocomplete="off"></asp:TextBox>
            </div>

            <div id="Div12" class="form4_col" runat="server">
                <asp:Label ID="lblentry" runat="server" >Entry Price</asp:Label>
                <asp:TextBox ID="txtentry" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" autocomplete="off" ></asp:TextBox>
            </div>

            <div id="Diventrydate" class ="form4_col">
             <asp:Label   ID="lblentrydate" runat="server" CssClass="star">Entry Date</asp:Label>
             <asp:TextBox ID="datepicker" runat="server" CssClass="datepicker" ></asp:TextBox>                                   
            </div>

            <div id="Div13" class="form4_col" runat="server">
                <asp:Label ID="lblsl" runat="server" >Stop Loss</asp:Label>
                <asp:TextBox ID="txtsl" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" autocomplete="off"></asp:TextBox>
            </div>

            <div id="Div14" class="form4_col" runat="server">
                <asp:Label ID="Label1" runat="server" >Stop Loss</asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" autocomplete="off"></asp:TextBox>
            </div>
        </div>
        </form>

    </div>
</asp:Content>

