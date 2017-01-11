<%class>
  has 'docid';
  has 'title';
  has 'header';
  has 'content' => (default => "<font face=Verdana> Bitte hier den Text eingeben.\n</font>\n");
  has 'metatext' => (default => "Kein Metatext eingegeben");
  has 'design' => (default => "default");
  has 'Save';
  has 'Preview';
  has 'Delete';
  has 'insert' => (default => 0);
  has 'parentid';
  has 'infobox' => (default => '');
</%class>
<%method maintitle>
Seite Bearbeiten
</%method>
<%method headerincludes>
<!-- include summernote bootstrap WYSIWYG Editor css/js-->
    <link href="static/summernote.css" rel="stylesheet">
    <script src="static/summernote.min.js"></script>
</%method>

<header style="min-height:300px;">
<div class="header-content">
       <div class="header-content-inner">
      <h1>Editor</h1>
      <p>Editieren Sie hier ganz einfach das Portfolio</p>
  </div>
</div>
</header>

<% $.infobox %>

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
    <div class="alert alert-warning">
  <strong><% $msg %>
</div>
% }
<form name="editform" method="post" enctype="application/x-www-form-urlencoded">


<input type="hidden" name="insert" value="<% $.insert %>" />

<input type="hidden" name="docid" value="<% $.docid %>" />


<div class="form-group">
<label for="title">Titel</label>
<input type="text" name="title" class="form-control" value="<% $.title %>" size="50" /> <!-- Filter |h ?? -->
</div>

<div class="form-group">
<label for="title">Header-Icon Tag (zB: fa-book)

<button type="button" class="btn btn-primary btn-sm" style="margin-left:20px;" onclick="location.href='http://fontawesome.io/cheatsheet/';">Zum Cheatsheet</button>

</label>
<input type="text" name="header" class="form-control" value="<% $.header %>" size="50" />
</div>

<div class="form-group">
<label for="parentid">Parent-ID

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" style="margin-left:20px;">
  Alle verfügbaren Seiten inkl. IDs ansehen
</button>
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

<textarea id="content" name="content"><% $.content %></textarea>

  <script type="text/javascript">
  $( document ).ready(function() {
    $('#content').summernote({
  height: 300,                 // set editor height
  minHeight: null,             // set minimum height of editor
  maxHeight: null,             // set maximum height of editor
  focus: true                  // set focus to editable area after initializing summernote
});
});
  </script>

</div>

 <div class="form-group">
  <label for="design">Page-Design:</label>
  <select class="form-control" id="design" name="design">
    <option value="default">Standardmäßiges Design</option>
    <option value="dunkel">Dunkles Design</option>
    <option value="bunt">Buntes Design</option>
  </select>
</div>
<script>
    $('#design').val("<% $.design %>");
</script>


<div class="form-group">
<input type="submit" class="btn btn-primary btn-md" value="Vorschau anzeigen" name="Preview">
<a href="/wae06/database/delete?docid=<% $.docid %>&parentid=<% $.parentid %>"  class="btn btn-primary btn-md">Seite löschen</a>



</div>

<div class="form-group">

<input type="submit" class="btn btn-primary btn-md" value="&Auml;nderungen speichern" name="Save">

<input type="reset" class="btn btn-primary btn-md" value="&Auml;nderungen verwerfen" name="Cancel"> <!-- onClick="window.close()" -->
</div>
</form>
</div>

<div class="col-lg-12" style="margin-top:5.0em;"></div>

<div class="col-lg-1"></div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Alle verfügbaren Dokumente</h4>
      </div>
      <div class="modal-body">
          <% $alldocs %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Schließen</button>
      </div>
    </div>
  </div>
</div>




<%init>
use Data::Dumper;

my $dbh = Ws16::DBI->dbh();

my $msg = "";
my $alldocs = "";
my %docTitleAndIds = ('0', 'top level document');

my $sth = $dbh->prepare("SELECT id, title from wae06_document");
$sth->execute();
while (my $res = $sth->fetchrow_hashref()) {
  $docTitleAndIds{$res->{id}} = $res->{title};
  $alldocs .= "ID der Seite: " . $res->{id}  . " - Titel: " . $res->{title} . "<br />";
}
if ($.Preview){
  $m->visit('/wae06/view', isPreview => 1, content => $.content, title => 'PREVIEW - ' . $.title, parentid => $.parentid, header => $.header, metatext => $.metatext );
}



if ($.Save) {
# Speichern wurde gedrückt...
  if ($.insert == 1) {
  # Datensatz aus Formularfeldern in Datenbank einfügen
    my $sth = $dbh->prepare("INSERT INTO wae06_document (id,content,metatext,title,parent,header,design,timestamp) values (?,?,?,?,?,?,?,NOW())");
    $sth->execute($.docid,$.content,$.metatext,$.title,$.parentid,$.header,$.design);
    $msg = "Die Seite ". $.docid ." wurde neu in DB aufgenommen.".$sth->rows();
    $.insert(0);
  } else {
  # Datensatz in Datenbank ändern
    my $sth = $dbh->prepare("UPDATE wae06_document SET content = ?, title = ?, parent = ?, header = ?, design = ? WHERE id = ?");
    $sth->execute($.content,$.title,$.parentid,$.header,$.design,$.docid);
    $msg = "Datensatz " . $.docid ." in DB ver&auml;ndert.".$sth->rows();
  }
} elsif ($.docid) {
# id erkannt, daten aus Datenbank lesen
  my $sth = $dbh->prepare("SELECT id, title, content, timestamp, parent, metatext, design, header from wae06_document WHERE id = ?");
  $sth->execute($.docid);
  my $res = $sth->fetchrow_hashref();
  $.content($res->{content} || $.content);
  $.title($res->{title});
  $.parentid($res->{parent});
  $.header($res->{header});
  $.design($res->{design});
  $msg = "Datensatz " . $.docid . " aus DB gelesen.".((defined($res) && scalar(keys(%$res)))?1:0);
} else {
# keine ID, neues Dokument erstellen
  my $sth = $dbh->prepare("SELECT max(id) as maxdocid FROM wae06_document");
  $sth->execute();
  my $res = $sth->fetchrow_hashref();
  $.docid($res->{maxdocid}+1);
  $.insert(1);
}

</%init>
