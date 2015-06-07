`import DS from 'ember-data'`
`import Ember from 'ember'`


ApplicationSerializer = DS.ActiveModelSerializer.extend

  primaryKey: 'Code'

  pushPayload: (store, rawPayload)->

    # не использусые данные
    delete rawPayload['Error']
    delete rawPayload['Language']
    delete rawPayload['TotalAirlinesCount']
    delete rawPayload['TotalFaresCount']
    delete rawPayload['AllGDSDone']
    delete rawPayload['Currency']
    delete rawPayload['CurrentTime']
    delete rawPayload['Request']
    delete rawPayload['CrossSale']
    delete rawPayload['FutureCrossSale']
    delete rawPayload['PriceWithCommission']
    delete rawPayload['AtcInfo']
    delete rawPayload['HistoryTags']

    if rawPayload['References']
      @_super store, rawPayload['References']
      delete rawPayload['References']
    @_super arguments...


  # Airlines синоним Carriers
  modelNameFromPayloadKey: (payloadKey)->
    if payloadKey is 'Airlines'
      @_super 'Carriers'
    else
      @_super payloadKey

`export default ApplicationSerializer`
