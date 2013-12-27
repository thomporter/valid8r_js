
function getCheckboxesTestValidator() {
	return new Valid8r({
		rules: {
			min_checked_err: { selector:'input[name="min_checked_err[]"]', rules:[ {rule:"checks", min: 3, max:4} ] },
			min_checked_suc: { selector:'input[name="min_checked_suc[]"]',rules:[ {rule:"checks", min: 3, max:4} ] },
			max_checked_err: { selector:'input[name="max_checked_err[]"]',rules:[ {rule:"checks", min: 3, max:4} ] },
			max_checked_suc: { selector:'input[name="max_checked_suc[]"]',rules:[ {rule:"checks", min: 3, max:4} ] },
			min_max_checked_err: { selector:'input[name="min_max_checked_err[]"]',rules:[ {rule:"checks", min: 3, max:4} ] },
			min_max_checked_suc: { selector:'input[name="min_max_checked_suc[]"]',rules:[ {rule:"checks", min: 3, max:4} ] }
		}
	});
}

describe('Valid8r Checkboxes & Radios', function(){

	describe('min checked', function(){
		it('should return an error when less than rule.min options are checked.', function(done){
			err = getCheckboxesTestValidator().validate("min_checked_err", '', function(field, err){
				if (!err) throw new Error('Min Checked Rule Failed');
				else done();	
			});
			
			
		})
		it('should return a blank string when rule.min options are checked', function(done){
			getCheckboxesTestValidator().validate("min_checked_suc", '', function(field, err) {
				if (err) throw new Error(err);
				else done();
			})
		});
	});

	describe('max checked', function(){
		it('should return an error when more than rule.max options are checked', function(done){
			getCheckboxesTestValidator().validate("max_checked_err", '', function(field, err){
				if (!err) throw new Error('Max Val Rule Failed');
				else done();
			})
		});
		it('should return a blank string when rule.max options are checked', function(done){
			getCheckboxesTestValidator().validate("max_checked_suc", '', function(field, err) {
				if (err) throw new Error(err);
				else done();
			})
		});
	});
	describe('min/max checked', function(){
		it('should return an error when less than rule.min or more than rule.max options are checked', function(done){
			getCheckboxesTestValidator().validate("min_max_checked_err", '', function(field, err) {
				if (!err) throw new Error('Min/Max Val Rule Failed');
				else done();
			})
		});
		it('should return a blank string when between rule.min and rule.max options are checked', function(done){
			getCheckboxesTestValidator().validate("min_max_checked_suc", '', function(field, err) {
				if (err) throw new Error(err);
				else done();
			})
		});
	});
});
