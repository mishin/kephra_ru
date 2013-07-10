#!perl
use Modern::Perl;
use POSIX qw(strftime);
use File::Slurp;
use File::Path qw(make_path);
use File::Spec::Functions qw(catdir catfile);
use File::HomeDir;
use Getopt::Long;
use DDP;

#use Config::Simple;
my %args;
GetOptions( \%args, "conf=s", "from_google=s", ) or die "Invalid arguments!";
die "Missing --conf!"        unless $args{conf};
die "Missing --from_google!" unless $args{from_google};

main( $args{conf}, $args{from_google} );

sub main {
    my ( $file_name, $tr_file ) = @_;

    my @lines = read_file($tr_file);

    #    p @lines;
    my @pw_fields = map [ split /=/ ], read_file($file_name);
    my $i         = 0;
    my $j         = 0;
    for my $field (@pw_fields) {

        print $$field[1] if defined $$field[1];
        if ( defined $$field[1] ) {

            #   print $$field[0] . '=' . $lines[$j++];
        }
        else {
            #  print $$field[0];
        }

        #        say $i;
        #        say "\$lines=" . $lines[$i];
        #        say "\$\$field=" . $$field[$i];
        $i++;

        #        last if $i > 30;
    }
}
