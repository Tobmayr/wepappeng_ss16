<%class>
    has 'maintitle' => (default => 'WAE Group 06');
    has 'extramenu' => (default => '');
    has 'headerincludes' => (default => '');
</%class>

<%augment wrap>

<!DOCTYPE html>
<html lang="de">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


% $.Defer {{
      <title><% $.maintitle %></title>
% }}


<!-- Bootstrap Core CSS -->
<link href="static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="static/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="static/css/creative.min.css" rel="stylesheet">


<!-- Menu CSS -->
<link href="static/css/multidrop.css" rel="stylesheet">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- jQuery -->
    <script src="static/vendor/jquery/jquery.min.js"></script>

<% $.headerincludes %>

</head>

<body id="page-top">

<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand page-scroll" href="/wae06/">KREATIVAGENTUR WENG</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">

    <% $.extramenu %>

            </ul>


        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

    <% inner() %>


<aside class="bg-dark">
<section id="footer" style="padding:0px;">
<div class="row">
<div class="col-lg-12 text-center">
    <& footer.mi, grp => '06' &>
</div></div>
</section>
</aside>


    <!-- Bootstrap Core JavaScript -->
    <script src="static/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="static/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="static/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="static/js/creative.min.js"></script>

</body>

</html>

</%augment>

<%flags>
    extends => undef
</%flags>
