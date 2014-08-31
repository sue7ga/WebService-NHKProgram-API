package WebService::NHKProgram::API::Provider::Genre;
use strict;
use warnings;
use JSON;
use WebService::NHKProgram::API::Provider::Common;

sub call{
 my($self,$class,$arg) = @_;

 my $area = $arg->{area};
 my $service = $arg->{service};
 my $genre = $arg->{genre};
 my $date = $arg->{date};

 my $content = WebService::NHKProgram::API::Provider::Common::call(
   $class,
   "genre/%(area)s/%(service)s/%(genre)s/%(date)s.json",
   {
     area => $area,
     service => $service,
     genre => $genre,
     date => $date
   }
 );

 return JSON::decode_json($content->content)->{list}->{g1};
}


1;
