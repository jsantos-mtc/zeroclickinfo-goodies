#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => "multicert_jsantos_mtc";
zci is_cached   => 1;

ddg_goodie_test(
    [qw(
        DDG::Goodie::Multicert::JsantosMtc
    )],
    'duckduckhack jsantos' => test_zci('ola mkie!'),
    'duckduckhack jsantos is awesome' => undef,
);

done_testing;
