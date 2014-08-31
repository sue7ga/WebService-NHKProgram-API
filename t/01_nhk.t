use strict;
use warnings;
use Test::More;
use Data::Dumper;
use utf8;
{
 package Data::Dumper;
 sub qquote{return shift;}
}
$Data::Dumper::Useperl = 1;
use WebService::NHKProgram::API;

my $nhk = WebService::NHKProgram::API->new(api_key => 'Po7eQfTKstHRdoC2mjJkY7RLjaE6lLCr');

subtest 'list' => sub{
 my $list = $nhk->list({area => '130',service => 'g1',date => '2014-08-31'});
};

subtest 'genre' => sub{
 my $genre = $nhk->genre({area => '130',service => 'g1',genre => '0000',date => '2014-09-01'});
};

subtest 'info' => sub{
 my $info = $nhk->info({area => '130', service => 'g1',id => '2014090126579'});
 is($info->[0]->{subtitle},'ア・リーグ同地区でしれつなワイルドカード争いを繰り広げる両チーム。８月、打撃好調のイチロー、途中出場でも結果をみせる川崎の活躍にも注目だ。');
};

subtest 'now_on_air' => sub{
 my $now_on_air = $nhk->now_on_air({area => '130',service => 'g1'});
 print Dumper $now_on_air;
};



