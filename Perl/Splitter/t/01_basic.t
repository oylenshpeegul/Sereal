#!perl
use strict;
use warnings;
use Test::More;

use 5.10.1;
use Sereal::Splitter;

use Data::HexDump;

use Sereal::Encoder qw(encode_sereal);

{
    my $data = encode_sereal([ {foo => 1 }, {bar => 2} ]);
    print HexDump $data;
    my $o = Sereal::Splitter->new({chunk_size => 1, input => $data});
    

    while (defined( my $chunk = $o->next_chunk())) {
        print HexDump $chunk;
    }

}

pass;



# my $content = do {local (@ARGV, $/) = ('test31.srl'), <>};
# my $o = Sereal::Splitter->new({chunk_size => 1*1024, input => $content});

# $content = do {local (@ARGV, $/) = ('test32.srl'), <>};
# $o = Sereal::Splitter->new({chunk_size => 1*1024, input => $content});

# print Dumper($o); use Data::Dumper;

# my $chunk = $o->next_chunk();
# # print Dumper($chunk);
# # use Data::Dumper;


pass;
