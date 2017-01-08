<%class>
    has 'docid';
  has 'title';
  has 'content' => (default => "<font face=Verdana> Bitte hier den Text eingeben.\n</font>\n");
  has 'metatext';
  has 'Save';
  has 'insert' => (default => 0);
  has 'parentid';
</%class>
<%method maintitle>
Seite Bearbeiten
</%method>

<header style="min-height:300px;">
<div class="header-content">
       <div class="header-content-inner">
      <h1>Editor</h1>
      <p>Editieren Sie hier ganz einfach das Portfolio</p>
  </div>
</div>
</header>

<div class="row">
<div class="col-lg-1"></div>
<div class="col-lg-10">
<h2>
% if (defined($.docid) && ($.insert==0)) {
Dokument <% $.docid %> editieren
% } else {
<h1>Neues Dokument anlegen</h1>
% }
</h2>
% if (length($msg)) {
<p style="color:red;font-size:10px;"><% $msg %></p>
% }
<form name="editform" method="post" enctype="application/x-www-form-urlencoded">

<input type="hidden" name="docid" value="<% $.docid %>">
<input type="hidden" name="insert" value="<% $.insert %>">

<div class="form-group">
<label for="title">Titel</label>
<input type="text" name="title" class="form-control" value="<% $.title %>" size="50" /></TD> <!-- Filter |h ?? -->
</div>

<div class="form-group">
<label for="parentid">Parent-ID
<%doc>
<%  $cgi->popup_menu(-name      =>'parentid',
                       -values    => [ sort keys %docTitleAndIds ],
                       -default   => $parentid,
                       -labels    => \%docTitleAndIds)
  %> aktuell: <% $docTitleAndIds{$parentid} %>
</%doc></label>
  <input type="text" name="parentid" class="form-control" value="<% $.parentid %>" size="3" />
</div>

<div class="form-group">
<label for="content">Seiteninhalt</label>
  <textarea name="content" class="form-control" rows="10" id="content"><% $.content %></textarea>
<script>
	// Replace the <textarea id="content"> with a CKEditor
	// instance, using default configuration.
	CKEDITOR.replace('content',{
		width   : '560px',
		height  : '400px'
	});
</script>
</div>

<input type="submit" class="btn btn-primary btn-md" value="&Auml;nderungen speichern" name="Save">
&nbsp;&nbsp;&nbsp;
<input type="reset" class="btn btn-primary btn-md" value="&Auml;nderungen verwerfen" name="Cancel"> <!-- onClick="window.close()" -->

</div>
<div class="col-lg-12" style="margin-top:5.0em;"></div>

<div class="col-lg-1"></div>
</div>
<%init>
use Data::Dumper;

my $dbh = Ws16::DBI->dbh();

my $msg = "Welcome to the WCM content editor.";
my %docTitleAndIds = ('0', 'top level document');

my $sth = $dbh->prepare("SELECT docid, title from schranz_cms");
$sth->execute();
while (my $res = $sth->fetchrow_hashref()) {
  $docTitleAndIds{$res->{docid}} = $res->{title};
}

if ($.Save) {
# Speichern wurde gedr�ckt...
  if ($.insert == 1) {
  # Datensatz aus Formularfeldern in Datenbank einf�gen
    my $sth = $dbh->prepare("INSERT INTO schranz_cms (docid,content,metatext,title,parent,created) values (?,?,?,?,?,NOW())");
    $sth->execute($.docid,$.content,$.metatext,$.title,$.parentid);
    $msg = "Datensatz ". $.docid ." neu in DB aufgenommen.".$sth->rows();
    $.insert = 0;
  } else {
  # Datensatz in Datenbank �ndern
    my $sth = $dbh->prepare("UPDATE schranz_cms SET content = ?, title = ?, parent = ? WHERE docid = ?");
    $sth->execute($.content,$.title,$.parentid,$.docid);
    $msg = "Datensatz " . $.docid ." in DB ver&auml;ndert.".$sth->rows();
  }
} elsif ($.docid) {
# id erkannt, daten aus Datenbank lesen
  my $sth = $dbh->prepare("SELECT docid, title, content, created, parent, metatext from schranz_cms WHERE docid = ?");
  $sth->execute($.docid);
  my $res = $sth->fetchrow_hashref();
  $.content($res->{content} || $.content);
  $.title($res->{title});
  $.parentid($res->{parent});
  $msg = "Datensatz " . $.docid . " aus DB gelesen.".((defined($res) && scalar(keys(%$res)))?1:0);
} else {
# keine ID, neues Dokument erstellen
  my $sth = $dbh->prepare("SELECT max(docid) as maxdocid FROM schranz_cms");
  $sth->execute();
  my $res = $sth->fetchrow_hashref();
  $.docid($res->{maxdocid}+1);
  $.insert(1);
}
</%init>
