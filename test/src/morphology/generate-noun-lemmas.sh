#!/bin/bash
# test/src/morphology/generate-noun-lemmas.sh.  Generated from generate-noun-lemmas.sh.in by configure.

# Automake interprets the exit status as follows:
# - an exit status of 0 will denote a success
# - an exit status of 77 a skipped test
# - an exit status of 99 a hard error
# - any other exit status will denote a failure.


# Test that all noun lemmas do generate as themselves:


###### Variables: #######
sourcefile=${srcdir}/../../../src/morphology/stems/nouns.lexc
lemmas=./nouns.txt
generatedlemmas=./gen-nouns
failedlemmas=./fail-noun-lemmas
generatorfile=./../../../src/generator-gt-norm
resultfile=lemma-gen-noun-diff

# FAIL if source file does not exist:
if [ ! -f $sourcefile ]; then
    echo
    echo "*** Warning: Source file $sourcefile not found."
    echo
    exit 77
fi

# Use autotools mechanisms to only run the configured fst types in the tests:
fsttype=
fsttype="$fsttype hfst"
fsttype="$fsttype xfst"

# Exit if both hfst and xerox have been shut off:
if test -z "$fsttype" ; then
    echo "All transducer types have been shut off at configure time."
    echo "Nothing to test. Skipping."
    exit 77
fi

# Get external Mac editor for viewing failed results from configure:
EXTEDITOR=/usr/bin/see

###### Extraction: #######
/Users/rueter/main/gtcore/scripts/extract-lemmas.sh \
	$sourcefile "(CmpN/Last)" > $lemmas

###### Start testing: #######
transducer_found=0
Fail=0

# The script tests both Xerox and Hfst transducers if available:
for f in $fsttype; do
	if [ $f == "xfst" ]; then
		lookuptool="/Users/rueter/bin/lookup -q -flags mbTT"
	elif [ $f == "hfst" ]; then
		lookuptool="/usr/local/bin/hfst-lookup -q"
	else
	    Fail=1
		printf "ERROR: Unknown fst type! "
	    echo "$f - FAIL"
	    continue
	fi
	if [ -f "$generatorfile.$f" ]; then
		let "transducer_found += 1"

###### Test non-compounds: #######
		# generate Masculine Singular Nouns:
		# $lemmas (subsequently $failedlemmas.$f.txt) = lemmas that haven't passed yet
		# $generatedlemmas.$f.tmp.txt = output of generator (replaced for each tagset)
		# $generatedlemmas.$f.txt = cumulative list of lemmas that generate output
		
		# to begin with, all lemmas have failed (i.e. none have passed yet)
		cat $lemmas > $failedlemmas.$f.txt
		
		# loop over tagsets and generate lemmas
		for gender in +Msc +Fem +MFN ; do
		    for number in +Sg +Pl ; do
			for grammcase in +Nom ; do
			    sed 's/$/+N'$gender$number$grammcase'/' $failedlemmas.$f.txt \
				| $lookuptool $generatorfile.$f \
				| cut -f2 > $generatedlemmas.$f.tmp.txt
			    fgrep -v "+N+" $generatedlemmas.$f.tmp.txt | grep -v "^$" \
				| sort -u >> $generatedlemmas.$f.txt
			    fgrep    "+N+" $generatedlemmas.$f.tmp.txt | cut -d'+' -f1 \
				| sort -u  > $failedlemmas.$f.txt
			done
		    done
		done
		sed 's/$/+N+MFN+Pl+Gen/' $failedlemmas.$f.txt \
			| $lookuptool $generatorfile.$f \
			| cut -f2 > $generatedlemmas.$f.tmp.txt
		fgrep -v "+N+" $generatedlemmas.$f.tmp.txt | grep -v "^$" \
			| sort -u >> $generatedlemmas.$f.txt
		fgrep    "+N+" $generatedlemmas.$f.tmp.txt | cut -d'+' -f1 \
			| sort -u  > $failedlemmas.$f.txt

###### Collect results: #######
		# Sort and compare original input with resulting output - the diff is
		# stored and opened in SEE:
		sort -u -o $generatedlemmas.$f.txt $generatedlemmas.$f.txt 
		sed 's/[¹²³⁴⁵⁶⁷⁸⁹⁰⁻]*$//' $lemmas | uniq | sort -u > ./strippednouns.txt
		comm -23 ./strippednouns.txt $generatedlemmas.$f.txt | sort \
		> $resultfile.$f.txt

		# if at least one word is found, the test failed, and the list of failed
		# lemmas is opened in SubEthaEdit:
		if [ -s $resultfile.$f.txt ]; then
			# Only open the failed lemmas in see if /usr/bin/see is defined:
			if [ "$EXTEDITOR" ]; then
				$EXTEDITOR $resultfile.$f.txt
			fi
		    Fail=1
		    echo "$f - FAIL"
		    continue
		fi
	    echo "$f - PASS"
	fi
done

# When done, remove the generated data file:
rm -f $lemmas
rm -r ./strippednouns.txt

# At least one of the Xerox or HFST tests failed:
if [ "$Fail" = "1" ]; then
	exit 1
fi

if [ $transducer_found -eq 0 ]; then
    echo ERROR: No transducer found
    exit 77
fi