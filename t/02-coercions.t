## Tests provide for simple coercions from strings
package Class;
use Moose;
with 'DateTimeX::Format';

sub parse_datetime {
	my ( $self, $time, $env ) = @_;
	$env;
}
sub format_datetime { ; }

package main;
use Test::More tests => 2;

my $env = Class->new->parse_datetime( "foobar", { locale => 'en_AU', timezone => 'America/Chicago' } );
is ( ref($env->{locale}), 'DateTime::Locale::en_AU', 'Coerce from call arg of locale worked' );
is ( ref($env->{timezone}), 'DateTime::TimeZone::America::Chicago', 'Coerce from call arg of timezone worked' );
