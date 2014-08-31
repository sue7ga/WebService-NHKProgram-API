package WebService::NHKProgram::API::Provider::Common;

use strict;
use warnings;
use Furl;
use Text::Sprintf::Named qw/named_sprintf/;

use constant API_ENDPOINT  => 'http://api.nhk.or.jp/v1/pg/';

sub call{
 my($class,$sub_url,$arg) = @_;
 my $content = $class->furl->get(named_sprintf(
   API_ENDPOINT."$sub_url?key=".$class->api_key,$arg
  )
 );
}


1;
