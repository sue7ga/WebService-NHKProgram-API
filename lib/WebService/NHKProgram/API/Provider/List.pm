package WebService::NHKProgram::API::Provider::List;

use strict;
use warnings;
use JSON;
use WebService::NHKProgram::API::Provider::Common;

sub call{
 my($self,$class,$arg) = @_;

 my $area = $arg->{area};
 my $service = $arg->{service};
 my $date = $arg->{date};

 my $content = WebService::NHKProgram::API::Provider::Common::call(  
   $class,
   "list/%(area)s/%(service)s/%(date)s.json",
   {
     area => $area,
    service => $service,
    date  => $date,
   }
 );
 return JSON::decode_json($content->content)->{list}->{g1};
}


1;
