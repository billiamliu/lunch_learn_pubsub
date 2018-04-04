# Goal
To see the different patterns and how they can be used to make sure models are internally valid. (i.e. when a table updates, make sure another affected table is also updated). Each pattern has its own pros and cons. With de-coupling comes more indirection for example. In the end we see that the initial modelling is incorrect, and throwing technology at the problem doesn't actually fix it.

# Learn
Examine each top level file for usage, and implementation can be seen in their respective folders.

## Service Object
`$ ruby service_object.rb`
Shows a simplified abstraction of using a Service Object to update both tables.

## Callback
`no code to run`
Look at ActiveRecord callbacks, and the deprecated ActiveRecord Observers (really it's a callback that lives in a different file.

## Observer
`$ ruby observer.rb`
Each publisher maintains its own subscribers to call when something happens.

## PubSub
`$ ruby pubsub.rb`
Publishers publish to a global bus, without knowledge of who is listening.
