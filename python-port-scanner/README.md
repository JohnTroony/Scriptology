Python Port Scanner
===================

A nice simple port scanner written in Python 2.7. It sends SYN packet and waits fro RST to declare port open otherwise the port is closed.

Usage
---------------------

```python
python pscanner.py -t <target> -p <port> -r <port range 1-65500> 
```
Options:
  -h or --help        show this help message and exit
  -t  target 			specify target to scan
  -p port         		specify a port to scan
  -r range       		specify a range of ports to scan 
