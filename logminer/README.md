
Log Miner
============================== 

Logminer is simple script written in python 2.7. It searches for a particular string in a text file and writing out results into a separate output file .

The script accepts at-least one option i.e. a string to search in a file (`/var/log/syslog` by default). To print the results on the screen, set verbosity mode to true -v 1 (it's false by default).



### Usage: 

```bash
   logminer -s <search string> -i <input-file> -o <output file> -v <0 non-verbose>
```
  
  Options:
  -h or --help     		show help message and exit
  -i INPUTFILE   		specify File to open (/var/log/syslog)
  -s STRINGX     		specify string to search
  -o OUTPUTFILE  		specify output file (optional)
  -v VERBOSITY   		1 for verbose, 0 for silent (optional)


### Running installer:
   `./installer.sh ``