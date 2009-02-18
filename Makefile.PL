use inc::Module::Install;

name     'DateTimeX-Format';
all_from 'lib/DateTimeX/Format.pm';
author   'Evan Carroll <me@evancarroll.com>';
license  'perl';

requires 'Moose';
requires 'MooseX::Types::DateTime';
requires 'Moose::Role';

requires 'DateTime';
requires 'DateTime::Locale';
requires 'DateTime::TimeZone';
requires 'Carp';

build_requires 'Test::More';

auto_install;

WriteAll;
