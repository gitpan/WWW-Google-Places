#!perl

use strict; use warnings;
use WWW::Google::Places;
use Test::More tests => 4;

my ($api_key, $sensor, $google);
$api_key = 'Your_API_Key';
$sensor  = 'true';
$google  = WWW::Google::Places->new(api_key=>$api_key, sensor=>$sensor);

eval { $google->add(); };
like($@, qr/ERROR: Missing params list/);

eval { $google->add({ 'location'=>'-33.8669710,151.1958750' }); };
like($@, qr/ERROR: Missing mandatory param/);

eval { $google->add({ 'accuracy'=>50 }); };
like($@, qr/ERROR: Missing mandatory param/);

eval { $google->add({ 'name'=>'Google Shoes!' }); };
like($@, qr/ERROR: Missing mandatory param/);

done_testing();
