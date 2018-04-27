#!/bin/sh

# Adapted from Common Vuls DB
# Additional tweaks by John Troony.

#Some Color codes
red="\033[31m"
green="\033[32m"
blue="\033[34m"
normal="\033[0m"

clear

echo -e $blue"Hostname:      $HOSTNAME"$normal
echo -e $blue"Bash Version:  $BASH_VERSION"$normal
echo -e $blue"Machine Type:  $MACHTYPE"$noraml
echo

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

# We use the default system's bash unless there is already
# a $TESTBASH environment variable present
if [ "$TESTBASH" = "" ] || [ ! -x "$TESTBASH" ]; then
    TESTBASH=/bin/bash
    if [ ! -x $TESTBASH ]; then
        TESTBASH=/usr/bin/bash
        if [ ! -x $TESTBASH ]; then
            echo -e  $red"ERROR: No bash binary to test!"$normal >&2
            exit 1
        fi
    fi
fi

echo -e  $green"Checking vulnerabilities in $TESTBASH"$normal >&2

RUNPATCH=0

## CVE-2014-6271
echo -e "\nChecking for CVE-2014-6271..."
VULNERABLE=0
(
   env 'x=() { :;}; echo vulnerable' 'BASH_FUNC_x()=() { :;}; echo vulnerable' $TESTBASH -c "echo test"
) 2>&1 | grep "vulnerable" >/dev/null 2>/dev/null && VULNERABLE=1

## CVE-2014-6271 (complete patch)
(
   env 'x=() { :;}; echo vulnerable' 'BASH_FUNC_x()=() { :;}; echo vulnerable' $TESTBASH -c "echo test"
) 2>&1 | grep "bash: error importing function definition for 'x'" >/dev/null 2>/dev/null && VULNERABLE=1

if [ ${VULNERABLE} -eq 1 ]; then
    echo -e  $red"vulnerable to CVE-2014-6271"$normal >&2
    V6271=1
    RUNPATCH=1
else
    V6271=0
    echo -e  $blue"not vulnerable to CVE-2014-6271"$normal >&2
    :
fi

## CVE-2014-7169
echo -e "\nChecking for CVE-2014-7169..."
cd /tmp
rm -f echo
env -i  X='() { (a)=>\' $TESTBASH -c 'echo date' >/dev/null 2>/dev/null #'
if [ -f echo ]; then
    echo -e  $red"vulnerable to CVE-2014-7169"$normal >&2
    V7169=1
    RUNPATCH=1
    rm -f echo
else
    V7169=0
    echo -e  $blue"not vulnerable to CVE-2014-7169"$normal >&2
fi

## CVE-2014-7186
## I've tested in my unpatched CentOS 6.5 Server and it causes a segment fault if CPU is in uprotected mode.
echo -e "\nChecking for CVE-2014-7186..."
if $TESTBASH -c 'ulimit -c 0; true <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF' 2>/dev/null
then
    echo -e  $blue"not vulnerable to CVE-2014-7186"$normal >&2
    V7186=0
else
    echo -e  $red"vulnerable to CVE-2014-7186"$normal >&2
    V7186=1
    RUNPATCH=1
fi

## CVE-2014-7187
echo -e "\nChecking for  CVE-2014-7187..."
perl -e 'for my $x (1..200) { print "for x$x in ; do :\n"; } for my $x (1..200) { print "done\n" }' > /tmp/test_script.$$.sh
if $TESTBASH /tmp/test_script.$$.sh 2>/dev/null >/dev/null; then
    echo -e  $blue"not vulnerable to CVE-2014-7187"$normal >&2
    V7187=0
else
    echo -e  $red"vulnerable to CVE-2014-7187"$normal >&2
    V7187=1
    RUNPATCH=1
fi

EXITCODE=1
echo
if [ ${RUNPATCH} = 1 ]; then
    # Check OS version

    echo -e  $red"$TESTBASH has some vulns that requires patching."$normal >&2
    case `gvquery -p os_dist 2> /dev/null` in
        solaris*)
            if [ "$V6271 $V7169 $V7186 $V7187" = "0 0 0 1" ]; then
                echo -e  $green"Oracle does not have a patch for CVE-2014-7187 yet for this OS"$normal >&2
                EXITCODE=0
            fi
            ;;
        *)
            :
            ;;
    esac
else
    echo -e  $green"$TESTBASH does not have any known shellshock-related vulnerabilities."$normal >&2
    EXITCODE=0
fi
echo -e $blue"NB: This script checks for common identified vulns only.. Please check online for more updated details"$normal
exit $EXITCODE
