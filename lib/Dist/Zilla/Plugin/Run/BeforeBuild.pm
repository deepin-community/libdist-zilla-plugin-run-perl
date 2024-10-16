use strict;
use warnings;

package Dist::Zilla::Plugin::Run::BeforeBuild;
# ABSTRACT: execute a command of the distribution before build

our $VERSION = '0.050';

use Moose;
with qw(
  Dist::Zilla::Role::BeforeBuild
  Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub before_build {
  my ($self) = @_;
  $self->_call_script({
    pos => [sub { $self->zilla->version }]
  });
}

#pod =head1 SYNOPSIS
#pod
#pod   [Run::BeforeBuild]
#pod   run = script/do_this.pl --version %v
#pod   run = script/do_that.pl
#pod
#pod =head1 DESCRIPTION
#pod
#pod This plugin executes the specified command before building the distribution.
#pod
#pod =head1 POSITIONAL PARAMETERS
#pod
#pod See L<Dist::Zilla::Plugin::Run/CONVERSIONS>
#pod for the list of common formatting variables available to all plugins.
#pod
#pod For backward compatibility:
#pod
#pod =for :list
#pod * The 1st C<%s> will be replaced by the distribution version.
#pod
#pod =cut

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Run::BeforeBuild - execute a command of the distribution before build

=head1 VERSION

version 0.050

=head1 SYNOPSIS

  [Run::BeforeBuild]
  run = script/do_this.pl --version %v
  run = script/do_that.pl

=head1 DESCRIPTION

This plugin executes the specified command before building the distribution.

=head1 POSITIONAL PARAMETERS

See L<Dist::Zilla::Plugin::Run/CONVERSIONS>
for the list of common formatting variables available to all plugins.

For backward compatibility:

=over 4

=item *

The 1st C<%s> will be replaced by the distribution version.

=back

=head1 SUPPORT

Bugs may be submitted through L<the RT bug tracker|https://rt.cpan.org/Public/Dist/Display.html?Name=Dist-Zilla-Plugin-Run>
(or L<bug-Dist-Zilla-Plugin-Run@rt.cpan.org|mailto:bug-Dist-Zilla-Plugin-Run@rt.cpan.org>).

There is also a mailing list available for users of this distribution, at
L<http://dzil.org/#mailing-list>.

There is also an irc channel available for users of this distribution, at
L<C<#distzilla> on C<irc.perl.org>|irc://irc.perl.org/#distzilla>.

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us> L<https://raudss.us/>

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2010 by L<Raudssus Social Software|https://raudss.us/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
