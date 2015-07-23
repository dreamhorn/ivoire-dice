ivoire-dice
===========

A set of magic dice for the [Ivoire](https://www.npmjs.com/package/ivoire)
random number generator framework.

[![Build Status](https://travis-ci.org/dreamhorn/ivoire-dice.svg?branch=master)](https://travis-ci.org/dreamhorn/ivoire-dice)


Installing
----------

To install, use `npm`:

```
npm install ivoire-dice
```

Alternately, you can find the source [on Github](https://github.com/dreamhorn/ivoire-dice).


Getting Started
---------------

`ivoire-dice` extends the `ivoire` package. You can require it directly:

```
var ivoire = require('ivoire-dice');
```

Or you can require it alongside `ivoire`:

```
var Ivoire = require('ivoire');
require('ivoire-dice');
```

Either way, instantiate and start rolling!

```
var ivoire = new Ivoire();
ivoire.roll('2d10');
```


Reference
---------

`ivoire-dice` adds some methods to the `Ivoire` prototype object, making them
available on all `Ivoire` instances.

### Ivoire.prototype.roll(dexpr)

Roll the dice, as specified by the given dice expression.

`ivoire-dice` supports most common RPG dice notations, relying on the
[Owlbear](https://github.com/jmhnilbog/owlbear) parser to make sense of them:

```
var ivoire = new require('ivoire-dice');

// Roll two six-sided die:
ivoire.roll('2d6');

// Roll one twenty-sided die, adding 5 to the result:
ivoire.roll('1d20 + 5')
```

### Ivoire.prototype.roll_fudge(num)

Roll `num` number of [Fudge dice][fudge]. Fudge dice are six-sided dice with the sides
`[-1, -1, 0, 0, 1, 1]`.

```
var ivoire = new require('ivoire-dice');

// Roll 4dF (the default)
ivoire.roll_fudge();

// Roll 3dF
ivoire.roll_fudge(3);
```


[fudge]: https://en.wikipedia.org/wiki/Fudge_(role-playing_game_system)#Fudge_dice
