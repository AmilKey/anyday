`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'serializer:fare',
  # Specify the other units that are required for this test.
  needs: ['serializer:fare']

# Replace this with your real tests.
test 'it serializes records', (assert) ->
  record = @subject()

  serializedRecord = record.serialize()

  assert.ok serializedRecord
