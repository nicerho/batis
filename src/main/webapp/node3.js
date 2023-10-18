
//POST
var con = require("http");
var url = require("url");
var aString = require("querystring");
var server = con.createServer(function(req, res) {
	var word = url.parse(req.url, true).pathname;
	var a = "";
	var w;
	if (word == "/") {
		req.on("data", function(data) {
			a = a + data;
			w = a.split("no=")
			console.log(w[1]);
			console.log(a);
		})
		req.on("end", function(data2) {
			res.writeHead(200, { "content-type": 'text/html;charset=utf-8' });
			res.end(`
			<html>
			<head>
			<meta charset="UTF-8">
			<body>
			`+decodeURIComponent(w[1])+`
			</body>
			</head>
			</html>
			`);
		})
	} else if (word == "/test") {
		console.log("test2")
	}
	console.log(word);

	res.writeHead(200, { "content-type": "text/html" });
	res.end("test");
});
server.listen(9090, function() {
	console.log("server Started");
})