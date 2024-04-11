<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TradeAnalyser.aspx.cs" Inherits="TradeAnalyser" %>

<%-- Add content controls here --%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <script type="text/javascript" src="Select/select2.js"></script>
    <link rel="stylesheet" type="text/css" href="Select/select2.css"/>
    <link type="text/css" href="css/ui-lightness/jquery-ui-1.8.19.custom.css" rel="stylesheet" />
    <script type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui-1.8.20.min.js"></script> 


     <script type="text/javascript">
         $(function () {
             $("#datepicker").datepicker({
                 changeMonth: true,
                 changeYear: true
             });
         });


        /* $('.datepicker').datetimepicker({

             format: 'Y/m/d H:i',
             formatTime: 'H:i',
             formatDate: 'Y/m/d',

             // new Date(), '1986/12/08', '-1970/01/05','-1970/01/05',
             startDate:  false, 

             step: 60,
             monthChangeSpinner: true,

             closeOnDateSelect: false,
             closeOnTimeSelect: true,
             closeOnWithoutClick: true,
             closeOnInputClick: true,
             openOnFocus: true,

             timepicker: true,
             datepicker: true,
  
         });*/

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
    <div class="container" runat="server">
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
                <asp:TextBox ID="txtindicator" runat="server" autocomplete="off" Wrap="true"></asp:TextBox>
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
             <asp:TextBox ID="txtentrydatepicker" runat="server" CssClass="datepicker" ></asp:TextBox>                                   
            </div>

            <div id="Div13" class="form4_col" runat="server">
                <asp:Label ID="lblsl" runat="server" >Stop Loss</asp:Label>
                <asp:TextBox ID="txtsl" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" autocomplete="off"></asp:TextBox>
            </div>

            <div id="Div3" class="form4_col" runat="server">
                <asp:Label ID="lbltarget" runat="server" >Target</asp:Label>
                <asp:TextBox ID="txttarget" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" autocomplete="off"></asp:TextBox>
            </div>

           <div id="Div10" class="form4_col" runat="server">
                <asp:Label ID="lblrrr" runat="server" >RRR</asp:Label>
                <asp:TextBox ID="txtrrr" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" autocomplete="off"></asp:TextBox>
            </div>

            <div id="Div14" class="form4_col" runat="server">
                <asp:Label ID="lblexit" runat="server" >Exit price</asp:Label>
                <asp:TextBox ID="txtexit" runat="server" CssClass="selectClass"  Display="Dynamic" AutoPostBack="True" autocomplete="off"></asp:TextBox>
            </div>

            <div id="Div11" class ="form4_col">
             <asp:Label   ID="lblexitdate" runat="server" CssClass="star">Exit Date</asp:Label>
             <asp:TextBox ID="txtexitdate" runat="server" CssClass="datepicker" ></asp:TextBox>                                   
            </div>
            
            <div class="searchdiv" id="submitdiv" runat="server" style="text-align: center;width: 100%;">
                <asp:Button ID="Button1" runat="server" style="width:100px;" CssClass="formbtn searchbtn-common fa fa-paper-plane"  Text="&#xf1d8; Submit" OnClick="finalSubmit" OnClientClick="this.disabled='true';"  UseSubmitBehavior="false" />
                <asp:Button ID="Button2" runat="server" CausesValidation="false" style="width:100px;" CssClass="formbtn resetbtn-common fa fa-refresh" Text="&#xf021; Reset" OnClick="resetAll" />
            </div>
        </div>


      <div class="griddiv" runat="server">
           <asp:GridView ID="gvRequestDetails" runat="server" CellPadding="4" AllowPaging="true" PageSize="10" emptydatatext="No Records Found !" ShowHeaderWhenEmpty="True" 
                AutoGenerateColumns="False" OnPageIndexChanging="PageIndexChanging" >
                <Columns>
                    <asp:BoundField HeaderText="stock name" DataField="stockname" />
                    <asp:BoundField HeaderText="Entry" DataField="Entryprice" />
                    <asp:BoundField HeaderText="Stoploss" DataField="Stoploss" />
                    <asp:BoundField HeaderText="targetprice" DataField="targetprice" />
                    <asp:BoundField HeaderText="exitprice" DataField="exitprice" />
                    <asp:BoundField HeaderText="exitprice" DataField="exitprice" />
                    <asp:BoundField HeaderText="Created Date" DataField="createddate" />
                </Columns>
                <HeaderStyle BackColor="#5f6970" Font-Bold="True" ForeColor="white" />
            </asp:GridView>
        </div>           
   </form>

    </div>
</asp:Content>

