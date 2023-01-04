### Rest
* Restfull is some guideline designing an API
* Restfull constrains to be stateless. There are actually two kinds of state. Application State that lives on the client and Resource State that lives on the server.
A web service only needs to care about your application state when you’re actually making a request. The rest of the time, it doesn’t even know you exist. This means that whenever a client makes a request, it must include all the application states the server will need to process it.
Resource states are fixed and live in server. For example you upload a image resource that has unique id. You can delete the resource using the same id.

* Rest also uses Verbs like Delete while HTPP uses method (Delete url/id vs POST url/method=delete/id)
* Rest is resouce centric
* Rest uses CRUD (GET, POST, PUT, DELETE)
* Rest uses HTTP

### Rest vs RPC
* Rest uses HTTP while RPC uses TCP or UDP
* RPC relies on contractual negotiations; in other words, the client-server relationship directly influences how communication occurs. While contracts aren’t absent with REST, the arrangement is notably different. REST contracts are linked to hostnames, paths, HTTP methods, headers, request bodies, response bodies, and more. Additionally, RESTful interactions are defined via standardized terms.
* RPC only supports GET and POST requests while Rest uses CRUD (GET, POST, PUT, DELETE)



The RPC API thinks in terms of "verbs", exposing the restaurant functionality as function calls that accept parameters, and invokes these functions via the HTTP verb that seems most appropriate - a 'get' for a query, and so on, but the name of the verb is purely incidental and has no real bearing on the actual functionality, since you're calling a different URL each time. Return codes are hand-coded, and part of the service contract.
The REST API, in contrast, models the various entities within the problem domain as resources, and uses HTTP verbs to represent transactions against these resources - POST to create, PUT to update, and GET to read. All of these verbs, invoked on the same URL, provide different functionality. Common HTTP return codes are used to convey status of the requests.
Placing an Order:

RPC: http://MyRestaurant:8080/Orders/PlaceOrder (POST: {Tacos object})
REST: http://MyRestaurant:8080/Orders/Order?OrderNumber=asdf (POST: {Tacos object})
Retrieving an Order:

RPC: http://MyRestaurant:8080/Orders/GetOrder?OrderNumber=asdf (GET)
REST: http://MyRestaurant:8080/Orders/Order?OrderNumber=asdf (GET)
Updating an Order:

RPC: http://MyRestaurant:8080/Orders/UpdateOrder (PUT: {Pineapple Tacos object})
REST: http://MyRestaurant:8080/Orders/Order?OrderNumber=asdf (PUT: {Pineapple Tacos object})

[rest vs rpc](https://www.geeksforgeeks.org/difference-between-rest-api-and-rpc-api/) 
