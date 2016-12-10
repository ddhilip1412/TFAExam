<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FeeDetails.aspx.cs" Inherits="FeeDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fee Details</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <link href="css/bootstrap-simplex.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
    <link href="css/tfaexam-custom.css" rel="stylesheet" />

    <style>
        th, td {
            text-align: center; /* center checkbox horizontally */
            vertical-align: middle; /* center checkbox vertically */
        }

        th {
            font-size: 1.2em;
        }

        #chkBoxLstCourses label {
            margin-left: 2px;
            margin-right: 10px;
            margin-top: auto;
            margin-bottom: auto;
        }
    </style>

    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
    <script>
        //paste this code under head tag or in a seperate js file.
        // Wait for window load
        $(window).load(function () {
            // Animate loader off screen
            $(".se-pre-con").fadeOut("slow");
        });
        $(document).ready(function () {
            $('#form2').submit(function (ev) {
                $(".se-pre-con").fadeIn();
            });
        });
    </script>

</head>
<body>
    <div class="se-pre-con"></div>
    <form id="form2" runat="server">

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">TFA</a>
                </div>

                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="feeDetails.aspx">Fee Details<span class="sr-only">(current)</span></a></li>
                    </ul>
                    <ul class="nav navbar-nav">
                        <li><a href="exam.aspx">Exam Committee<span class="sr-only">(current)</span></a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a id="profileDropdownMenu" runat="server" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <asp:LinkButton ID="btnChangePassword" runat="server" OnClick="btnChangePassword_Click" CssClass="">Change Password</asp:LinkButton>
                                </li>
                                <li role="separator" class="divider"></li>
                                <li>
                                    <asp:LinkButton ID="btnSignOut" runat="server" OnClick="btnSignOut_Click" CssClass="">Sign Out</asp:LinkButton>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>


        <div class="container">
            <div class="jumbotron">
                <h1>Fee Details</h1>
            </div>
            <div class="row">
                <h4>Select subjects to filter results:</h4>
                <div id="checkBoxFilters" class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                    <asp:CheckBoxList ID="chkBoxLstCourses" CssClass="" runat="server" RepeatDirection="Horizontal" CellPadding="5" CellSpacing="5" BorderStyle="None" RepeatLayout="Flow"></asp:CheckBoxList>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table-responsive" style="background-color: #eee; padding: 20px;">
                    <asp:GridView ID="gvStudentsDetails" CssClass="table table-hover" runat="server" PageIndex="1" AutoGenerateColumns="False">
                        <AlternatingRowStyle BorderStyle="None" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <script>
            $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {

                var checked_list = $("#checkBoxFilters :input[type='checkbox']:checked");
                var course = data[2]; // use data for the age column

                for (var i = 0; i < checked_list.length; i++) {

                    if (checked_list[i].value == course)
                        return true;
                }
                return false;
            });

            $(document).ready(function () {

                var table = document.getElementById("gvStudentsDetails");
                for (var i = 1, row; row = table.rows[i]; i++) {
                    var rowDate = new Date(Date.parse(row.cells[3].innerHTML));
                    var currentDate = new Date();

                    var diff = currentDate.getMonth() - rowDate.getMonth();

                    if (diff > 2) {
                        row.classList.add("danger");
                    } else if (diff > 0) {
                        row.classList.add("warning");
                    }

                    var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                    row.cells[3].innerHTML = monthNames[rowDate.getMonth()] + '-' + rowDate.getFullYear();
                }

                var table = $('#gvStudentsDetails').DataTable({
                    responsive: true
                });
                table.column(2).visible(false);
                // Event listener to the two range filtering inputs to redraw on input
                $("input[type='checkbox']").change(function () {
                    table.draw();
                });
            });
        </script>
    </form>
</body>
</html>
