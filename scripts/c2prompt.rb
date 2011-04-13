#!/usr/bin/env ruby

d = File.expand_path ENV['PWD']
d.sub! /#{ENV['HOME']}/, '~'

m = d.match %r[([^/]*/[^/]*$)]
m && d = m[1]

puts d

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
