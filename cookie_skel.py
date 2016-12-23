# -*- coding: utf-8 -*-
"""
Created on Wed Sep 14 20:49:34 2016

@author: troon
"""

import BaseHTTPServer, SimpleHTTPServer
from http.cookies import SimpleCookie as cookie

class ApplicationRequestHandler(SimpleHTTPServer.BaseHTTPRequestHandler):
 
 sessioncookies = {}

 def __init__(self,*args,**kwargs):
  self.sessionidmorsel = None
  super().__init__(*args,**kwargs)
  
 def _session_cookie(self,forcenew=False):
  cookiestring = "\n".join(self.headers.get_all('Cookie',failobj=[]))
  c = cookie()
  c.load(cookiestring)
  
  try:
   if forcenew or self.sessioncookies[c['session_id'].value]-time() > 3600:
    raise ValueError('new cookie needed')
  except:
   c['session_id']=uuid().hex
  
  for m in c:
   if m=='session_id':
    self.sessioncookies[c[m].value] = time()
    c[m]["httponly"] = True
    c[m]["max-age"] = 3600
    c[m]["expires"] = self.date_time_string(time()+3600)
    self.sessionidmorsel = c[m]
    break
