var chai = require('chai');
var Ivoire = require("./lib/ivoire-dice");

chai.should();

describe('ivoire-dice', function () {
  var seed = 42
  var ivoire;

  beforeEach(function(){
    ivoire = new Ivoire({seed: seed});
  });

  describe('#roll()', function () {
    it('should roll a set of dice', function () {
      ivoire.roll('1d6').should.equal(4)
    });
  });

  describe('#roll_fudge()', function () {
    it('should roll a set of fudge dice', function () {
      ivoire.roll_fudge().should.equal(0)
    });
  });
});
