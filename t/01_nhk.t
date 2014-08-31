use strict;
use warnings;
use Test::More;
use Data::Dumper;
{
 package Data::Dumper;
 sub qquote {return shift;}
}

$Data::Dumper::Useperl = 1;

use WebService::NHKProgram::API;

my $nhk = WebService::NHKProgram::API->new(api_key => 'Po7eQfTKstHRdoC2mjJkY7RLjaE6lLCr');

my $list = $nhk->list({area => '130',service => 'g1',date => '2014-08-31'});

print Dumper $list;




