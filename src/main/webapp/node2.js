/**
 * 
 */
var con = require("http");
/* url 객체를 만드는 코드 */
var url = require("url");
//console.log(url);
var astring = require("querystring");
var server = con.createServer(function(req, res) {
	//var code = url.parse(req.con);
	//console.log(code);
	//console.log(code.search);
	res.writeHead(200,{'content-type':'text/html'});
	var word = astring.parse(req.url);
	console.log(word)
	console.log(word["?/mid="]);
	//console.log(word[1]);
	res.end(word["?/mid"]);
})
server.listen(9090,function(){
	console.log("Web Socket Server");
})