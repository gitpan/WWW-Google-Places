#!perl

use strict; use warnings;
use WWW::Google::Places;

use Test::More tests => 5;

my ($api_key, $sensor, $google);
$api_key = 'Your_API_Key';
$sensor  = 'true';
$google  = WWW::Google::Places->new(api_key=>$api_key, sensor=>$sensor);

eval { $google->search({ location=>'-33.8670522,151.1957362' }); };
like($@, qr/ERROR: Missing mandatory param: radius/);

eval { $google->search({ location=>'abcde,151.1957362', radius=>500 }); };
like($@, qr/ERROR: Invalid location type data found/);

eval { $google->search({ location=>'151.1957362', radius=>500 }); };
like($@, qr/ERROR: Invalid location type data found/);

eval { $google->search({ location=>'151.1957362,abcde', radius=>500 }); };
like($@, qr/ERROR: Invalid location type data found/);

eval { $google->search({ location=>'151.1957362,123.4567,123.45678', radius=>500 }); };
like($@, qr/ERROR: Invalid location type data found/);

done_testing();
