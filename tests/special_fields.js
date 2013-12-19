var Valid8r = require("../dist/valid8r.js")
var assert = require("assert")

var v = new Valid8r({
	rules: {
		email_test: {
			rules:[
				{rule:"email"}
			]
		},
		email_rfc5322_test: {
			rules:[
				{rule:"email", validator: 'rfc5322'}
			]
		},
		url_test: {
			rules:[
				{rule:"url"}
			]
		}
	}
});

describe('Valid8r Special Validators', function(){

	describe('email', function(){
		it('should return an error when email is: bob@no.c', function(done){
			v.validate("email_test", 'bob@no.c', function(field, err) {
				if (!err) throw new Error('Email Rule Failed');
				done();
			})

		});
		it('should return an error when email is: .bob@no.com', function(done){
			v.validate("email_test", '.bob@no.com', function(field, err) {
				if (!err) throw new Error('Email Rule Failed');
				done();
			})

		});
		
		it('should return a blank string when a valid email is given', function(done){
			v.validate("email_test", 'elvis@presley.com', function(field, err) {
				if (err) throw new Error(err);
				else done();
			})
		});
		it('should return a blank string when email is: JohnDoe@gmail.com', function(done){
			v.validate("email_test", 'JohnDoe@gmail.com', function(field, err) {
				if (err) throw new Error(err);
				else done();
			})
		});
	});
	
	
	describe('url', function(){
		it('should return an error when an invalid URL is given', function(done){
			v.validate('url_test', 'abc.com', function(field, err){
				console.log('err',err)
				if (!err) throw new Error('Url Rule Failed');
				done();
			})
		});
		
		it('should return a blank string when a valid url is given', function(done){
			v.validate("url_test", 'http://thomporter.com', function(field, err) {
				if (err) throw new Error(err);
				else done();
			})
		});
	});
	
});
