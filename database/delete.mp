has 'docid' => (required => 1);
has 'parentid';
method handle() {
    my $dbh = Ws16::DBI->dbh();
    my $sth = $dbh->prepare("UPDATE `wae06_document` SET parent= ? where parent= ?");
    $sth->execute($.parentid,$.docid);
    $sth = $dbh->prepare("DELETE FROM wae06_document WHERE id = ?");
    $sth->execute($.docid);
    $m->redirect('/wae06/editor?infobox=<div class="alert alert-success"><strong>Löschen erfolgreich!</strong> Die Seite mit der ID ' .  $.docid . ' wurde entfernt.</div>');
}
