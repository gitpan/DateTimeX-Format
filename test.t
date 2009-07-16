package Role1;
use Moose::Role;
around 'foo' => sub {
	my ( $sub, $self, $arg ) = @_;
	$self->$sub("Role1:$arg");
};

package Role2;
use Moose::Role;
around 'foo' => sub {
	my ( $sub, $self, $arg ) = @_;
	$self->$sub("Role2:$arg");
};

package Role3;
use Moose::Role;
around 'foo' => sub {
	my ( $sub, $self, $arg ) = @_;
	$self->$sub("Role2:$arg");
};
with 'Role1';


package ClassA;
use Moose;
with 'Role1';
with 'Role2';
sub foo { my $self = shift; die @_ };

package ClassB;
use Moose;
with 'Role2';
with 'Role1';
sub foo { my $self = shift; die @_ };

package ClassC;
use Moose;
with 'Role3';
sub foo { my $self = shift; die @_ };



package main;

ClassC->new->foo( 'foobar' );
