var express = require('express'), 
	port = 3737,
	app;

app = express();
app.use(express["static"](__dirname + '/examples'));
app.listen(port);

app.post('/kitchen-sink/', function(req, res){
	res.send('JavaScript Validation Passed!')
})
console.log('Listening on port %s', port);
