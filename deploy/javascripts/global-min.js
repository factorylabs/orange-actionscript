var swfobject=function(){var aq="undefined",aD="object",ab="Shockwave Flash",X="ShockwaveFlash.ShockwaveFlash",aE="application/x-shockwave-flash",ac="SWFObjectExprInst",ax="onreadystatechange",af=window,aL=document,aB=navigator,aa=false,Z=[aN],aG=[],ag=[],al=[],aJ,ad,ap,at,ak=false,aU=false,aH,an,aI=true,ah=function(){var a=typeof aL.getElementById!=aq&&typeof aL.getElementsByTagName!=aq&&typeof aL.createElement!=aq,e=aB.userAgent.toLowerCase(),c=aB.platform.toLowerCase(),h=c?/win/.test(c):/win/.test(e),j=c?/mac/.test(c):/mac/.test(e),g=/webkit/.test(e)?parseFloat(e.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,"$1")):false,d=!+"\v1",f=[0,0,0],k=null;if(typeof aB.plugins!=aq&&typeof aB.plugins[ab]==aD){k=aB.plugins[ab].description;if(k&&!(typeof aB.mimeTypes!=aq&&aB.mimeTypes[aE]&&!aB.mimeTypes[aE].enabledPlugin)){aa=true;d=false;k=k.replace(/^.*\s+(\S+\s+\S+$)/,"$1");f[0]=parseInt(k.replace(/^(.*)\..*$/,"$1"),10);f[1]=parseInt(k.replace(/^.*\.(.*)\s.*$/,"$1"),10);f[2]=/[a-zA-Z]/.test(k)?parseInt(k.replace(/^.*[a-zA-Z]+(.*)$/,"$1"),10):0}}else{if(typeof af.ActiveXObject!=aq){try{var i=new ActiveXObject(X);if(i){k=i.GetVariable("$version");if(k){d=true;k=k.split(" ")[1].split(",");f=[parseInt(k[0],10),parseInt(k[1],10),parseInt(k[2],10)]}}}catch(b){}}}return{w3:a,pv:f,wk:g,ie:d,win:h,mac:j}}(),aK=function(){if(!ah.w3){return}if((typeof aL.readyState!=aq&&aL.readyState=="complete")||(typeof aL.readyState==aq&&(aL.getElementsByTagName("body")[0]||aL.body))){aP()}if(!ak){if(typeof aL.addEventListener!=aq){aL.addEventListener("DOMContentLoaded",aP,false)}if(ah.ie&&ah.win){aL.attachEvent(ax,function(){if(aL.readyState=="complete"){aL.detachEvent(ax,arguments.callee);aP()}});if(af==top){(function(){if(ak){return}try{aL.documentElement.doScroll("left")}catch(a){setTimeout(arguments.callee,0);return}aP()})()}}if(ah.wk){(function(){if(ak){return}if(!/loaded|complete/.test(aL.readyState)){setTimeout(arguments.callee,0);return}aP()})()}aC(aP)}}();function aP(){if(ak){return}try{var b=aL.getElementsByTagName("body")[0].appendChild(ar("span"));b.parentNode.removeChild(b)}catch(a){return}ak=true;var d=Z.length;for(var c=0;c<d;c++){Z[c]()}}function aj(a){if(ak){a()}else{Z[Z.length]=a}}function aC(a){if(typeof af.addEventListener!=aq){af.addEventListener("load",a,false)}else{if(typeof aL.addEventListener!=aq){aL.addEventListener("load",a,false)}else{if(typeof af.attachEvent!=aq){aM(af,"onload",a)}else{if(typeof af.onload=="function"){var b=af.onload;af.onload=function(){b();a()}}else{af.onload=a}}}}}function aN(){if(aa){Y()}else{am()}}function Y(){var d=aL.getElementsByTagName("body")[0];var b=ar(aD);b.setAttribute("type",aE);var a=d.appendChild(b);if(a){var c=0;(function(){if(typeof a.GetVariable!=aq){var e=a.GetVariable("$version");if(e){e=e.split(" ")[1].split(",");ah.pv=[parseInt(e[0],10),parseInt(e[1],10),parseInt(e[2],10)]}}else{if(c<10){c++;setTimeout(arguments.callee,10);return}}d.removeChild(b);a=null;am()})()}else{am()}}function am(){var g=aG.length;if(g>0){for(var h=0;h<g;h++){var c=aG[h].id;var l=aG[h].callbackFn;var a={success:false,id:c};if(ah.pv[0]>0){var i=aS(c);if(i){if(ao(aG[h].swfVersion)&&!(ah.wk&&ah.wk<312)){ay(c,true);if(l){a.success=true;a.ref=av(c);l(a)}}else{if(aG[h].expressInstall&&au()){var e={};e.data=aG[h].expressInstall;e.width=i.getAttribute("width")||"0";e.height=i.getAttribute("height")||"0";if(i.getAttribute("class")){e.styleclass=i.getAttribute("class")}if(i.getAttribute("align")){e.align=i.getAttribute("align")}var f={};var d=i.getElementsByTagName("param");var k=d.length;for(var j=0;j<k;j++){if(d[j].getAttribute("name").toLowerCase()!="movie"){f[d[j].getAttribute("name")]=d[j].getAttribute("value")}}ae(e,f,c,l)}else{aF(i);if(l){l(a)}}}}}else{ay(c,true);if(l){var b=av(c);if(b&&typeof b.SetVariable!=aq){a.success=true;a.ref=b}l(a)}}}}}function av(b){var d=null;var c=aS(b);if(c&&c.nodeName=="OBJECT"){if(typeof c.SetVariable!=aq){d=c}else{var a=c.getElementsByTagName(aD)[0];if(a){d=a}}}return d}function au(){return !aU&&ao("6.0.65")&&(ah.win||ah.mac)&&!(ah.wk&&ah.wk<312)}function ae(f,d,h,e){aU=true;ap=e||null;at={success:false,id:h};var a=aS(h);if(a){if(a.nodeName=="OBJECT"){aJ=aO(a);ad=null}else{aJ=a;ad=h}f.id=ac;if(typeof f.width==aq||(!/%$/.test(f.width)&&parseInt(f.width,10)<310)){f.width="310"}if(typeof f.height==aq||(!/%$/.test(f.height)&&parseInt(f.height,10)<137)){f.height="137"}aL.title=aL.title.slice(0,47)+" - Flash Player Installation";var b=ah.ie&&ah.win?"ActiveX":"PlugIn",c="MMredirectURL="+af.location.toString().replace(/&/g,"%26")+"&MMplayerType="+b+"&MMdoctitle="+aL.title;if(typeof d.flashvars!=aq){d.flashvars+="&"+c}else{d.flashvars=c}if(ah.ie&&ah.win&&a.readyState!=4){var g=ar("div");h+="SWFObjectNew";g.setAttribute("id",h);a.parentNode.insertBefore(g,a);a.style.display="none";(function(){if(a.readyState==4){a.parentNode.removeChild(a)}else{setTimeout(arguments.callee,10)}})()}aA(f,d,h)}}function aF(a){if(ah.ie&&ah.win&&a.readyState!=4){var b=ar("div");a.parentNode.insertBefore(b,a);b.parentNode.replaceChild(aO(a),b);a.style.display="none";(function(){if(a.readyState==4){a.parentNode.removeChild(a)}else{setTimeout(arguments.callee,10)}})()}else{a.parentNode.replaceChild(aO(a),a)}}function aO(b){var d=ar("div");if(ah.win&&ah.ie){d.innerHTML=b.innerHTML}else{var e=b.getElementsByTagName(aD)[0];if(e){var a=e.childNodes;if(a){var f=a.length;for(var c=0;c<f;c++){if(!(a[c].nodeType==1&&a[c].nodeName=="PARAM")&&!(a[c].nodeType==8)){d.appendChild(a[c].cloneNode(true))}}}}}return d}function aA(e,g,c){var d,a=aS(c);if(ah.wk&&ah.wk<312){return d}if(a){if(typeof e.id==aq){e.id=c}if(ah.ie&&ah.win){var f="";for(var i in e){if(e[i]!=Object.prototype[i]){if(i.toLowerCase()=="data"){g.movie=e[i]}else{if(i.toLowerCase()=="styleclass"){f+=' class="'+e[i]+'"'}else{if(i.toLowerCase()!="classid"){f+=" "+i+'="'+e[i]+'"'}}}}}var h="";for(var j in g){if(g[j]!=Object.prototype[j]){h+='<param name="'+j+'" value="'+g[j]+'" />'}}a.outerHTML='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'+f+">"+h+"</object>";ag[ag.length]=e.id;d=aS(e.id)}else{var b=ar(aD);b.setAttribute("type",aE);for(var k in e){if(e[k]!=Object.prototype[k]){if(k.toLowerCase()=="styleclass"){b.setAttribute("class",e[k])}else{if(k.toLowerCase()!="classid"){b.setAttribute(k,e[k])}}}}for(var l in g){if(g[l]!=Object.prototype[l]&&l.toLowerCase()!="movie"){aQ(b,l,g[l])}}a.parentNode.replaceChild(b,a);d=b}}return d}function aQ(b,d,c){var a=ar("param");a.setAttribute("name",d);a.setAttribute("value",c);b.appendChild(a)}function aw(a){var b=aS(a);if(b&&b.nodeName=="OBJECT"){if(ah.ie&&ah.win){b.style.display="none";(function(){if(b.readyState==4){aT(a)}else{setTimeout(arguments.callee,10)}})()}else{b.parentNode.removeChild(b)}}}function aT(a){var b=aS(a);if(b){for(var c in b){if(typeof b[c]=="function"){b[c]=null}}b.parentNode.removeChild(b)}}function aS(a){var c=null;try{c=aL.getElementById(a)}catch(b){}return c}function ar(a){return aL.createElement(a)}function aM(a,c,b){a.attachEvent(c,b);al[al.length]=[a,c,b]}function ao(a){var b=ah.pv,c=a.split(".");c[0]=parseInt(c[0],10);c[1]=parseInt(c[1],10)||0;c[2]=parseInt(c[2],10)||0;return(b[0]>c[0]||(b[0]==c[0]&&b[1]>c[1])||(b[0]==c[0]&&b[1]==c[1]&&b[2]>=c[2]))?true:false}function az(b,f,a,c){if(ah.ie&&ah.mac){return}var e=aL.getElementsByTagName("head")[0];if(!e){return}var g=(a&&typeof a=="string")?a:"screen";if(c){aH=null;an=null}if(!aH||an!=g){var d=ar("style");d.setAttribute("type","text/css");d.setAttribute("media",g);aH=e.appendChild(d);if(ah.ie&&ah.win&&typeof aL.styleSheets!=aq&&aL.styleSheets.length>0){aH=aL.styleSheets[aL.styleSheets.length-1]}an=g}if(ah.ie&&ah.win){if(aH&&typeof aH.addRule==aD){aH.addRule(b,f)}}else{if(aH&&typeof aL.createTextNode!=aq){aH.appendChild(aL.createTextNode(b+" {"+f+"}"))}}}function ay(a,c){if(!aI){return}var b=c?"visible":"hidden";if(ak&&aS(a)){aS(a).style.visibility=b}else{az("#"+a,"visibility:"+b)}}function ai(b){var a=/[\\\"<>\.;]/;var c=a.exec(b)!=null;return c&&typeof encodeURIComponent!=aq?encodeURIComponent(b):b}var aR=function(){if(ah.ie&&ah.win){window.attachEvent("onunload",function(){var a=al.length;for(var b=0;b<a;b++){al[b][0].detachEvent(al[b][1],al[b][2])}var d=ag.length;for(var c=0;c<d;c++){aw(ag[c])}for(var e in ah){ah[e]=null}ah=null;for(var f in swfobject){swfobject[f]=null}swfobject=null})}}();return{registerObject:function(a,e,c,b){if(ah.w3&&a&&e){var d={};d.id=a;d.swfVersion=e;d.expressInstall=c;d.callbackFn=b;aG[aG.length]=d;ay(a,false)}else{if(b){b({success:false,id:a})}}},getObjectById:function(a){if(ah.w3){return av(a)}},embedSWF:function(k,e,h,f,c,a,b,i,g,j){var d={success:false,id:e};if(ah.w3&&!(ah.wk&&ah.wk<312)&&k&&e&&h&&f&&c){ay(e,false);aj(function(){h+="";f+="";var q={};if(g&&typeof g===aD){for(var o in g){q[o]=g[o]}}q.data=k;q.width=h;q.height=f;var n={};if(i&&typeof i===aD){for(var p in i){n[p]=i[p]}}if(b&&typeof b===aD){for(var l in b){if(typeof n.flashvars!=aq){n.flashvars+="&"+l+"="+b[l]}else{n.flashvars=l+"="+b[l]}}}if(ao(c)){var m=aA(q,n,e);if(q.id==e){ay(e,true)}d.success=true;d.ref=m}else{if(a&&au()){q.data=a;ae(q,n,e,j);return}else{ay(e,true)}}if(j){j(d)}})}else{if(j){j(d)}}},switchOffAutoHideShow:function(){aI=false},ua:ah,getFlashPlayerVersion:function(){return{major:ah.pv[0],minor:ah.pv[1],release:ah.pv[2]}},hasFlashPlayerVersion:ao,createSWF:function(a,b,c){if(ah.w3){return aA(a,b,c)}else{return undefined}},showExpressInstall:function(b,a,d,c){if(ah.w3&&au()){ae(b,a,d,c)}},removeSWF:function(a){if(ah.w3){aw(a)}},createCSS:function(b,a,c,d){if(ah.w3){az(b,a,c,d)}},addDomLoadEvent:aj,addLoadEvent:aC,getQueryParamValue:function(b){var a=aL.location.search||aL.location.hash;if(a){if(/\?/.test(a)){a=a.split("?")[1]}if(b==null){return ai(a)}var c=a.split("&");for(var d=0;d<c.length;d++){if(c[d].substring(0,c[d].indexOf("="))==b){return ai(c[d].substring((c[d].indexOf("=")+1)))}}}return""},expressInstallCallback:function(){if(aU){var a=aS(ac);if(a&&aJ){a.parentNode.replaceChild(aJ,a);if(ad){ay(ad,true);if(ah.ie&&ah.win){aJ.style.display="block"}}if(ap){ap(at)}}aU=false}}}}();if(typeof asual=="undefined"){var asual={}}if(typeof asual.util=="undefined"){asual.util={}}asual.util.Browser=new function(){var g=navigator.userAgent.toLowerCase(),h=/webkit/.test(g),j=/opera/.test(g),l=/msie/.test(g)&&!/opera/.test(g),k=/mozilla/.test(g)&&!/(compatible|webkit)/.test(g),i=parseFloat(l?g.substr(g.indexOf("msie")+4):(g.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/)||[0,"0"])[1]);this.toString=function(){return"[class Browser]"};this.getVersion=function(){return i};this.isMSIE=function(){return l};this.isSafari=function(){return h};this.isOpera=function(){return j};this.isMozilla=function(){return k}};asual.util.Events=new function(){var t="DOMContentLoaded",m="onstop",l=window,o=document,u=[],v=asual.util,r=v.Browser,s=r.isMSIE(),p=r.isSafari();this.toString=function(){return"[class Events]"};this.addListener=function(c,b,a){u.push({o:c,t:b,l:a});if(!(b==t&&(s||p))){if(c.addEventListener){c.addEventListener(b,a,false)}else{if(c.attachEvent){c.attachEvent("on"+b,a)}}}};this.removeListener=function(c,a,e){for(var b=0,d;d=u[b];b++){if(d.o==c&&d.t==a&&d.l==e){u.splice(b,1);break}}if(!(a==t&&(s||p))){if(c.removeEventListener){c.removeEventListener(a,e,false)}else{if(c.detachEvent){c.detachEvent("on"+a,e)}}}};var n=function(){for(var a=0,b;b=u[a];a++){if(b.t!=t){v.Events.removeListener(b.o,b.t,b.l)}}};var q=function(){if(o.readyState=="interactive"){function a(){o.detachEvent(m,a);n()}o.attachEvent(m,a);l.setTimeout(function(){o.detachEvent(m,a)},0)}};if(s||p){(function(){try{if((s&&o.body)||!/loaded|complete/.test(o.readyState)){o.documentElement.doScroll("left")}}catch(a){return setTimeout(arguments.callee,0)}for(var b=0,a;a=u[b];b++){if(a.t==t){a.l.call(null)}}})()}if(s){l.attachEvent("onbeforeunload",q)}this.addListener(l,"unload",n)};asual.util.Functions=new function(){this.toString=function(){return"[class Functions]"};this.bind=function(i,g,j){for(var l=2,k,h=[];k=arguments[l];l++){h.push(k)}return function(){return i.apply(g,h)}}};var SWFAddressEvent=function(g){this.toString=function(){return"[object SWFAddressEvent]"};this.type=g;this.target=[SWFAddress][0];this.value=SWFAddress.getValue();this.path=SWFAddress.getPath();this.pathNames=SWFAddress.getPathNames();this.parameters={};var h=SWFAddress.getParameterNames();for(var e=0,f=h.length;e<f;e++){this.parameters[h[e]]=SWFAddress.getParameter(h[e])}this.parameterNames=h};SWFAddressEvent.INIT="init";SWFAddressEvent.CHANGE="change";SWFAddressEvent.INTERNAL_CHANGE="internalChange";SWFAddressEvent.EXTERNAL_CHANGE="externalChange";var SWFAddress=new function(){var _getHash=function(){var index=_l.href.indexOf("#");return index!=-1?_ec(_dc(_l.href.substr(index+1))):""};var _getWindow=function(){try{top.document;return top}catch(e){return window}};var _strictCheck=function(value,force){if(_opts.strict){value=force?(value.substr(0,1)!="/"?"/"+value:value):(value==""?"/":value)}return value};var _ieLocal=function(value,direction){return(_msie&&_l.protocol=="file:")?(direction?_value.replace(/\?/,"%3F"):_value.replace(/%253F/,"?")):value};var _searchScript=function(el){if(el.childNodes){for(var i=0,l=el.childNodes.length,s;i<l;i++){if(el.childNodes[i].src){_url=String(el.childNodes[i].src)}if(s=_searchScript(el.childNodes[i])){return s}}}};var _titleCheck=function(){if(_d.title!=_title&&_d.title.indexOf("#")!=-1){_d.title=_title}};var _listen=function(){if(!_silent){var hash=_getHash();var diff=!(_value==hash);if(_safari&&_version<523){if(_length!=_h.length){_length=_h.length;if(typeof _stack[_length-1]!=UNDEFINED){_value=_stack[_length-1]}_update.call(this,false)}}else{if(_msie&&diff){if(_version<7){_l.reload()}else{this.setValue(hash)}}else{if(diff){_value=hash;_update.call(this,false)}}}if(_msie){_titleCheck.call(this)}}};var _bodyClick=function(e){if(_popup.length>0){var popup=window.open(_popup[0],_popup[1],eval(_popup[2]));if(typeof _popup[3]!=UNDEFINED){eval(_popup[3])}}_popup=[]};var _swfChange=function(){for(var i=0,id,obj,value=SWFAddress.getValue(),setter="setSWFAddressValue";id=_ids[i];i++){obj=document.getElementById(id);if(obj){if(obj.parentNode&&typeof obj.parentNode.so!=UNDEFINED){obj.parentNode.so.call(setter,value)}else{if(!(obj&&typeof obj[setter]!=UNDEFINED)){var objects=obj.getElementsByTagName("object");var embeds=obj.getElementsByTagName("embed");obj=((objects[0]&&typeof objects[0][setter]!=UNDEFINED)?objects[0]:((embeds[0]&&typeof embeds[0][setter]!=UNDEFINED)?embeds[0]:null))}if(obj){obj[setter](value)}}}else{if(obj=document[id]){if(typeof obj[setter]!=UNDEFINED){obj[setter](value)}}}}};var _jsDispatch=function(type){this.dispatchEvent(new SWFAddressEvent(type));type=type.substr(0,1).toUpperCase()+type.substr(1);if(typeof this["on"+type]==FUNCTION){this["on"+type]()}};var _jsInit=function(){if(_util.Browser.isSafari()){_d.body.addEventListener("click",_bodyClick)}_jsDispatch.call(this,"init")};var _jsChange=function(){_swfChange();_jsDispatch.call(this,"change")};var _update=function(internal){_jsChange.call(this);if(internal){_jsDispatch.call(this,"internalChange")}else{_jsDispatch.call(this,"externalChange")}_st(_functions.bind(_track,this),10)};var _track=function(){var value=(_l.pathname+(/\/$/.test(_l.pathname)?"":"/")+this.getValue()).replace(/\/\//,"/").replace(/^\/$/,"");var fn=_t[_opts.tracker];if(typeof fn==FUNCTION){fn(value)}else{if(typeof _t.pageTracker!=UNDEFINED&&typeof _t.pageTracker._trackPageview==FUNCTION){_t.pageTracker._trackPageview(value)}else{if(typeof _t.urchinTracker==FUNCTION){_t.urchinTracker(value)}}}};var _htmlWrite=function(){var doc=_frame.contentWindow.document;doc.open();doc.write("<html><head><title>"+_d.title+"</title><script>var "+ID+' = "'+_getHash()+'";<\/script></head></html>');doc.close()};var _htmlLoad=function(){var win=_frame.contentWindow;var src=win.location.href;_value=(typeof win[ID]!=UNDEFINED?win[ID]:"");if(_value!=_getHash()){_update.call(SWFAddress,false);_l.hash=_ieLocal(_value,TRUE)}};var _load=function(){if(!_loaded){_loaded=TRUE;if(_msie&&_version<8){var frameset=_d.getElementsByTagName("frameset")[0];_frame=_d.createElement((frameset?"":"i")+"frame");if(frameset){frameset.insertAdjacentElement("beforeEnd",_frame);frameset[frameset.cols?"cols":"rows"]+=",0";_frame.src="javascript:false";_frame.noResize=true;_frame.frameBorder=_frame.frameSpacing=0}else{_frame.src="javascript:false";_frame.style.display="none";_d.body.insertAdjacentElement("afterBegin",_frame)}_st(function(){_events.addListener(_frame,"load",_htmlLoad);if(typeof _frame.contentWindow[ID]==UNDEFINED){_htmlWrite()}},50)}else{if(_safari){if(_version<418){_d.body.innerHTML+='<form id="'+ID+'" style="position:absolute;top:-9999px;" method="get"></form>';_form=_d.getElementById(ID)}if(typeof _l[ID]==UNDEFINED){_l[ID]={}}if(typeof _l[ID][_l.pathname]!=UNDEFINED){_stack=_l[ID][_l.pathname].split(",")}}}_st(_functions.bind(function(){_jsInit.call(this);_jsChange.call(this);_track.call(this)},this),1);if(_msie&&_version>=8){_d.body.onhashchange=_functions.bind(_listen,this);_si(_functions.bind(_titleCheck,this),50)}else{_si(_functions.bind(_listen,this),50)}}};var ID="swfaddress",FUNCTION="function",UNDEFINED="undefined",TRUE=true,FALSE=false,_util=asual.util,_browser=_util.Browser,_events=_util.Events,_functions=_util.Functions,_version=_browser.getVersion(),_msie=_browser.isMSIE(),_mozilla=_browser.isMozilla(),_opera=_browser.isOpera(),_safari=_browser.isSafari(),_supported=FALSE,_t=_getWindow(),_d=_t.document,_h=_t.history,_l=_t.location,_si=setInterval,_st=setTimeout,_dc=decodeURI,_ec=encodeURI,_frame,_form,_url,_title=_d.title,_length=_h.length,_silent=FALSE,_loaded=FALSE,_justset=TRUE,_juststart=TRUE,_ref=this,_stack=[],_ids=[],_popup=[],_listeners={},_value=_getHash(),_opts={history:TRUE,strict:TRUE};if(_msie&&_d.documentMode&&_d.documentMode!=_version){_version=_d.documentMode!=8?7:8}_supported=(_mozilla&&_version>=1)||(_msie&&_version>=6)||(_opera&&_version>=9.5)||(_safari&&_version>=312);if(_supported){if(_opera){history.navigationMode="compatible"}for(var i=1;i<_length;i++){_stack.push("")}_stack.push(_getHash());if(_msie&&_l.hash!=_getHash()){_l.hash="#"+_ieLocal(_getHash(),TRUE)}_searchScript(document);var _qi=_url?_url.indexOf("?"):-1;if(_qi!=-1){var param,params=_url.substr(_qi+1).split("&");for(var i=0,p;p=params[i];i++){param=p.split("=");if(/^(history|strict)$/.test(param[0])){_opts[param[0]]=(isNaN(param[1])?/^(true|yes)$/i.test(param[1]):(parseInt(param[1])!=0))}if(/^tracker$/.test(param[0])){_opts[param[0]]=param[1]}}}if(_msie){_titleCheck.call(this)}if(window==_t){_events.addListener(document,"DOMContentLoaded",_functions.bind(_load,this))}_events.addListener(_t,"load",_functions.bind(_load,this))}else{if((!_supported&&_l.href.indexOf("#")!=-1)||(_safari&&_version<418&&_l.href.indexOf("#")!=-1&&_l.search!="")){_d.open();_d.write('<html><head><meta http-equiv="refresh" content="0;url='+_l.href.substr(0,_l.href.indexOf("#"))+'" /></head></html>');_d.close()}else{_track()}}this.toString=function(){return"[class SWFAddress]"};this.back=function(){_h.back()};this.forward=function(){_h.forward()};this.up=function(){var path=this.getPath();this.setValue(path.substr(0,path.lastIndexOf("/",path.length-2)+(path.substr(path.length-1)=="/"?1:0)))};this.go=function(delta){_h.go(delta)};this.href=function(url,target){target=typeof target!=UNDEFINED?target:"_self";if(target=="_self"){self.location.href=url}else{if(target=="_top"){_l.href=url}else{if(target=="_blank"){window.open(url)}else{_t.frames[target].location.href=url}}}};this.popup=function(url,name,options,handler){try{var popup=window.open(url,name,eval(options));if(typeof handler!=UNDEFINED){eval(handler)}}catch(ex){}_popup=arguments};this.getIds=function(){return _ids};this.getId=function(index){return _ids[0]};this.setId=function(id){_ids[0]=id};this.addId=function(id){this.removeId(id);_ids.push(id)};this.removeId=function(id){for(var i=0;i<_ids.length;i++){if(id==_ids[i]){_ids.splice(i,1);break}}};this.addEventListener=function(type,listener){if(typeof _listeners[type]==UNDEFINED){_listeners[type]=[]}_listeners[type].push(listener)};this.removeEventListener=function(type,listener){if(typeof _listeners[type]!=UNDEFINED){for(var i=0,l;l=_listeners[type][i];i++){if(l==listener){break}}_listeners[type].splice(i,1)}};this.dispatchEvent=function(event){if(this.hasEventListener(event.type)){event.target=this;for(var i=0,l;l=_listeners[event.type][i];i++){l(event)}return TRUE}return FALSE};this.hasEventListener=function(type){return(typeof _listeners[type]!=UNDEFINED&&_listeners[type].length>0)};this.getBaseURL=function(){var url=_l.href;if(url.indexOf("#")!=-1){url=url.substr(0,url.indexOf("#"))}if(url.substr(url.length-1)=="/"){url=url.substr(0,url.length-1)}return url};this.getStrict=function(){return _opts.strict};this.setStrict=function(strict){_opts.strict=strict};this.getHistory=function(){return _opts.history};this.setHistory=function(history){_opts.history=history};this.getTracker=function(){return _opts.tracker};this.setTracker=function(tracker){_opts.tracker=tracker};this.getTitle=function(){return _d.title};this.setTitle=function(title){if(!_supported){return null}if(typeof title==UNDEFINED){return}if(title=="null"){title=""}title=_dc(title);_st(function(){_title=_d.title=title;if(_juststart&&_frame&&_frame.contentWindow&&_frame.contentWindow.document){_frame.contentWindow.document.title=title;_juststart=FALSE}if(!_justset&&_mozilla){_l.replace(_l.href.indexOf("#")!=-1?_l.href:_l.href+"#")}_justset=FALSE},10)};this.getStatus=function(){return _t.status};this.setStatus=function(status){if(!_supported){return null}if(typeof status==UNDEFINED){return}if(status=="null"){status=""}status=_dc(status);if(!_safari){status=_strictCheck((status!="null")?status:"",TRUE);if(status=="/"){status=""}if(!(/http(s)?:\/\//.test(status))){var index=_l.href.indexOf("#");status=(index==-1?_l.href:_l.href.substr(0,index))+"#"+status}_t.status=status}};this.resetStatus=function(){_t.status=""};this.getValue=function(){if(!_supported){return null}return _dc(_strictCheck(_ieLocal(_value,FALSE),FALSE))};this.setValue=function(value){if(!_supported){return null}if(typeof value==UNDEFINED){return}if(value=="null"){value=""}value=_ec(_dc(_strictCheck(value,TRUE)));if(value=="/"){value=""}if(_value==value){return}_justset=TRUE;_value=value;_silent=TRUE;_update.call(SWFAddress,true);_stack[_h.length]=_value;if(_safari){if(_opts.history){_l[ID][_l.pathname]=_stack.toString();_length=_h.length+1;if(_version<418){if(_l.search==""){_form.action="#"+_value;_form.submit()}}else{if(_version<523||_value==""){var evt=_d.createEvent("MouseEvents");evt.initEvent("click",TRUE,TRUE);var anchor=_d.createElement("a");anchor.href="#"+_value;anchor.dispatchEvent(evt)}else{_l.hash="#"+_value}}}else{_l.replace("#"+_value)}}else{if(_value!=_getHash()){if(_opts.history){_l.hash="#"+_dc(_ieLocal(_value,TRUE))}else{_l.replace("#"+_dc(_value))}}}if((_msie&&_version<8)&&_opts.history){_st(_htmlWrite,50)}if(_safari){_st(function(){_silent=FALSE},1)}else{_silent=FALSE}};this.getPath=function(){var value=this.getValue();if(value.indexOf("?")!=-1){return value.split("?")[0]}else{if(value.indexOf("#")!=-1){return value.split("#")[0]}else{return value}}};this.getPathNames=function(){var path=this.getPath(),names=path.split("/");if(path.substr(0,1)=="/"||path.length==0){names.splice(0,1)}if(path.substr(path.length-1,1)=="/"){names.splice(names.length-1,1)}return names};this.getQueryString=function(){var value=this.getValue(),index=value.indexOf("?");if(index!=-1&&index<value.length){return value.substr(index+1)}};this.getParameter=function(param){var value=this.getValue();var index=value.indexOf("?");if(index!=-1){value=value.substr(index+1);var p,params=value.split("&"),i=params.length,r=[];while(i--){p=params[i].split("=");if(p[0]==param){r.push(p[1])}}if(r.length!=0){return r.length!=1?r:r[0]}}};this.getParameterNames=function(){var value=this.getValue();var index=value.indexOf("?");var names=[];if(index!=-1){value=value.substr(index+1);if(value!=""&&value.indexOf("=")!=-1){var params=value.split("&"),i=0;while(i<params.length){names.push(params[i].split("=")[0]);i++}}}return names};this.onInit=null;this.onChange=null;this.onInternalChange=null;this.onExternalChange=null;(function(){var _args;if(typeof FlashObject!=UNDEFINED){SWFObject=FlashObject}if(typeof SWFObject!=UNDEFINED&&SWFObject.prototype&&SWFObject.prototype.write){var _s1=SWFObject.prototype.write;SWFObject.prototype.write=function(){_args=arguments;if(this.getAttribute("version").major<8){this.addVariable("$swfaddress",SWFAddress.getValue());((typeof _args[0]=="string")?document.getElementById(_args[0]):_args[0]).so=this}var success;if(success=_s1.apply(this,_args)){_ref.addId(this.getAttribute("id"))}return success}}if(typeof swfobject!=UNDEFINED){var _s2r=swfobject.registerObject;swfobject.registerObject=function(){_args=arguments;_s2r.apply(this,_args);_ref.addId(_args[0])};var _s2c=swfobject.createSWF;swfobject.createSWF=function(){_args=arguments;var swf=_s2c.apply(this,_args);if(swf){_ref.addId(_args[0].id)}return swf};var _s2e=swfobject.embedSWF;swfobject.embedSWF=function(){_args=arguments;if(typeof _args[8]==UNDEFINED){_args[8]={}}if(typeof _args[8].id==UNDEFINED){_args[8].id=_args[1]}_s2e.apply(this,_args);_ref.addId(_args[8].id)}}if(typeof UFO!=UNDEFINED){var _u=UFO.create;UFO.create=function(){_args=arguments;_u.apply(this,_args);_ref.addId(_args[0].id)}}if(typeof AC_FL_RunContent!=UNDEFINED){var _a=AC_FL_RunContent;AC_FL_RunContent=function(){_args=arguments;_a.apply(this,_args);for(var i=0,l=_args.length;i<l;i++){if(_args[i]=="id"){_ref.addId(_args[i+1])}}}}})()};var swffit=function(){var j=window,G=document,q=G.getElementsByTagName("html")[0],t=navigator.userAgent.toLowerCase(),b=/webkit/.test(t),n=/msie/.test(t)&&!j.opera,m=/firefox/.test(t)&&!j.opera,u="undefined",y,i,B,f,p,C,g,A,s,x,e;swfobject.createCSS("object","position:absolute");function v(K,N,I,M,H,L,J){var N=(N)?N:x,I=(I)?I:e,M=(M)?M:null,H=(H)?H:null,L=(L||L==null),J=(J||J==null);D({target:K,minWid:N,minHei:I,maxWid:M,maxHei:H,hCenter:L,vCenter:J})}function D(J){var I=function(K,L){return(typeof J[L]!=u)?J[L]:K};f=I(f,"minWid");p=I(p,"minHei");C=I(C,"maxWid");g=I(g,"maxHei");var H=function(K,L){return(J[L]||(K&&typeof J[L]==u))};A=H(A,"hCenter");s=H(s,"vCenter");if(J.target&&(J.target!=B)){B=J.target;swfobject.addDomLoadEvent(l);if(n){swfobject.addLoadEvent(l)}}else{o()}}function l(){if(!q.style.overflowX){E(0,0)}if(!q.style.overflowY){E(0,1)}q.style.height=G.body.style.height="100%";G.body.style.margin=G.body.style.padding=0;var H="width:100%; height:100%";H+=(n)?"; overflow:hidden":"";swfobject.createCSS("#"+B,H);y=G.getElementById(B);y=(y!=u&&m&&/object/.test(y.innerHTML))?G.getElementById(B).getElementsByTagName("object")[0]:y;x=y.width;e=y.height;f=(f)?f:x;p=(p)?p:e;o()}function o(){z();if(!i){swffit.addResizeEvent(z);i=1}}function F(H,I){if(i){swffit.removeResizeEvent(z);i=0;h("top","auto");h("left","auto");h("marginTop",0);h("marginLeft",0);var H=(H)?H:"100%",I=(I)?I:"100%";c(H);k(I);a()}}function a(){if(b){q.focus()}}function w(H,I){var J=(H)?["addEventListener","attachEvent"]:["removeEventListener","detachEvent"];if(j[J[0]]){j[J[0]]("resize",I,false)}else{if(j[J[1]]){j[J[1]]("onresize",I)}}}function c(H){var I=(isNaN(H))?H:H+"px";h("width",I)}function k(I){var H=(isNaN(I))?I:I+"px";h("height",H)}function h(I,H){y.style[I]=H}function z(){var H=(j.innerWidth)?j.innerWidth:G.body.clientWidth,I=(j.innerHeight)?j.innerHeight:G.body.clientHeight;H-=(!n&&I<=p)?18:0;I-=(!n&&H<=f)?18:0;if(C&&H>=C){c(C);d(0,1)}else{if(H>f&&(H<C||!C)){c("100%")}else{c(f)}d(0,0)}if(g&&I>=g){k(g);d(1,1)}else{if(I>p&&(I<g||!g)){k("100%")}else{k(p)}d(1,0)}a()}function d(J,I){var K,H;if(J){K=(I&&s)?"50%":"auto";H=(I&&s)?-(g*0.5)+"px":0;h("top",K);h("marginTop",H)}else{K=(I&&A)?"50%":"auto";H=(I&&A)?-(C*0.5)+"px":0;h("left",K);h("marginLeft",H)}}function E(I,H){var J=(H)?"overflowY":"overflowX";q.style[J]=(I)?"scroll":"auto"}function r(H){var I={target:B,minWid:f,minHei:p,maxWid:C,maxHei:g,hCenter:A,vCenter:s};return I[H]}return{fit:v,configure:D,startFit:o,stopFit:F,getValueOf:r,addResizeEvent:function(H){w(1,H)},removeResizeEvent:function(H){w(0,H)},showScrollH:function(){E(1,0)},showScrollV:function(){E(1,1)}}}();var swfmacmousewheel=function(){if(!swfobject){return null}var c=navigator.userAgent.toLowerCase();var e=navigator.platform.toLowerCase();var f=e?/mac/.test(e):/mac/.test(c);if(!f){return null}var b=[];var d=function(g){var h=0;if(g.wheelDelta){h=g.wheelDelta/120;if(window.opera){h=-h}}else{if(g.detail){h=-g.detail}}if(g.preventDefault){g.preventDefault()}return h};var a=function(h){var j=d(h);var k;for(var g=0;g<b.length;g++){k=swfobject.getObjectById(b[g]);if(typeof(k.externalMouseEvent)=="function"){k.externalMouseEvent(j)}}};return function(){if(window.addEventListener){window.addEventListener("DOMMouseScroll",a,false)}window.onmousewheel=document.onmousewheel=a;return{registerObject:function(g){b[b.length]=g}}}()}();var pagesTracked=0;function trackPage(a){pagesTracked++}function test(b,a){alert("swfengine.js :: test() \n\t tracked pages: "+pagesTracked+"\n\t\targ1: "+b+"\n\t\targ2: "+a)}function SWFEngine(c,d,g,h,j,e,b,i,a,f){this.swfUrl=c;this.elementId=d;this.swfVersion=g;this.dimensions=SWFEngine.checkObject(j);this.flashvarsObj=SWFEngine.checkObject(e);this.parametersObj=SWFEngine.checkObject(b);this.attributeObj=SWFEngine.checkObject(i);this.centerHorizontal=(a==undefined)?false:a;this.centerVertical=(f==undefined)?false:f;if(navigator.appName&&navigator.appName.indexOf("Microsoft")!=-1&&navigator.userAgent.indexOf("Windows")!=-1&&navigator.userAgent.indexOf("Windows 3.1")==-1){document.write('<script type="text/javascript" event="FSCommand(command,args)" for="'+this.attributeObj.id+'"> \n');document.write("SWFEngine.handleFSCommand(command, args);");document.write("<\/script>")}this.createSWF=function(m,q,k,n){var o=SWFEngine.getRandomSeed();this.flashvarsObj.swfEngineId=o;this.flashvarsObj=SWFEngine.addUrlVariables(this.flashvarsObj);SWFEngine.instances[o]=this;swfobject.embedSWF(m,q,this.dimensions.maxWidth,this.dimensions.maxHeight,k,n,this.flashvarsObj,this.parametersObj,this.attributeObj);var p=(this.dimensions.maxWidth=="100%")?null:this.dimensions.maxWidth;var l=(this.dimensions.maxHeight=="100%")?null:this.dimensions.maxHeight;swffit.fit(this.attributeObj.id,this.dimensions.minWidth,this.dimensions.minHeight,p,l,this.centerHorizontal,this.centerVertical);if(swfmacmousewheel!=null){swfmacmousewheel.registerObject(this.attributeObj.id)}};this.resizeSWF=function(l,o,n,m,k,p){swffit.fit(this.attributeObj.id,l,o,n,m,k,p)};this.setBookmark=function(l,k){if(window.sidebar){window.sidebar.addPanel(l,k,"")}else{if(window.external){window.external.AddFavorite(k,l)}else{if(window.opera&&window.print){return true}else{prompt("Create a bookmark and use this URL",k)}}}};this.createSWF(c,d,g,h)}SWFEngine.initialized=false;SWFEngine.instances=new Object();SWFEngine.getInstance=function(a){return SWFEngine.instances[a]};SWFEngine.init=function(){if(SWFEngine.initialized==true){return}SWFEngine.initialized=true};SWFEngine.checkObject=function(a){if(a==undefined){return new Object()}else{return a}};SWFEngine.getRandomSeed=function(){var a=SWFEngine.generateSeed();while(SWFEngine.getInstance(a)!=undefined){a=SWFEngine.generateSeed()}return a};SWFEngine.generateSeed=function(){return Math.round(Math.random()*100000)};SWFEngine.addUrlVariables=function(e){var c=document.location.href;var a=c.substring(c.indexOf("?")+1,c.length).split("&");for(var d=0;d<a.length;d++){var b=a[d];var g=b.substring(0,b.indexOf("="));var f=b.substring(b.indexOf("=")+1,b.length);e[g]=f}return e};SWFEngine.handleFSCommand=function(command){eval(command)};SWFEngine.getInnerSize=function(){var a,b;if(self.innerHeight){a=self.innerWidth;b=self.innerHeight}else{if(document.documentElement&&document.documentElement.clientHeight){a=document.documentElement.clientWidth;b=document.documentElement.clientHeight}else{if(document.body){a=document.body.clientWidth;b=document.body.clientHeight}}}return[a,b]};SWFEngine.resizeViewableArea=function(c,f){var a,g;if(a==undefined){a=window.screenLeft||window.screenX}if(g==undefined){g=window.screenTop||window.screenY}window.moveTo(0,0);window.resizeTo(screen.availWidth,screen.availHeight);var e=SWFEngine.getInnerSize();var d=screen.availWidth-e[0];var b=screen.availHeight-e[1];window.resizeTo(c+d,f+b)};SWFEngine.init();