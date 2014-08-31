package WebService::NHKProgram::API;
use WebService::NHKProgram::API::Provider;
use 5.008005;
use strict;
use warnings;
use Furl;

use Class::Accessor::Lite::Lazy(
  new => 1,
  ro => [qw/api_key/],
  ro_lazy => [qw/provider/],
);

our $VERSION = "0.01";

sub list{
 my $self = shift;
 my $content = $self->provider->dispatch('list',@_);
 return $content;
}

sub _build_provider{
 my $self = shift;
 return WebService::NHKProgram::API::Provider->new(
    furl => Furl->new(
      agent   => 'WWW::NHKProgram::API(Perl)',
      timeout => 10,
    ),
    api_key => $self->api_key
 );
}

1;
__END__

=encoding utf-8

=head1 NAME

WebService::NHKProgram::API - It's new $module

=head1 SYNOPSIS

    use WebService::NHKProgram::API;

=head1 DESCRIPTION

WebService::NHKProgram::API is ...

=head1 LICENSE

Copyright (C) sue7ga.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

sue7ga E<lt>sue77ga@gmail.comE<gt>

=cut

