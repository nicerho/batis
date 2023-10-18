var con = require("http")
var server = con.createServer(function(req,res){
	res.writeHead(200,{'Content-type':'text/htm'});
	res.end('Server Open');
})
server.listen(9090,function(){
	console.log("test")
})