`import DS from 'ember-data'`

{ attr } = DS

Bonus = DS.Model.extend

  Index:  attr 'number'
  Name:   attr 'string'
  Amount: attr 'number'
  CurrencyAmount: attr 'hash'

`export default Bonus`
