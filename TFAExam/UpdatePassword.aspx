<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdatePassword.aspx.cs" Inherits="UpdatePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Password</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <link href="css/bootstrap-simplex.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/tfaexam-custom.css" rel="stylesheet" />
    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
    <script>
        //paste this code under head tag or in a seperate js file.
        // Wait for window load
        $(window).load(function () {
            // Animate loader off screen
            $(".se-pre-con").fadeOut("slow");;
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
                        <li class="active"><a href="feeDetails.aspx">Fee Details<span class="sr-only">(current)</span></a></li>
                    </ul>
                    <ul class="nav navbar-nav disabled">
                        <li><a href="exam.aspx">Exam Committee<span class="sr-only">(current)</span></a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a id="profileDropdownMenu" runat="server" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"></a>
                            <ul class="dropdown-menu">
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
                <h1>Password Expired</h1>
            </div>
            <div class="row row-centered">
                <div class="col-lg-5 col-md-6 col-sm-7 col-xs-12 col-centered">

                    <h2 class="form-signin-heading">Please change your password to continue</h2>

                    <label for="txtRegID" class="sr-only">Register ID</label>
                    <input type="text" id="txtRegID" class="form-control" placeholder="Register ID" required="required" autofocus="autofocus" runat="server" style="margin-bottom: 10px;" />

                    <label for="txtOldPassword" class="sr-only">Password</label>
                    <input type="password" id="txtOldPassword" class="form-control" placeholder="Old Password" required="required" runat="server" style="margin-bottom: 10px;" />

                    <label for="txtNewPassword" class="sr-only">Password</label>
                    <input type="password" id="txtNewPassword" class="form-control" placeholder="New Password" required="required" runat="server" style="margin-bottom: 10px;" />

                    <div id="loginFailedAlert" class="alert alert-danger" role="alert" runat="server"><strong>Oh snap!</strong> Your ID and Password do not match. Correct your credentials and try submitting again.</div>
                    <div id="passwordChangeFailedAlert" class="alert alert-warning" role="alert" runat="server"><strong>Sorry!</strong> Something went wrong while updating your password. Please try submitting again.</div>

                    <br />
                    <button id="btnChange" class="btn btn-lg btn-primary btn-block" type="submit" runat="server">Change</button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
