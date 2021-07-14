## Overview

Ballerina connector for Redis is connecting Redis via Ballerina language easily. This module provides the functionality required to access and manipulate key-value data stored in a Redis database this module provides API functions for manipulating Redis String, Hash, List, Set and Sorted Set data types.
Currently the provided functionality is limited to usage Redis as a database/cache. Broker functionality of Redis is not yet exposed through this module.

This module supports Ballerina Swan Lake Beta 2 version

## Quickstart

### Set value to a key
#### Step 1: Import Redis module
First, import the ballerinax/redis module into the Ballerina project.
```ballerina
import ballerinax/redis;
```
#### Step 2: Client configuration
To access a Redis datasource, you must first create a `client` object. Create a client of the redis client type (i.e. `redis:Client`) and provide the necessary connection parameters. This will create a connection/pool of connections to the given Redis database. A method for creating a client with a Redis client can be found below.
```ballerina
redis:ClientEndpointConfiguration redisConfig = {
    host: "localhost",
    password: "",
    options: {
        connectionPooling: true,
        isClusterConnection: false,
        ssl: false,
        startTls: false,
        verifyPeer: false,
        connectionTimeout: 500
    }
};

redis:Client conn = check new (redisConfig);
```
#### Step 3: Set value to a key
```ballerina
string stringSetresult = check connection->set("Project", "Ballerina");
```

## Snippets
Snippets of some operations.

- Set value to a key

    This section shows how to insert a string value to a cache. This can be done by specifying name of the key and value to be inserted as parameters. On successful insertion, function returns string 'OK'
    ``` ballerina
    string stringSetResult = check connection->set("Project", "Ballerina");
    ```

- Get value of a key

    This section shows how to fetch a inserted string value from a cache. This can be done by specifying name of the key as parameter. On successful operation, function returns string containing value corresponding for that key
    ``` ballerina
    string? stringGetResult = check connection->get("Project");
    if (stringGetResult is string) {
        log:printInfo("String value of key: " + stringGetResult);
    } else {
        log:printInfo("Key does not exist");
    }
    ```
    
- Push values to list

    This section shows how to insert list elements to a cache. This can be done by specifying name of the key and list of values to be inserted as parameters. On successful insertion, function returns number of list elements pushed
    ``` ballerina
    int listPushresult = check connection->lPush("NumberList", ["One", "Two"]);
    ```

- Pop values in the list

    This section shows how to get and pop from list element in a cache. This can be done by specifying name of the key as parameter. On successful operation, function returns last element from list of elements
    ``` ballerina
    string? lPopResult = check connection->lPop("NumberList");
    if (lPopResult is string) {
        log:printInfo("Popped element: " + lPopResult);
    } else if (lPopResult is ()) {
        log:printInfo("Key does not exist");
    }
    ```
- Usage of multiple logical databses

    Redis logical database having the specified zero-based numeric index. New connections always use the database 0. Redis Cluster only supports database 0. In this redis connector we can select logical database during client initialization by providing databse number in configuration, if not specified it uses database 0. For usage of multiple logical databases have to create clients with database specified in configuration
    ```ballerina
    redis:ClientEndpointConfiguration redisConfig = {
        host: "localhost:6379",
        password: "",
        options: { 
            connectionPooling: true, 
            isClusterConnection: false, 
            ssl: false,
            startTls: false, 
            verifyPeer: false, 
            database: 1 
        }
    };
    ```

### [You can find more samples here](https://github.com/ballerina-platform/module-ballerinax-redis/tree/master/redis/samples)
