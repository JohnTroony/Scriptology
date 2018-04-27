/*!CK:3456399669!*//*1408333351,*/

if (self.CavalryLogger) { CavalryLogger.start_js(["ZOTAW"]); }

__d("XSICopyPasteControllerURIBuilder",["XControllerURIBuilder"],function(a,b,c,d,e,f){e.exports=b("XControllerURIBuilder").create("\/si\/content-matcher\/",{text:{type:"String",required:true}});},null);
__d("SICopyPasteUtility",["EventListener","XSICopyPasteControllerURIBuilder"],function(a,b,c,d,e,f,g,h){var i={getSelectedText:function(){var j=null;if(window.getSelection){j=window.getSelection().toString();}else if(document.selection)j=document.selection.createRange().text;return String(j);},setBodyCopyCallback:function(j){g.listen(document.body,'copy',j);},getLoggingURI:function(){return new h().setString('text',i.getSelectedText()).getURI().toString();}};e.exports=i;},null);
__d("SICopyPaste",["AsyncSignal","SICopyPasteUtility"],function(a,b,c,d,e,f,g,h){e.exports={init:function(){h.setBodyCopyCallback(function(){new g(h.getLoggingURI()).send();});}};},null);