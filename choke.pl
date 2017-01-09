#!/usr/bin/perl

# Generate random data for webform/application input testing
# Category - fuzzing
# John Troony

if( $#ARGV < 0 or $#ARGV > 1 ) {
	die "Enter output filename";
}


$file=$ARGV[0];
open OUTFILE, ">$file" or
	die "Unable to create $file . Check Permision";




# Produces 1024 * 1024 bytes of data (1 megabyte)
$KILOBYTES=1024;

for( $i = 0; $i<1024; $i++ ) {
	
	# ASCII printable range ("space" and 0x1F)
	my $char = int(rand(95));
	$char = chr($char+32);

	# print 1023 of them, and then a newline.
	print OUTFILE $char x 1023 . "\n";
}

close OUTFILE;
