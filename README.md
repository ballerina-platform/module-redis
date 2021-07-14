# Ballerina Redis Connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-redis/workflows/CI/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-redis/actions?query=workflow%3ACI)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-redis.svg)](https://github.com/ballerina-platform/module-ballerinax-redis/commits/master)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

The `redis` is a [Ballerina](https://ballerina.io/) connector for Redis

[Redis](https://redis.io/) is an open source, in-memory data structure store, used as a database, cache, and message broker. Redis provides data structures such as strings, hashes, lists, sets, sorted sets.

This connector provides operations for connecting and interacting with Redis server over the network. 
For more information about configuration and operations, go to the module. 
- [`redis`](https://docs.central.ballerina.io/ballerinax/redis/latest)

# Building from the Source
## Setting Up the Prerequisites

1. Download and install Java SE Development Kit (JDK) version 11 (from one of the following locations).

   * [Oracle](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)

   * [OpenJDK](https://adoptopenjdk.net/)

        > **Note:** Set the JAVA_HOME environment variable to the path name of the directory into which you installed JDK.

2. Download and install [Ballerina Beta 2](https://ballerina.io/). 

## Building the Source
Execute the commands below to build from the source after installing Ballerina SL Beta 2 version.

1. To build the package:
    ```    
    bal build -c ./redis
    ```
2. To run the without tests:
    ```
    bal build -c --skip-tests ./redis
    ```
