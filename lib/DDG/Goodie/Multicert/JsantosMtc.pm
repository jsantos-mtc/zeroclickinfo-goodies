package DDG::Goodie::Multicert::JsantosMtc;
# ABSTRACT: Write an abstract here
# Start at https://duck.co/duckduckhack/goodie_overview if you are new
# to instant answer development

use DDG::Goodie;

# json stuff
use LWP::Simple;                # From CPAN
use JSON qw( decode_json );     # From CPAN
use Data::Dumper;               # Perl core module
use strict;                     # Good practice
use warnings;                   # Good practice


sub JSONResponse{
    my $trendsurl = "https://graph.facebook.com/?ids=http://www.multicert.com";
    my $json = get( $trendsurl );
    die "Could not get $trendsurl!" unless defined $json;
    
    my $decoded_json = decode_json( $json );

    return $decoded_json->{'http://www.multicert.com'}{'id'}
}
# end of json stuff


zci answer_type => "multicert_jsantos_mtc";
zci is_cached   => 1;

# Metadata.  See https://duck.co/duckduckhack/metadata for help in filling out this section.
name "Multicert JsantosMtc";
description "Succinct explanation of what this instant answer does";
primary_example_queries "first example query", "second example query";
secondary_example_queries "optional -- demonstrate any additional triggers";

# Uncomment and complete: https://duck.co/duckduckhack/metadata#category
# category "";
# Uncomment and complete: https://duck.co/duckduckhack/metadata#topics
# topics "";

code_url "https://github.com/duckduckgo/zeroclickinfo-goodies/blob/master/lib/DDG/Goodie/Multicert/JsantosMtc/JsantosMtc.pm";
attribution github => ["jsantos-mtc", "Friendly Name"], twitter => "norvarius";

# Triggers
triggers startend => "certificate";

# Handle statement
handle remainder => sub {
    return if $_;
    
    $_ =~/^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,}$/g;
    my $address = $1;
    return if !$address;
    
    return JSONResponse;
};

1;
