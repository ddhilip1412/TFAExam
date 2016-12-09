<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
                    <a class="navbar-brand" href="#">101</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <p class="navbar-text">Signed in as <a href="#" class="navbar-link">Default</a></p>
                        </li>
                        <li class="">
                            <asp:Button ID="btnSignOut" runat="server" Text="Sign Out" class="btn btn-default navbar-btn" OnClick="btnSignOut_Click" /></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row row-centered">
                <div class="col-md-8 col-centered">
                    <!--Content comes here-->
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
