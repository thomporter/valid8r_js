
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
		},
		ip_test: {
			rules: [
				{rule:"ip"}
			]
		},
		ipv4_test: {
			rules: [
				{rule:"ip",v:4}
			]
		},
		ipv6_test: {
			rules: [
				{rule:"ip",v:6}
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
	
	describe('ip address (either version.)', function(){
		it('should return an error when an invalid IPv4 address is given', function(done){
			v.validate('ip_test', '256.256.256.256', function(field, err){
				if (!err) throw new Error('IP Rule Failed');
				done();
			})
		});
		it('should return an error when an invalid IPv6 address is given', function(done){
			v.validate('ip_test', 'xe80:0000:0000:0000:0204:61ff:fe9d:f156', function(field, err){
				if (!err) throw new Error('IP Rule Failed');
				done();
			})
		});
		it('should not return an error when a valid IPv4 address is given', function(done){
			v.validate('ip_test', '10.10.10.10', function(field, err){
				if (err) throw new Error(err);
				done();
			})
		});
		
		it('should not return an error when a valid IPv6 address is given', function(done){
			v.validate('ip_test', 'fe80:0000:0000:0000:0204:61ff:fe9d:f156', function(field, err){
				if (err) throw new Error(err);
				done();
			})
		});
		
	});
        describe('ipv4', function(){
                it('should return an error when an invalid IPv4 address is given', function(done){
                        v.validate('ipv4_test', '256.256.256.256', function(field, err){
                                if (!err) throw new Error('IP Rule Failed');
                                done();
                        })
                });
                it('should not return an error when a valid IPv4 address is given', function(done){
                        v.validate('ipv4_test', '10.10.10.10', function(field, err){
                                if (err) throw new Error(err);
                                done();
                        })
                });

        });     

        describe('ipv6', function(){
                it('should return an error when an invalid IPv6 address is given', function(done){
                        v.validate('ipv6_test', 'xe80:0000:0000:0000:0204:61ff:fe9d:f156', function(field, err){
                                if (!err) throw new Error('IP Rule Failed');
                                done();
                        })
                });

                it('should not return an error when a valid IPv6 address is given', function(done){
                        v.validate('ipv6_test', 'fe80:0000:0000:0000:0204:61ff:fe9d:f156', function(field, err){
                                if (err) throw new Error(err);
                                done();
                        })
                });

        });

	
	
});     

