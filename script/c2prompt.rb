#!/usr/bin/env ruby

puts ENV['PWD']

__END__

sub main {
    
    my @av = @_;

    $home = $ENV{HOME};
    $pwd = $ENV{PWD};
#print "arg: $pwd\n";
    $pwd =~ s!($home)!~!;
    $npwd = $pwd;

    $pwd =~ m!([^/]*/[^/]*$)! and do {
        $npwd = $1;
#print "1: '$1'\n";
    };

    print "$npwd";
}

main( @ARGV);

#end of file
