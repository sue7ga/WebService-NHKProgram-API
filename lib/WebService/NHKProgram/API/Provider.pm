package WebService::NHKProgram::API::Provider;

use strict;
use warnings;
use Furl;

use WebService::NHKProgram::API::Provider::List;
use WebService::NHKProgram::API::Provider::Genre;
use WebService::NHKProgram::API::Provider::Info;
use WebService::NHKProgram::API::Provider::Nowonair;

use Class::Accessor::Lite::Lazy(
  new => 1,
   ro => [qw/furl api_key/],
);

sub dispatch{
 my($self,$api_name,$arg) = @_;
 my $class = __PACKAGE__.'::'.ucfirst($api_name);
 $class->call($self,$arg);
}

1;
