<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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
    <form id="form2" runat="server">

        <nav class="navbar navbar-default navbar-fixed-top" style="margin-bottom: 0px;">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">TFA</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->

                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <div class="container">
            <div class="jumbotron">
                <h1>Login</h1>
            </div>
            <div class="row row-centered" style="background-color: #eee; padding: 20px;">
                <div class="col-lg-5 col-md-6 col-sm-7 col-xs-12 col-centered">

                    <h2 class="form-signin-heading">Please sign in</h2>

                    <label for="txtRegID" class="sr-only">Email address</label>
                    <input type="text" id="txtRegID" class="form-control" placeholder="Register ID" required="required" autofocus="autofocus" runat="server" style="margin-bottom: 10px;" />

                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" id="txtPassword" class="form-control" placeholder="Password" required="required" runat="server" style="margin-bottom: 10px;" />

                    <div id="loginFailedAlert" class="alert alert-danger" role="alert" runat="server"><strong>Oh snap!</strong> Your ID and Password do not match. Correct your credentials and try submitting again.</div>

                    <br />
                    <button id="btnSignIn" class="btn btn-lg btn-primary btn-block" type="submit" runat="server">Sign in</button>
                </div>
            </div>
        </div>
        <script>
            
        </script>
    </form>
</body>
</html>
