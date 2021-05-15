[comparison](https://www.prisma.io/dataguide/intro/comparing-database-types)           
[column family vs row](https://dataschool.com/data-modeling-101/row-vs-column-oriented-databases/)


### Sabir vai links   
http://highscalability.com/amazon-architecture?fbclid=IwAR3oPXtzLW7mVDkHly6sAeGFSOTNb1RN43c8KL3H83XjJ2b459D4TnX5T_U                 
http://highscalability.com/google-architecture?fbclid=IwAR2mT91b27hE7xEug6x5b3KAathp8YQQhEMwmghhBapTnk5kDiJpPwYDhjY              
http://highscalability.com/youtube-architecture?fbclid=IwAR3CGL4dxgtRCmusUiipUZGqgKrFVs1JROJBbwV3xiQYpnEe0x-CTBURiMU                     
http://highscalability.com/blog/2016/6/27/how-facebook-live-streams-to-800000-simultaneous-viewers.html                              
http://highscalability.com/scaling-twitter-making-twitter-10000-percent-faster                             
http://highscalability.com/blog/2014/2/26/the-whatsapp-architecture-facebook-bought-for-19-billion.html                             
http://highscalability.com/blog/2015/9/14/how-uber-scales-their-real-time-market-platform.html
http://highscalability.com/blog/2011/12/19/how-twitter-stores-250-million-tweets-a-day-using-mysql.html
https://instagram-engineering.com/what-powers-instagram-hundreds-of-instances-dozens-of-technologies-adf2e22da2ad
https://www.youtube.com/watch?v=PE4gwstWhmc

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

### relational vs nosql [link](https://integrant.com/blog/when-to-use-sql-vs-nosql)  
   #### SQL      
   * Scaling out with SQL is possible, but requires extensive effort (partitioning, sharding, clustering, etc.) and cost. 
   *  You can run SQL on Azure, for example, but you will be limited in your ability to scale.
   *  If you’re working with a multi-tenant application, you will need sharding and partitioning (separating very large databases into smaller, faster, more easily managed parts). To achieve this with SQL databases requires additional coding. NoSQL databases (such as CosmosDB) includes these features out-of-box.
   #### NoSQL  
   *  NoSQL engines are designed to scale out and leverage cloud computing. When scaling out or horizontally we are adding resources to a single node (a computer or server). We can have one database working on multiple nodes. Scaling out (or back in) means we can easily add and remove nodes. This makes NoSQL a perfect match for the cloud. Because it can scale out, you will be maximizing the scalability benefits of the cloud. 
   *  NoSQL vs. SQL Speed (of your team) The ability to store huge amounts of data in a flexible way makes NoSQL faster to develop.
### Data denormalization    
   * Denormalization is a strategy used on a previously-normalized database to increase performance. [link](https://en.wikipedia.org/wiki/Denormalization)     
### Kafka           
   * [link](https://www.neovasolutions.com/2020/07/20/apache-kafka-a-quick-overview/)
   * kafka clusters
   * zookeaper is used for monitoring kafka clusters 
   * Kafka is used for data streaming (pub/sub pattern)
   
   ```
       producer1 producer2 producer3
        |            |         |
    -----------kafka clusters------------------
       topic1            topic2           topic3
       ------            ------           ------
       partition1       partition1
       partition2       partition2
       partition3
    --------------------------------------------
        |                 |                 |
     consumer1         consumer2        consummer3
   ```
   
### Zookeeper
   * Zookeeper replicates all your data to every node and lets clients watch the data for changes. Changes are sent very quickly (within a bounded amount of time) to clients. You can also create "ephemeral nodes", which are deleted within a specified time if a client disconnects.
   * cluster-wide locks for your services  
   * Finally, the maximum size of a "file" (znode) in Zookeeper is 1MB, but typically they'll be single strings.
   * Basically, ZooKeeper (and Curator, which is built on it) helps in handling the mechanics of clustering -- heartbeats, distributing updates/configuration, distributed locks, etc

### Redis [link](https://redis.io/topics/introduction)   
  * Transactions
  * Pub/Sub
  * Lua scripting
  * Keys with a limited time-to-live
  * LRU eviction of keys
  * Automatic failover
### Fanout/Fanin
### NGINX (en·juh-neks)    
Load balancing software  
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
