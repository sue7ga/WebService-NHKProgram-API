package WebService::NHKProgram::API::Service;

use strict;
use warnings;
use Carp;

use constant SERVICES => {
   g1 => 'ＮＨＫ総合１',
   g2 => 'ＮＨＫ総合２',
   e1 => 'ＮＨＫＥテレ１',
   e2 => 'ＮＨＫＥテレ２',
   e3 => 'ＮＨＫＥテレ３',
   e4 => 'ＮＨＫワンセグ２',
   s1 => 'ＮＨＫＢＳ１',
   s2 => 'ＮＨＫＢＳ１(１０２ｃｈ)',
   s3 => 'ＮＨＫＢＳプレミアム',
   s4 => 'ＮＨＫＢＳプレミアム(１０４ｃｈ)',
   r1 => 'ＮＨＫラジオ第1',
   r2 => 'ＮＨＫラジオ第2',
   r3 => 'ＮＨＫＦＭ',
   n1 => 'ＮＨＫネットラジオ第1',
   n2 => 'ＮＨＫネットラジオ第2',
   n3 => 'ＮＨＫネットラジオＦＭ',
};

sub fetch_service_id{
 my $service_name = shift;
 
 return _retrieve_service($service_name);
}

sub _retrieve_service{
 my $arg = shift;

 eval{$arg = decode_utf8($arg)};

 if($arg =~ /\A\w{1}\d{1}\Z/){
   return $arg;
 }

 for my $key (%{+SERVICES}){
   if($arg eq SERVICES->{$key}){
       return $arg;
   }
 }

 croak("no such service:$arg");

}

1;
