#!/usr/bin/env python

import PyPDF2

from threading import Thread
from optparse import OptionParser

def crackfile(pdfFile,password):
    try:
        pdfReader = PyPDF2.PdfFileReader(open(pdfFile, 'rb'))
        if pdfReader.decrypt(password) == 1:
            print "password found !! "
            return password
    except (KeyboardInterrupt , SystemExit):
        raise
    except:
        return


def main():
    parser= OptionParser("Specify -f <PDF-file> -w <wordlist> or use --help to print this help message")
    parser.add_option("-f","--file",dest="pdfname",help="specify the PDF file to use.")
    parser.add_option("-w","--wordlist",dest="wordlist",help="specify the wordlist to use.")
    (options, args)= parser.parse_args ()
    if (options.pdfname== None) | (options.wordlist== None):
        print parser.usage
    else:
        pdfname = options.pdfname
        wordlist= options.wordlist
        pfile= open(wordlist)
        for lines in pfile.readlines():
            password=lines.strip("\n")
            res= crackfile(pdfname,password)
            if res:
                print password
                return
            else:
                pass
        else:
            print "Password not found, try another wordlist :)"
            pfile.close()
if __name__=='__main__':
    main()
    
    