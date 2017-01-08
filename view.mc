<%class>
    has 'docid';
    has 'title';
    has 'header';
    has 'content';
    has 'metatext';
    has 'parentid';
</%class>

<%method maintitle>
Portfolio - <% $.title %>
</%method>
<%method extramenu>

</%method>

<header style="min-height:50px;">
<div class="header-content">

</div>
</header>


<section id="content">
<div class="container">
<div class="row">

<div class="col-lg-12 text-center" style="margin-bottom:50px;">
<i class="fa fa-4x <% $.header %> text-primary sr-icons"></i>

</div>
<div class="col-lg-12 text-center">
   <h2 class="section-heading"> <% $.title %> </h2>
   <hr class="primary">
</div>
</div>
</div>
<div class="container">
<div class="row">

<% $.content %>

</div>
</div>
</section>






<%init>
    use Data::Dumper;

    my $dbh = Ws16::DBI->dbh();


    if($.docid){
        # id erkannt, daten aus Datenbank lesen
        my $sth = $dbh->prepare("SELECT id, title, content, timestamp, parent, metatext, header from wae06_document WHERE id = ?");
        $sth->execute($.docid);
        my $res = $sth->fetchrow_hashref();
        $.content($res->{content} || $.content);
        $.title($res->{title});
        $.parentid($res->{parent});
        $.header($res->{header});

    } else {
    # keine ID, neues Dokument erstellen
    my $sth = $dbh->prepare("SELECT max(id) as maxdocid FROM wae06_document");
    $sth->execute();
    my $res = $sth->fetchrow_hashref();
    $.docid($res->{maxdocid} + 1);
    $.insert(1);
}
</%init>
