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


[rest vs rpc](https://www.geeksforgeeks.org/difference-between-rest-api-and-rpc-api/) 
