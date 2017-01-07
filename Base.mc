<%class>
    has 'maintitle' => (default => 'WAE Group 06');
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->


</head>

<body id="page-top">

<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand page-scroll" href="#page-top">KREATIVAGENTUR WENG</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="page-scroll" href="#services">was wir machen</a>
                </li>
                <li>
                    <a class="page-scroll" href="#portfolio">portfolio</a>
                </li>
                <li>
                    <a class="page-scroll" href="#contact">kontakt</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<header>
    <div class="header-content">
        <div class="header-content-inner">
            <h1 id="homeHeading">Wir verschönern Ihre Software</h1>
            <hr>
            <p>Ihr Studium heißt Software Engineering, nicht Bunte Buttons!
            Wir verschönern Ihre Software und kümmern uns um Ihr Front-End</p>
            <a href="#services" class="btn btn-primary btn-xl page-scroll">Was wir anbieten</a>
        </div>
    </div>
</header>


<section id="fixme">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
    <% inner() %>
            </div>
        </div>
    </div>
</section>

<section id="services">
<div class="container">
<div class="row">
<div class="col-lg-12 text-center">
    <h2 class="section-heading">Was wir anbieten</h2>
    <hr class="primary">
</div>
</div>
</div>
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-6 text-center">
    <div class="service-box">
        <i class="fa fa-4x fa-diamond text-primary sr-icons"></i>
        <h3>Nr 1</h3>
        <p class="text-muted">Seitentext Nr1</p>
    </div>
</div>
<div class="col-lg-3 col-md-6 text-center">
    <div class="service-box">
        <i class="fa fa-4x fa-paper-plane text-primary sr-icons"></i>
        <h3>Nr 2</h3>
        <p class="text-muted">Seitentext Nr2</p>
    </div>
</div>
<div class="col-lg-3 col-md-6 text-center">
    <div class="service-box">
        <i class="fa fa-4x fa-newspaper-o text-primary sr-icons"></i>
        <h3>Nr 3</h3>
        <p class="text-muted">Seitentext Nr3</p>
    </div>
</div>
<div class="col-lg-3 col-md-6 text-center">
    <div class="service-box">
        <i class="fa fa-4x fa-heart text-primary sr-icons"></i>
        <h3>Nr 4</h3>
        <p class="text-muted">Seitentext Nr 4</p>
    </div>
</div>
</div>
</div>
</section>

    <& portfolio.mi, email=> 'feedback@salzamt.at' &>

    <& contact.mi &>

<section id="footer">
<div class="row">
<div class="col-lg-12 text-center">
    <& footer.mi, grp => '06' &>
</div></div>
</section>

    <!-- jQuery -->
    <script src="static/vendor/jquery/jquery.min.js"></script>

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
