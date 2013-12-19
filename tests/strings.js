var Valid8r = require("../dist/valid8r.js")
var assert = require("assert")

v = new Valid8r({
	rules: {
		len_test: {
			rules:[
				{rule:"len", min: 3, max:5}
			]
		},
		alpha_test: {
			rules:[
				{rule:"isAlpha"}
			]
		},
		num_test: {
			rules:[
				{rule:"isNum"}
			]
		},
		nonneg_num_test: {
			rules:[
				{rule:"isNum", nonNeg: true}
			]
		},
		alnum_test: {
			rules:[
				{rule:"isAlnum"}
			]
		},
		format_test: {
			rules:[
				{ rule:"formattedAs", "format":"DD/DD/DDDD" }
			]
		},
		regex_test: {
			rules: [
				{"rule":"regex", pattern:"[A-z0-9.-]{2,7}", modifiers:"i"}
			]
		}
	}
});

describe('Valid8r Strings', function(){

	describe('len', function(){
		it('should return an error when the length of value is less than rule.min', function(done){
			v.validate("len_test", "a", function(field, err) {
				if (!err) throw new Error('Min Length Rule Failed');
				done();
			})

		})
		it('should return an error when the length of value is greater than rule.max', function(done){
			v.validate("len_test", "aaaaaa", function(field, err){
				if (!err) throw new Error('Max Length Rule Failed');
				else done();
			})
		});
		it('should return a blank string when the length of value is between rule.min and rule.max', function(done){
			v.validate("len_test", "aaaaa", function(field, err){
				if (err) throw new Error(err);
				else done();
			})
		});
	})
	describe('alpha', function(){
		it('should return an error when value contains non alphabetic characters.', function(done){
			v.validate("alpha_test", ".", function(field, err) {
				if (!err) throw new Error('Alpha Rule Failed');
				done();
			})

		})
		it('should return a blank string when value contains only alphabetic characters', function(done){
			v.validate("alpha_test", "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", function(field, err){
				if (err) throw new Error(err);
				else done();
			})
		});
	})
	describe('num', function(){
		it('should return an error when value contains non numeric characters', function(done){
			v.validate("num_test", "z", function(field, err) {
				if (!err) throw new Error('Num Rule Failed');
				done();
			})

		})
		it('should return a blank string when value contains only numeric characters', function(done){
			v.validate("num_test", "-1234567890", function(field, err){
				if (err) throw new Error(err);
				else done();
			})
		});
		it('should return an error when negative numbers given with rule.nonNeg=true', function(done){
			v.validate("nonneg_num_test", "-5", function(field, err){
				if (!err) throw new Error('Non-Negative Num Failed');
				else done();
			})
		});
		it('should return a blank string when a non-negative number is given with rule.nonNeg=true', function(done){
			v.validate("nonneg_num_test", "5", function(field, err){
				if (err) throw new Error(err);
				else done();
			})
		});

	})

	describe('alnum', function(){
		it('should return an error when value contains non alpha-numeric characters', function(done){
			v.validate("alnum_test", ".", function(field, err) {
				if (!err) throw new Error('Alnum Rule Failed');
				done();
			})

		})
		it('should return a blank string when value contains only alpha-numeric characters', function(done){
			v.validate("alnum_test", "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890", function(field, err){
				if (err) throw new Error(err);
				else done();
			})
		});
	})

	describe('formatted_as', function(){
		it('should return an error when value does not match rule.format', function(done){
			v.validate("format_test", "99/99/999", function(field, err) {
				if (!err) throw new Error('Formatted As DD/DD/DDDD Rule Failed');
				done();
			})

		})
		it('should return a blank string when value matches rule.format', function(done){
			v.validate("format_test", "12/12/2012", function(field, err){
				if (err) throw new Error(err);
				done();
			})
		});
	})
	describe('regex', function(){
		it('should return an error when value does not match rule.regex', function(done){
			v.validate("regex_test", "****", function(field, err) {
				if (!err) throw new Error('Regex Rule Failed');
				done();
			})

		})
		it('should return a blank string when value matches rule.regex', function(done){
			v.validate("regex_test", "abc", function(field, err){
				if (err) throw new Error(err);
				done();
			})
		});
	})


})
