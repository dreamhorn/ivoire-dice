ivoire-dice
===========

A set of magic dice for the [Ivoire](https://www.npmjs.com/package/ivoire)
random number generator framework.


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
var Ivoire = require('ivoire-dice');
```

Or you can require it alongside `ivoire`:

```
var Ivoire = require('ivoire');
require('ivoire-dice');
```

Either way, instantiate and start rolling!

```
var i = new Ivoire();
i.roll('2d10');
```


Reference
---------

`ivoire-dice` adds some methods to the `Ivoire` prototype object, making them
available on all `Ivoire` instances.

### #roll(dexpr)

Roll the dice, as specified by the given dice expression.

`ivoire-dice` supports most common RPG dice notations, relying on the
[Owlbear](https://github.com/jmhnilbog/owlbear) parser to make sense of them:

```
var i = new require('ivoire-dice');

// Roll two six-sided die:
i.roll('2d6');

// Roll one twenty-sided die, adding 5 to the result:
i.roll('1d20 + 5')
```

### #roll_fudge(num)

Roll `num` number of [Fudge dice][fudge]. Fudge dice are six-sided dice with the sides
`[-1, -1, 0, 0, 1, 1]`.

```
var i = new require('ivoire-dice');

// Roll 4dF (the default)
i.roll_fudge();

// Roll 3dF
i.roll_fudge(3);
```


[fudge]: https://en.wikipedia.org/wiki/Fudge_(role-playing_game_system)#Fudge_dice
