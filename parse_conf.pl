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

    my @lines = read_file( $tr_file, chomp => 1 );

    #p @lines;
    my @pw_fields = map [ split /=/ ], read_file( $file_name, chomp => 1 );
    # p @pw_fields;
    my $i = 0;
    my $j = 0;
    for my $field (@pw_fields) {
        given ( $$field[1] ) {
            when (defined) {
                say $$field[0] . '=' . $lines[$j];
                $j++;
                continue;
            }
            when ( !defined ) {
                if ( $$field[0] =~ m/(<|>)/g ) {
                    say $$field[0];
                    # say 'tag';
                }
                else {
    			say $$field[0] . '=';
                    
                }

                continue;
            }
        }
        $i++;
    }
}
