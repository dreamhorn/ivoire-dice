"use strict"
Ivoire = require('ivoire')
_ = require('lodash')
Owlbear = require('owlbear')

parser = new Owlbear()


# Roll dice using standard dice notation.
Ivoire.prototype.roll = (dexpr) ->
  if _.isNumber dexpr
    @panic_if not _.isFinite dexpr, "Numeric dice expression must be finite"
    @panic_if dexpr < 1, "Numeric dice expression must be greater than 0"
    dexpr = Math.floor dexpr
    dexpr = "1d#{dexpr}"

  if _.isString dexpr
    rolls = parser.parse(dexpr)
  else
    rolls = Array.prototype.slice.apply(arguments)

  all_results = []
  for roll in rolls
    if 'operator' of roll
      all_results.push roll.operator
    else if 'constant' of roll
      all_results.push roll.constant
    else
      count = roll.count || 1
      keep = roll.keep
      die = roll.die || {}
      sides = die.sides || 6
      reroll = die.reroll || []
      explode = die.explode || []

      results = []
      opts = {min: 1, max: sides}
      for r in [0..count-1]
        result = @integer opts

        # Handle re-rolls
        while result in reroll
          result = @integer opts
        results.push result

        # Handle exploding dice
        while result in explode
          result = @integer opts
          results.push result

      if _.isFinite(keep) and keep < results.length
        results.sort()
        results.reverse()
        results = results.slice 0, keep

      all_results.push _.sum results

  expr = all_results.join(' ')
  final = eval expr
  return final


# Roll Fudge dice, returning the sum.
# If no number of dice is specified, roll 4.
roll_fudge = Ivoire.prototype.roll_fudge = (num) ->
  @panic_if num < 1, "Can't throw fewer than 1 fudge die!"
  num = num || 4
  return _.sum @pick(roll_fudge.sides) for n in [0..num]

roll_fudge.sides = [-1, -1, 0, 0, 1, 1]


module.exports = Ivoire
