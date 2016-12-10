<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Exam.aspx.cs" Inherits="_Exam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap-simplex.min.css" rel="stylesheet" />
    <!--Simplex Theme downloaded from Bootswatch.com-->
    <%--<link href="css/bootstrap.min.css" rel="stylesheet" />--%>
    <!--Original theme downloaded from GetBootstrap.com-->
    <link href="css/tfaexam-custom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
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
                        <li><a href="feeDetails.aspx">Fee Details<span class="sr-only">(current)</span></a></li>
                    </ul>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="exam.aspx">Exam Committee<span class="sr-only">(current)</span></a></li>
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
            </div>
        </nav>

        <div class="container">
            <div class="jumbotron">
                <h1>Exam Portal</h1>
            </div>
            <div class="row row-centered">
                <div class="col-xs-10 col-sm-10 col-md-8 col-lg-8 col-centered" style="background-color: #eee; padding: 20px;">

                    <h1 class="mb-0">Filter Search results</h1>
                    <p class="">Enter the filter criteria to generate results</p>
                    <hr />

                    <div class="row filter-row">
                        <!--Student Names-->
                        <div class="col-md-6">
                            <h4>Student Names</h4>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtBoxStudentNames" runat="server" type="text" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row filter-row">
                        <!--Student IDs-->
                        <div class="col-md-6">
                            <h4>Student Registration IDs</h4>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtBoxStudentIDs" runat="server" type="text" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row filter-row">
                        <!--Student Roll Nos-->
                        <div class="col-md-6">
                            <h4>Student Subject Roll Nos</h4>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtBoxStudentRollNos" runat="server" type="text" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row filter-row">
                        <!--Subjects-->
                        <div class="col-md-6">
                            <h4>Subjects</h4>
                        </div>
                        <div class="col-md-6">
                            <fieldset>
                                <div class="checkbox checkboxlist">
                                    <!--List of Subjects should be generated here dynamically-->
                                    <asp:CheckBoxList ID="cbxlSubjects" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                                    </asp:CheckBoxList>
                                </div>
                            </fieldset>
                        </div>
                    </div>

                    <div class="row filter-row">
                        <!--Exam Time-->
                        <div class="col-md-6">
                            <h4>Exam Time</h4>
                        </div>
                        <div class="col-md-6">
                            <fieldset>
                                <div class="checkbox checkboxlist">
                                    <!--List of Exam times should be generated here dynamically-->
                                    <asp:CheckBoxList ID="cbxlExamTime" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                                    </asp:CheckBoxList>
                                </div>
                            </fieldset>
                        </div>
                    </div>

                    <div class="row row-centered filter-row">
                        <!--Submit to search button-->
                        <div class="col-md-2 col-centered">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-default navbar-btn" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                    <div>
                        <!--The result table will be generated here-->
                    </div>
                </div>
            </div>
        </div>
    </form>




    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
