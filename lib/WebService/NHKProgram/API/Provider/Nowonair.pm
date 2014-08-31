package WebService::NHKProgram::API::Provider::Nowonair;

sub call{
 my($self,$class,$arg) = @_;

 my $area = $arg->{area};
 my $service = $arg->{service};

 my $response = WebService::NHKProgram::API::Provider::Common::call(
   $class,
   "now/%(area)s/%(service)s.json",
   {
     area => $area, 
     service =>$service
   }
 );

 return JSON::decode_json($response->content)->{nowonair_list}->{g1};
}


1;
