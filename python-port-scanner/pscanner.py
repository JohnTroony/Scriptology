#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Created on Feb 3 02:41:11 2013

@author: John Troon
@email: ombagi <at> promaxted.com
@blog: www.promaxted.com
""" 
import os
import optparse
from socket import *                                        



def helper():
    os.system('clear')
    print "\nSet Host and port(s) before scan!"
    print "Use -h or --help for usage"
    print "=================================="
    exit(0)

def ranges(port_list, our_target) :
    
    a = port_list[0]
    b = port_list[1]
    port = 0
    for port in range( int(a) , int(b) ):
        try:
            socks = socket(AF_INET, SOCK_STREAM)
            socks.connect((our_target, port)); 
            print "[+] PORT : ", port," OPEN"
        except: 
            pass

def scan(thePort,our_target) :
    try:
        socks = socket(AF_INET, SOCK_STREAM)
        socks.connect((our_target, int(thePort))); 
        print "[+] PORT : ", int(thePort)," OPEN"
    except: 
        pass




def main():
    print "=============================="
    print "   Simple  Port scanner       "
    print "=============================="
    """The main function that accepts and sanitize the input options from the user and then calls other functions"""
    
    parser = optparse.OptionParser("%prog "+"-t <target> -p <port> -r <port range 1-65500> ")
    parser.add_option('-t', dest='Target_host', type='string', help='specify target to scan')
    parser.add_option('-p', dest='port', type='string', help='specify a port to scan')
    parser.add_option('-r', dest='range', type='string', help='specify a range of ports to scan')

    (options, args) = parser.parse_args()
    
    host_target = options.Target_host
    port = options.port
    port_range = options.range
    
        
    
    try:
        if (host_target == None):
            helper()
            
        if (port_range == None and port ==None):
            helper()
        
        if (port_range != None):
            port_range = str(port_range).split('-')
            
            
            ranges(port_range, host_target)
        else:
             scan(port, host_target)
    
       
    except Exception as e:
        print "Error main() : "+ str(e)

	

		
if __name__ == '__main__': 
     main()
