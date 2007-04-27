#!/usr/bin/perl

use strict;
use FindBin;
use Time::HiRes qw[ usleep ];
use lib "$FindBin::Bin/../lib";

use Device::Arduino::LCD;

my $lcd = Device::Arduino::LCD->new;
$lcd->clear;

my $ret = $lcd->convert_to_char(0,
				[ qw[ . x . x . ] ],
				[ qw[ x . x . x ] ],
				[ qw[ . x . x . ] ],
				[ qw[ x . x . x ] ],
				[ qw[ . x . x . ] ],
				[ qw[ x . x . x ] ],
				[ qw[ . x . x . ] ],
				[ qw[ x . x . x ] ]);

my $ret = $lcd->convert_to_char(1,
				[ qw[ x . x . x ] ],
				[ qw[ . x . x . ] ],
				[ qw[ x . x . x ] ],
				[ qw[ . x . x . ] ],
				[ qw[ x . x . x ] ],
				[ qw[ . x . x . ] ],
				[ qw[ x . x . x ] ],
				[ qw[ . x . x . ] ]);

for (1 .. 10) {
  $lcd->write_ascii(1, 1, 8);
  $lcd->write_ascii(1, 1, 9);
  $lcd->write_ascii(1, 2, 8);
  $lcd->write_ascii(1, 2, 9);
  usleep 100_000;
  $lcd->write_ascii(0, 1, 8);
  $lcd->write_ascii(0, 1, 9);
  $lcd->write_ascii(0, 2, 8);
  $lcd->write_ascii(0, 2, 9);
  usleep 100_000;
}

