### Rest vs HTTP
* Restfull is some guideline designing an API
* Restfull constrains to be stateless. There are actually two kinds of state. Application State that lives on the client and Resource State that lives on the server.
A web service only needs to care about your application state when you’re actually making a request. The rest of the time, it doesn’t even know you exist. This means that whenever a client makes a request, it must include all the application states the server will need to process it.
Resource states are fixed and live in server. For example you upload a image resource that has unique id. You can delete the resource using the same id.
