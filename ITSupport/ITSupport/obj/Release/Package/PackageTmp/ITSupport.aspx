 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ITSupport.aspx.cs" Inherits="ITSupport.ITSupport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../../CSS/w3.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../../CSS/datepicker3.css" rel="stylesheet" />
    <link href="../../CSS/styles.css" rel="stylesheet" />
    <!--Icons-->
    <script src="../../js/lumino.glyphs.js"></script>

    <link href="../../CSS/login.css" rel="stylesheet" />
    <link href="../../CSS/styles.css" rel="stylesheet" />

    <style>
        body{
            
            Background-image: url(/Images/city-skyline-wallpapers-008.jpg);
            background-size: 100%;
        }
    </style>
    <title>IT Support</title>
</head>
<body style="padding-top:5px">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row" style="padding:20px">
                <div class="col-lg-2">
                    &nbsp
                </div>
                <div class="col-lg-8">
                    <div class="panel panel-default" >
                    <div class="panel-body">
                        <div class="col-sm-12">
                            <p style="text-align:center;font-size:30px;font-weight:bold">IT Support</p>
                        </div>

                        <div class="col-sm-12" style="font-size:20px">
                            <div role="form">
                                <div class="form-group" style="text-align:center">
                                    <asp:Label ID="lblMessage" runat="server" style="font-size:15px;color:green"></asp:Label>
                                </div>
                            </div>
                        </div>


                        <div class="col-sm-12" style="font-size:20px">
                            <div role="form">
                                <div class="form-group">
                                    <label>IT</label>
                                    <asp:TextBox ID="txtIT" runat="server" Enabled="false" CssClass="form-control" Font-Size="20px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12"  style="font-size:20px">
                            <div role="form">
                                <div class="form-group">
                                    <label>Department</label>
                                    <asp:DropDownList ID="drpDepartment" runat="server" Font-Size="20px" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="drpDepartment_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12" style="font-size:20px">
                            <div role="form">
                                <div class="form-group">
                                    <label>Employee</label>
                                        <asp:DropDownList ID="drpEMP" runat="server" CssClass="form-control" Font-Size="20px">
                                        </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12"  style="font-size:20px">
                            <div role="form">
                                 <div class="form-group">
                                    <label>Equipment/Software/Request</label>
                                        <asp:DropDownList ID="drpEquip" runat="server" CssClass="form-control" Font-Size="20px" OnSelectedIndexChanged="drpEquip_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem>Laptop</asp:ListItem>
                                            <asp:ListItem>Desktop</asp:ListItem>
                                            <asp:ListItem>Mobile</asp:ListItem>
                                            <asp:ListItem>Printer</asp:ListItem>
                                            <asp:ListItem>Accounting System</asp:ListItem>
                                            <asp:ListItem>Payroll System</asp:ListItem>
                                            <asp:ListItem>Portal</asp:ListItem>
                                            <asp:ListItem>Internet Connection</asp:ListItem>
                                            <asp:ListItem>Telephone</asp:ListItem>
                                            <asp:ListItem>Server</asp:ListItem>
                                            <asp:ListItem>IT Request</asp:ListItem>
                                            <asp:ListItem>Others</asp:ListItem>
                                        </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12" runat="server" id="OtherEquipment"  style="font-size:20px;display:none">
                            <div role="form">
                                <div class="form-group">
                                    <label>Other Equipment</label>
                                    <asp:TextBox ID="txtOtherEquip" runat="server" CssClass="form-control" Font-Size="20px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12" style="text-align:center">
                            <br />
                            <asp:ScriptManager ID="script23" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Timer ID="Timer1" runat="server"
                                    Interval="1000"
                                    Enabled ="false" OnTick="Timer1_Tick">
                                    </asp:Timer>
                                    <asp:Label ID="lblMinuteCounter" runat="server" Text="00"></asp:Label> :
                                    <asp:Label ID="lblSecondCounter" runat="server" Text="00"></asp:Label><br />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="col-sm-12">
                            <div role="form">
                                <div class="form-group">
                                    <asp:Button ID="btnStart" runat="server" Text="Start Support" CssClass="form-control btn btn-primary" style="margin-top:10px;" OnClick="btnStart_Click"  Font-Size="20px" />
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12"  style="font-size:20px">
                            <div role="form">
                                <div class="form-group">
                                    <label>Problem/Request</label>
                                    <asp:DropDownList ID="drpProblem" runat="server" CssClass="form-control" AutoPostBack="true" Enabled="false" Font-Size="20px" OnSelectedIndexChanged="drpProblem_SelectedIndexChanged" >
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12" runat="server" id="divOtherProb"  style="font-size:20px">
                            <div role="form">
                                <div class="form-group">
                                    <label>Other Problem/Details</label>
                                    <asp:TextBox ID="txtOtherProb" runat="server" CssClass="form-control" Font-Size="20px" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12"  style="font-size:20px">
                            <div role="form">
                                <div class="form-group">
                                    <label>Result</label>
                                    <asp:DropDownList ID="drpResult" runat="server" CssClass="form-control" Enabled="false" Font-Size="20px">
                                            <asp:ListItem>Completed</asp:ListItem>
                                            <asp:ListItem>Not Completed</asp:ListItem>
                                            <asp:ListItem>Others</asp:ListItem>
                                        </asp:DropDownList>
                                </div>
                            </div>
                        </div>




                        <div class="col-sm-12"  style="font-size:20px">
                            <div role="form">
                                <div class="form-group">
                                    <label>Remarks</label>
                                    <asp:TextBox TextMode="MultiLine" runat="server" ID="txtRemarks" CssClass="form-control" Enabled="false" Font-Size="20px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div role="form">
                                <div class="form-group">
                                    <asp:Button ID="btnEndSupport" runat="server" Text="End Support" CssClass="form-control btn btn-primary" Enabled="false" style="margin-top:10px;" Font-Size="20px" OnClick="btnEndSupport_Click" />
                                </div>
                            </div>
                        </div>
                      
                    </div>
                </div>
                </div>
                <div class="col-lg-2">
                    &nbsp
                </div>
            </div>
        </div>
        
    </form>



    <script src="../../js/jquery-1.11.1.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>
	<script src="../../js/chart.min.js"></script>
	<script src="../../js/chart-data.js"></script>
	<script src="../../js/easypiechart.js"></script>
	<script src="../../js/easypiechart-data.js"></script>
	<script src="../../js/bootstrap-datepicker.js"></script>

    <script>
        $(document).ready(function () {
            $('[data-toggle="popover"]').popover();
        });
    </script>

	<script>
	    $('#calendar').datepicker({
	    });

	    !function ($) {
	        $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
	            $(this).find('em:first').toggleClass("glyphicon-minus");
	        });
	        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
	    }(window.jQuery);

	    $(window).on('resize', function () {
	        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
	    })
	    $(window).on('resize', function () {
	        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
	    })
	</script>	
</body>
</html>
