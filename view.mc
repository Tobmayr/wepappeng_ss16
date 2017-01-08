<%class>
    has 'docid' => (default => -1);
    has 'title';
    has 'header';
    has 'content';
    has 'metatext';
    has 'parentid';
    has 'design';
    has 'isPreview' => (default => 0);
</%class>
<%method extramenu>
    <& menu.mi &>
    <li>
        <a class="page-scroll" href="/wae06/editor?docid=<% $.docid %>"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Diese Seite bearbeiten</a>
    </li>
</%method>
<%method maintitle>
Portfolio - <% $.title %>
</%method>
<%method headerincludes>
  <link href="static/css/template-design.css" rel="stylesheet">
</%method>

<header style="min-height:50px;">
<div class="header-content  <% $.design %>">

</div>
</header>


<section id="content">
<div class="container">
<div class="row">

<div class="col-lg-12 text-center <% $.design %>" style="margin-bottom:50px;">
<i class="fa fa-4x <% $.header %> text-primary sr-icons"></i>

</div>
<div class="col-lg-12 text-center">
   <h2 class="section-heading"> <% $.title %> </h2>
   <hr class="primary">
</div>
</div>
</div>
<div class="container <% $.design %>">
<div class="row">

<% $.content %>

</div>
</div>
</section>






<%init>
if($.isPreview != 1) {
    use Data::Dumper;
    my $dbh = Ws16::DBI->dbh();
    if ($.docid) {
        # id erkannt, daten aus Datenbank lesen
        my $sth = $dbh->prepare("SELECT id, title, content, timestamp, parent, metatext, header, design from wae06_document WHERE id = ?");
        $sth->execute($.docid);
        my $res = $sth->fetchrow_hashref();
        $.content($res->{content} || $.content);
        $.title($res->{title});
        $.parentid($res->{parent});
        $.header($res->{header});
        $.design($res->{design});

    } else {
        $m->redirect('/wae06/');
    }
}
</%init>
