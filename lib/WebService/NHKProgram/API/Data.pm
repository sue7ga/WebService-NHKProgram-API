package WebService::NHKProgram::API::Date;

use strict;
use warnings;
use Carp;

sub validate{
 my $arg = shift;

 if($arg =~ /\A\d{4}-\d{2}-\d{2}\Z/){
   return 1;
 }

 croak("invalidate date type:$arg");

}

1;
