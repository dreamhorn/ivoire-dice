var chai = require('chai');
var Ivoire = require("ivoire-dice");

chai.should();

describe('ivoire-dice', function () {
  var seed = 42
  var i;

  beforeEach(function(){
    i = new Ivoire({seed: seed});
  });

  describe('#roll()', function () {
    it('should roll a set of dice', function () {
      i.roll('1d6').should.equal(4)
    });
  });

  describe('#roll_fudge()', function () {
    it('should roll a set of fudge dice', function () {
      i.roll_fudge().should.equal(0)
    });
  });
});
