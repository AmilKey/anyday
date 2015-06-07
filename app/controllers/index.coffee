`import Ember from 'ember'`
`import { raw, request } from 'ic-ajax'`

link_1 = "http://api.anywayanyday.com/api/NewRequest3/?Route=2208MOWPARAD1CN0IN0SCE&_Serialize=JSON"
link_2 = "http://api.anywayanyday.com/api/RequestState/?R=%@&_Serialize=JSON"
link_3 = "http://api.anywayanyday.com/api/Fares2/?R=%@&L=RU&C=RUB&Limit=200&DebugFullNames=true&_Serialize=JSON"

TIME_FOR_STATUS  = 1000
TIME_FOR_REQUEST = 60000

IndexController = Ember.Controller.extend

  requests: Ember.A()
  fares   : Ember.A()

  requestWrapper: (link)->
    settings =
      dataType: 'jsonp'
      crossDomain : true
    raw(link, settings)

  getIdSynonym: ()->
    @requestWrapper(link_1).then (data)=>
      response  = data.response
      IdSynonym = response['IdSynonym']
      @requests.pushObject Ember.Object.create
        IdSynonym: IdSynonym
        status: 0
      @getRequestStatus IdSynonym
    .catch (err)->
      console.log err

  getRequestStatus: (IdSynonym)->
    link = link_2.fmt IdSynonym
    @requestWrapper(link).then (data)=>
      response  = data.response
      completed = response['Completed']

      request = @requests.findBy 'IdSynonym', IdSynonym
      request.set 'status', completed if request

      if completed isnt '100'
        Ember.run.later @, ()->
          @getRequestStatus IdSynonym
        , TIME_FOR_STATUS
      else
        @getFares IdSynonym

    .catch (err)->
      console.log err

  getFares: (IdSynonym)->
    link     = link_3.fmt IdSynonym
    @requestWrapper(link).then (data)=>
      response = data.response
      @store.pushPayload response
    .catch (err)->
      console.log err.stack

  init: ()->
    @_super arguments...

    initRequests = ()=>
      @getIdSynonym()
      Ember.run.later @, ()->
        initRequests()
      , TIME_FOR_REQUEST
      return

    initRequests()


  carriers: Ember.computed ()->
    @store.all 'carrier'


  actions:
    setCarrier: (carrier)->
      fares = carrier.get 'Fares'

      result = Em.ArrayProxy.createWithMixins Em.SortableMixin,
        content: fares
        sortProperties: ['TotalAmount']
        sortAscending: yes

      @set 'fares', result


`export default IndexController`
