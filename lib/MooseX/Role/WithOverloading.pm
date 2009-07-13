package MooseX::Role::WithOverloading;

use Moose::Role ();
use Moose::Exporter;
use Moose::Util::MetaRole;
use MooseX::Role::WithOverloading::Meta::Role::Application::ToClass;

Moose::Exporter->setup_import_methods(also => 'Moose::Role');

sub init_meta {
    my ($class, %opts) = @_;
    my $meta = Moose::Role->init_meta(%opts);

    Moose::Util::MetaRole::apply_metaclass_roles(
        for_class                        => $opts{for_class},
        application_to_class_class_roles => ['MooseX::Role::WithOverloading::Meta::Role::Application::ToClass'],
    );

    return $meta;
}

1;
