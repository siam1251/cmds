[comparison](https://www.prisma.io/dataguide/intro/comparing-database-types)           
[column family vs row](https://dataschool.com/data-modeling-101/row-vs-column-oriented-databases/)

##### column family is not column oriented database(hbase is column family where redshift is column oriented, redshift is RDMS database but column oriented)

### Which part I should focus to implement?

### Requirement 
  * What does the system do? (web crawler)
  * I want to make sure that we are at the same page. Can you please give me an example?
  * Which part I should focus to implement?
  * which parts should I implement, newsfeed generation or user posts?
  * Decide whether it's a algorithmic question or system design? If you are still confused ask interviewer.
  * Who are the users of this system? (important!)
  * Will this system server globally? (cluster)
  * what will be the number of users at a time? 5B, dayily 2B, 
  * capacity estimation: Troughput(data passes through internet per second), Latency (difference between post and response in seconds)
  * what many users will post at a second?
  * what will be post size? 100 KByte * 5 Posts * 2B = 1000 Billon KB = 10^9*10^3
   
#### Calculation:
 
  * convert 2B/(24*60*60) per second
  * Data incoming and data outgoint ?
  * characters
  * How many servers do I need, one server can serve 1 Million uses so ....

### Database
  * sharding or partition
  * replication (no single point of failure)
  
Client  -> Gateway server -> load balancer --> clusters --> database

### Message Brokers / asynchronous communication / (pub/sub pattern)       
   * RabbitMQ
   * Redis
   * Kafka
### Elasticsearch 
   * Application search —- For applications that rely heavily on a search platform for the access, retrieval, and reporting of data.
   * Website search —- Websites which store a lot of content find Elasticsearch a very useful tool for effective and accurate searches. It’s no surprise that Elasticsearch is steadily gaining ground in the site search domain sphere.
## Terms   

### relational vs nosql
### Kafka
### Zookeeper
   * Zookeeper replicates all your data to every node and lets clients watch the data for changes. Changes are sent very quickly (within a bounded amount of time) to clients. You can also create "ephemeral nodes", which are deleted within a specified time if a client disconnects.
   * cluster-wide locks for your services  
   * Finally, the maximum size of a "file" (znode) in Zookeeper is 1MB, but typically they'll be single strings.
### Fanout/Fanin

### Clusters vs bucket
### lazy vs eager
### persistent data storage
### indexing sql table column
### S3 vs GCS (google cloud storage)  
### Load Balancer  
### Microservice   
### Peer to Peer connection  or download for machines in a same cluster  
### HFDS ( Hadoop Distributed File System)
### apache kafka vs apache spark 
