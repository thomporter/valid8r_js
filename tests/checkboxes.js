var Valid8r = require("../dist/valid8r.js")
var assert = require("assert")

var v = new Valid8r({
	rules: {
		checks_test: {
			rules:[
				{rule:"checks", min: 2, max:4}
			]
		}
	}
});

describe('Valid8r Checkboxes & Radios', function(){

	describe('min checked', function(){
		it('should return an error when less than rule.min options are checked.', function(done){
			err = v.validate("checks_test", Array('1'));
			if (!err) throw new Error('Min Checked Rule Failed');
			done();
			
		})
		it('should return a blank string when rule.min options are checked', function(done){
			v.validate("checks_test", Array('1','2'), function(field, err) {
				if (err) throw new Error(err);
				else done();
			})
		});
	});

	describe('max checked', function(){
		it('should return an error when more than rule.max options are checked', function(done){
			v.validate("checks_test", Array('1','2','3','4','4'), function(field, err){
				if (!err) throw new Error('Max Val Rule Failed');
				else done();
			})
		});
		it('should return a blank string when rule.max options are checked', function(done){
			v.validate("checks_test", Array('1','2','3','3'), function(field, err) {
				if (err) throw new Error(err);
				else done();
			})
		});
	});
	describe('min/max checked', function(){
		it('should return a blank string when between rule.min and rule.max options are checked', function(done){
			v.validate("checks_test", Array('1','2','3'), function(field, err) {
				if (err) throw new Error(err);
				else done();
			})
		});
	});
});
