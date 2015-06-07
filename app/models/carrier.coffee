`import DS from 'ember-data'`
`import Ember from 'ember'`

{ attr, hasMany } = DS

Carrier = DS.Model.extend

  Name: attr 'string'

  # Relationships
  Fares: hasMany 'fare'


  # Поле Fares приходит встроенным объектом и
  # при каждом новом запросе он заменяет предыдущий в модели
  # для восстановления предыдущих Fares, необходимо сохранять ids
  faresObserver: (()->
    oldFares = @get 'oldFares'
    fares    = @get 'Fares'
    return if Ember.isEmpty fares

    idsFares = fares.map (fare)->
      fare.get 'id'

    if oldFares
      oldFares.forEach (idFare)=>
        if idsFares.indexOf(idFare) is -1
          @store.find('fare', idFare).then (fare)->
            fares.pushObject fare
          .catch (err)->
            console.log err

          idsFares.pushObject idFare
        return

    @set 'oldFares', idsFares
  ).observes('Fares')#.on 'didLoad'


`export default Carrier`
