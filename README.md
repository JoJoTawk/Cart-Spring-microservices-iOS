# Cart-Spring-microservices-iOS
This application include java spring boot using micro-services architecture and iOS swift


Here is total 5 separate application (4 backend).
- service-registry
- api-gateway
- product-service
- offer-service

# What is microservice?
//TODO

# Run the services

### 1. Clone this project
Open terminal and run
````
git clone https://github.com/hnjaman/complete-microservice-application.git
````

### 3. Install RabbitMQ
RabbitMQ is Advanced Message Queuing Protocol (AMQP), It should be installed and running in your system where product 
service will be deployed. Though this example is for localhost you need to install in your local computer and by default 
run in ``http://localhost:15672/``  
Username: guest  
Password: guest
  
##### [Mac OS]  
I have prepared a bash file **install-rabbitmq-macOS.sh** to install RabbitMQ in MacOS. Type `bash install-rabbitmq-macOS.sh` 
and start

##### [Ubuntu OS]
Check this for [Installing on Debian and Ubuntu](https://www.rabbitmq.com/install-debian.html)  

### 4. Lombok
Lombok plugin should be installed in you IDE otherwise IDE will catch code error. I used Intellij Idea and I had to install 
lombok plugin.

## Run service-registry application
service-registry is the application where all microservice instances will register with a service id. When a service wants 
to call another service, it will ask service-registry by service id to what instances are currently running for that service id. 

Open a new terminal and run below command to launch service-registry
````
cd service-registry/
mvn clean install
mvn spring-boot:run

Or Open the project and Add pom.xml as maven project wait for dependancies to be downloaded and run

service-registry will launch in http://localhost:8761/  (normal port for Eureka).

````

## Run api-gateway application
api-gateway application is the service for facing other services. Just like the entry point to get any service. Receive 
all the request from user and delegates the request to the appropriate service. 
- **Zuul** is used to achieve this functionality

Open a new terminal and run below command to run api gateway
````
cd api-gateway/
mvn clean install
mvn spring-boot:run
````
The application will run in ``http://localhost:8000/``.

| API             | REST Method   | Api-gateway request                                       | Forwarded service   | Forwarded URL                      |
|-----------------|:--------------|:----------------------------------------------------------|:--------------------|:-----------------------------------|
|Get all products |GET            |``http://localhost:8000/product-service/products``         | product-service     | ``http://localhost:8081/products`` |    
|Add new product  |POST           |``http://localhost:8000/product-service/products``         | product-service     | ``http://localhost:8081/products`` |    
|Update price     |PUT            |``http://localhost:8000/product-service/products/addPrice``| product-service     | ``http://localhost:8081/products`` |    
|Add offer        |POST           |``http://localhost:8000/offer-service/offer``              | offer-service       | ``http://localhost:8082/offer``    |

Above table contains all the used api in this entire application.

## Run Product service
Open a new terminal and run below command
````
cd product-service/
mvn clean install
````
The ``mvn clean install`` command will create a ``product-service-0.0.1-SNAPSHOT.jar`` inside ``target`` directory. 
We will run two product service instance by two different port. Run below command in a separate terminal
````
cd target/
java -jar product-service-0.0.1-SNAPSHOT.jar --server.port=8081
````
Above command will run product-service in 8081 port.

Run another instance of product-service in 8180 port by running below command in another terminal
````
java -jar product-service-0.0.1-SNAPSHOT.jar --server.port=8180
````
After few seconds you can see there are 2 instance running for product-service which is registered with Eureka server in http://localhost:8761/


Access product-service data source console in browser by
`localhost:8081/h2`  
To connect product data source h2 console use below credentials   
JDBC URL  : `jdbc:h2:~/product`  
User Name : `root`  
Password  : `root`  

Check product table. Right now there is no products.  
Let's add a new product by calling `localhost:8000/product-service/products` **POST** endpoint with below body in postman.
````
{
    "productCode": "NOT_EMPTY",
    "productTitle": "NOT_EMPTY",
    "imageUrl": "NOT_EMPTY",
    "price": price is Double
}
````
## Run Offer service
Open separate terminal and run
 ````
 cd offer-service/
 mvn clean install
 mvn spring-boot:run
 ````
Application will run on ``http://localhost:8082/``

Access it's data source console in browser by
`localhost:8082/h2`  
To connect offer data source h2 console use below credentials  
JDBC URL  : `jdbc:h2:~/offer`  
User Name : `root`  
Password  : `root`

Check offer table and there is no offer right now.  
Let's add a offer for *product_id = 1* by calling `http://localhost:8000/offer-service/offer` POST endpoint with below body in postman
````
{
    "productId": 1,
    "discountOffer": 10
}
````


Drafts Tutorial steps:


    `https://docs.google.com/document/d/1dc1ijl87KDZNwv0KhT_NPWqBZsINmbmBN241etjcqkM/edit?usp=sharing`

    `https://docs.google.com/document/d/1bq3vNKzbfZ87N6_XoQrnrdKytbmTWeLdoCA5bkQHBFw/edit?usp=sharing`

    `https://docs.google.com/document/d/1Ez-N_qv2GTJPf-2jOcjdKPuKzogrUUWGt3sz6b-zLwQ/edit?usp=sharing`
