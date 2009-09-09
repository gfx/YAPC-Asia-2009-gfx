package Magic::Example;

use 5.008_001;
use strict;
use warnings;

our $VERSION = '0.001';

use XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

use base qw(Exporter);
our @EXPORT = qw(do_something_to_hashref_wrong do_something_to_hashref_correct);


1;
__END__

=head1 NAME

Magic::Example - 

=head1 VERSION

This document describes Magic::Example version 0.001.

=head1 SYNOPSIS

	use Magic::Example;

=head1 DESCRIPTION

Magic::Example provides

=head1 INTERFACE

=head2 Class methods

=over 4

=item *

=back

=head2 Instance methods

=over 4

=item *

=back


=head1 DEPENDENCIES

Perl 5.8.1 or later, and a C compiler.

=head1 BUGS

No bugs have been reported.

Please report any bugs or feature requests to the author.

=head1 SEE ALSO

=head1 AUTHOR

Goro Fuji (gfx) E<lt>gfuji(at)cpan.orgE<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2009, Goro Fuji (gfx). Some rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
