function getConditionalValidator() {
	return new Valid8r({
		rules: {
			_globalConditions: {
				do_validation: {
					'field' : 'doGlobalConditionalTest',
					'is': '1'
				},
				do_not_do_validation: {
					'field' : 'doNotDoGlobalConditionalTest',
					'is': '1'
				}
			},
			_rules: {
				do_conditional_test: {
					rules: [
						{rule:"required",when:"do_validation"}
					]
				},
				do_not_do_conditional_test: {
					rules: [
						{rule:"required",when:"do_not_do_validation"}
					]
				}
			}
		}
	});
}

describe('Global Conditionals', function(){

	describe('positive conditional', function(){
		it('should return an error when condition is met and error exists', function(done){
			getConditionalValidator().validate("do_conditional_test", '', function(field, err) {
				if (!err) throw new Error('Conditional Validation Failed');
				done();
			})

		});
	});
	describe('negative condition', function(){
		it('should not return an error when condition is not met and error exists', function(done){
			getConditionalValidator().validate("do_not_do_conditional_test", '', function(field, err) {
				if (err) throw new Error('Conditional Validation Failed: ' + err);
				done();
			})

		});
		
	});


});     

