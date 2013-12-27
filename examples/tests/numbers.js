
function getNumbersTestValidator() {
	var v = new Valid8r({
		rules: {
			val_test: {
				rules:[
					{rule:"val", min: 3, max:5}
				]
			},
			val_outside_test: {
				rules:[
					{rule:"val", outside:[10,20]}
				]
			}
		}
	});
	return v;	
}

describe('Valid8r Numbers', function(){

	describe('min val', function(){
		it('should return an error when value is less than rule.min', function(done){
			getNumbersTestValidator().validate("val_test", "2", function(field, err) {
				if (!err) throw new Error('Min Val Rule Failed');
				done();
			});

		});
		it('should return a blank string if value is greater than or equal to rule.min', function(done){
			getNumbersTestValidator().validate("val_test", "3", function(field, err) {
				if (err) throw new Error(err);
				done();
			});

		});
	});

	describe('max val', function(){
		it('should return an error when value is greater than rule.max', function(done){
			getNumbersTestValidator().validate("val_test", "6", function(field, err){
				if (!err) throw new Error('Max Val Rule Failed');
				else done();
			});
		});
		it('should return a blank string if value is less than or equal to rule.max', function(done){
			getNumbersTestValidator().validate("val_test", "4", function(field, err) {
				if (err) throw new Error(err);
				done();
			});

		});
	});

	describe('min/max val', function(){
		it('should return a blank string when the value is within rule.min and rule.max', function(done){
			getNumbersTestValidator().validate("val_test", "4", function(field, err) {
				if (err) throw new Error(err);
				else done();
			});
		});
	});

	describe('val outside', function(){
		it('should return an error when a number between 10 and 20', function(done){
			getNumbersTestValidator().validate("val_outside_test", "15", function(field, err){
				if (!err) throw new Error('Val Outside Rule Failed');
				else done();
			})
		})
		it('should return blank when a number outside 10 and 20 is given.', function(done){
			getNumbersTestValidator().validate("val_outside_test", "22", function(field, err){
				if (err) throw new Error(err);
				else done();
			})
		})

	})
})
