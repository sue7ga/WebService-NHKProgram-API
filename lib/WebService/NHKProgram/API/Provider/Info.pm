package WebService::NHKProgram::API::Provider::Info;

sub call{
 my($self,$class,$arg) = @_;

 my $area = $arg->{area};
 my $service = $arg->{service};
 my $id = $arg->{id};

 my $response = WebService::NHKProgram::API::Provider::Common::call(
   $class,
   "info/%(area)s/%(service)s/%(id)s.json",
   ,{
      area => $area,
      service => $service,
      id => $id
    }
 );

 return JSON::decode_json($response->content)->{list}->{g1}
}

1;
