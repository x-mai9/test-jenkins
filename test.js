var assert = require('assert');
var chai = require('chai');
var should = chai.should();
var HelloWorld = require('./HelloWorld');

describe('these should obviously pass', function() {
    it('is a sum and will pass', function() {
        assert.equal(2+2, 4);
    }),
    it('is a subtraction and will pass', function() {
        assert.equal(4-2, 2);
    }),
    it('is not a equal comparison', function() {
        assert.notEqual(1, 2);
    })

    it('should return whatever in HelloWorld', function() {
        var hw = new HelloWorld('hi');
        
        hw.displayText().should.be.a('string');
        hw.displayText().should.equal('hi');
    })
    it('should fail the whole test suite', function() {
        assert.equal(2, 2);
    })
});

describe('these should fail', function() {
    it('is an incorrect sum', function() {
        assert.equal(2+1, 4);
    })
});
