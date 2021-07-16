// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/jballerina.java;

# Represents Redis client endpoint.
@display {label: "Redis Client", iconPath: "RedisLogo.png"}
public client class Client {
    private ClientEndpointConfiguration clientEndpointConfig = {};

    handle datasource;

    # Initializes the Redis client endpoint.
    #
    # + config - Configurations required to initialize the `Client` endpoint
    public function init(ClientEndpointConfiguration config) returns error? {
        self.datasource = initClient(config);
    }

    // String operations
    # Append a value to a key.
    #
    # + key - Key referring to a value
    # + value - String value to be appended
    # + return - Length of the string after the operation
    @display {label: "Enrich Value"}
    remote function append(@display {label: "Key"} string key, @display {label: "Value To Append"} string value) 
                           returns @display {label: "Result String Length"} int | error {
        return append(self.datasource, java:fromString(key), java:fromString(value));
    }

    # Count set bits in a string.
    #
    # + key - Key referring to a value
    # + return - Number of bits of the value
    @display {label: "Get Bits of String"}
    remote function bitCount(@display {label: "Key"} string key) 
                             returns @display {label: "Bits of String"} int | error {
        return bitCount(self.datasource, java:fromString(key));
    }

    # Perform bitwise AND between strings.
    #
    # + destination - Result key of the operation
    # + keys - Input keys to perform AND between
    # + return - Size of the string stored in the destination key, that is equal to the size of the longest input
    #            string
    @display {label: "Perform Bitwise AND"}
    remote function bitOpAnd(@display {label: "Result key"} string destination, 
                             @display {label: "Key Array To Perform AND"} string[] keys)
                             returns @display {label: "Size of string"} int | error {
        return bitOpAnd(self.datasource, java:fromString(destination), keys);
    }

    # Perform bitwise OR between strings.
    #
    # + destination - Result key of the operation
    # + keys - Input keys to perform OR between
    # + return - Size of the string stored in the destination key, that is equal to the size of the longest input
    #            string or `error` if an error occurs
    @display {label: "Perform Bitwise OR"}
    remote function bitOpOr(@display {label: "Result key"} string destination, 
                            @display {label: "Key Array To Perform OR"} string[] keys)
                            returns @display {label: "Size of string"} int | error {
        return bitOpOr(self.datasource, java:fromString(destination), keys);
    }

    # Perform bitwise NOT on a string.
    #
    # + destination - Result key of the operation
    # + key - Input key to perform NOT
    # + return - Size of the string stored in the destination key or `error` if an error occurs
    @display {label: "Perform Bitwise NOT"}
    remote function bitOpNot(@display {label: "Result key"} string destination, 
                             @display {label: "Key To Perform NOT"} string key)
                             returns @display {label: "Size of String"} int | error {
        return bitOpNot(self.datasource, java:fromString(destination), java:fromString(key));
    }

    # Perform bitwise XOR between strings.
    #
    # + destination - Result key of the operation
    # + keys - Input keys to perform XOR between
    # + return - Size of the string stored in the destination key, that is equal to the size of the longest input
    #            string or `error` if an error occurs
    @display {label: "Perform Bitwise XOR"}
    remote function bitOpXor(@display {label: "Result key"} string destination, 
                             @display {label: "Key Array To Perform XOR"} string[] keys)
                             returns @display {label: "Size of String"} int | error {
        return bitOpXor(self.datasource, java:fromString(destination), keys);
    }

    # Decrement integer value of a key by one.
    #
    # + key - Key referring to a value
    # + return - Value of key after the decrement
    @display {label: "Decrement(By One)"}
    remote function decr(@display {label: "Key"} string key) returns @display {label: "Value"} int | error {
        return decr(self.datasource, java:fromString(key));
    }

    # Decrement integer value of a key by the given number.
    #
    # + key - Key referring to a value
    # + value - Value to be decremented
    # + return - Value of key after decrement or `error` if an error occurs
    @display {label: "Decrement (By Number)"}
    remote function decrBy(@display {label: "Key"} string key, @display {label: "Value To Decrement"} int value) 
                           returns @display {label: "Value"} int | error {
        return decrBy(self.datasource, java:fromString(key), value);
    }

    # Returns bit value at offset in the string value stored at key.
    #
    # + key - Key referring to a value
    # + offset - Offset in string value
    # + return - Bit value stored at offset or `error` if an error occurs
    @display {label: "Get Bit At Offset"}
    remote function getBit(@display {label: "Key"} string key, @display {label: "Offset"} int offset) 
                           returns @display {label: "Bit Value"} int | error {
        return getBit(self.datasource, java:fromString(key), offset);
    }

    # Get substring of string stored at a key.
    #
    # + key - Key referring to a value
    # + startPos - Starting point of substring
    # + end - End point of substring
    # + return - Substring or `error` if an error occurs
    @display {label: "Get Substring"}
    remote function getRange(@display {label: "Key"} string key, @display {label: "Start Position"} int startPos, 
                             @display {label: "End Position"} int end) 
                             returns @display {label: "Substring"} string | error {
        return <string>java:toString(check getRange(self.datasource, java:fromString(key), startPos, end));
    }

    # Set string value of key and return its existing value.
    #
    # + key - Key referring to a value
    # + value - Value to be set
    # + return - Existing value stored at key, or nil when key does not exist or `error` if an error occurs
    @display {label: "Get And Set Value"}
    remote function getSet(@display {label: "Key"} string key, @display {label: "New Value"} string value) 
                           returns @display {label: "Old Value"} string?|error {
        return java:toString(check getSet(self.datasource, java:fromString(key), java:fromString(value)));
    }

    # Get value of key.
    #
    # + key - Key referring to a value
    # + return - Value of key, or nil when key does not exist or `error` if an error occurs
    @display {label: "Get Value"}
    remote function get(@display {label: "Key"} string key) returns @display {label: "Value"} string?|error {
        return java:toString(check get(self.datasource, java:fromString(key)));
    }

    # Increment integer value of a key by one.
    #
    # + key - Key referring to a value
    # + return - Value of key after increment
    @display {label: "Increment (By One)"}
    remote function incr(@display {label: "Key"} string key) returns @display {label: "Result Value"} int | error {
        return incr(self.datasource, java:fromString(key));
    }

    # Increment integer value of key by the given amount.
    #
    # + key - Key referring to a value
    # + value - Amount to increment
    # + return - Value of key after increment
    @display {label: "Increment (By Number)"}
    remote function incrBy(@display {label: "Key"} string key, @display {label: "Increment Value"} int value) 
                           returns @display {label: "Result Value"} int | error {
        return incrBy(self.datasource, java:fromString(key), value);
    }

    # Increment integer value of key by the given float.
    #
    # + key - Key referring to a value
    # + value - Amount to increment
    # + return - Value of key after increment
    @display {label: "Increment (By Float)"}
    remote function incrByFloat(@display {label: "Key"} string key, 
                                @display {label: "Increment Value"} float value) 
                                returns @display {label: "Float Result Value"} float | error {
        return incrByFloat(self.datasource, java:fromString(key), value);
    }

    # Get values of all given keys.
    #
    # + keys - Keys of which values need to be retrieved
    # + return - Array of values at specified keys
    @display {label: "Get Values"}
    remote function mGet(@display {label: "Keys"} string[] keys) 
                         returns @display {label: "Values"} string[] | error {
        return mGet(self.datasource, keys);
    }

    # Set multiple keys to multiple values.
    #
    # + keyValueMap - Map of key-value pairs to be set
    # + return - String with value `OK` if the operation was successful
    @display {label: "Set Values"}
    remote function mSet(@display {label: "Key-Value Pair Map"} map<any> keyValueMap) 
                         returns @display {label: "Result"} string | error {
        return <string>java:toString(check mSet(self.datasource, keyValueMap));
    }

    # Set multiple keys to multiple values, only if none of the keys exist.
    #
    # + keyValueMap - Map of key-value pairs to be set
    # + return - True if the operation was successful, false if it failed
    @display {label: "Set Values If Absent"}
    remote function mSetNx(@display{label: "Map of Key Value Pairs"} map<any> keyValueMap)
                           returns @display{label: "Result"} boolean | error {
        return mSetNx(self.datasource, keyValueMap);
    }

    # Set value and expiration in milliseconds of a key.
    #
    # + key - Key referring to a value
    # + value - Value to be set
    # + expirationTime - Expiration time in milli seconds
    # + return - `OK` if successful or `error` if an error occurs
    @display {label: "Set Expirable Value (ms)"}
    remote function pSetEx(@display {label: "Key"} string key, @display {label: "Value"} string value,
                           @display {label: "TTL (ms)"} int expirationTime)
                           returns @display {label: "Result"} string | error {
        return <string>java:toString(check pSetEx(self.datasource, java:fromString(key), java:fromString(value),
        expirationTime));
    }

    # Set the value of a key.
    #
    # + key - Key referring to a value
    # + value - Values
    # + return - `OK` if successful
    @display {label: "Set Value"}
    remote function set(@display {label: "Key"} string key, @display {label: "Value"} string value) 
                        returns @display {label: "Result"} string | error {
        return <string>java:toString(check set(self.datasource, java:fromString(key), java:fromString(value)));
    }

    # Sets or clears the bit at offset in the string value stored at key.
    #
    # + key - Key referring to a value
    # + value - Value to be set
    # + offset - Offset at which the value should be set
    # + return - Original bit value stored at offset or `error` if an error occurs
    @display {label: "Set Bit From Offset"} 
    remote function setBit(@display {label: "Key"} string key, @display {label: "Value"} int value, 
                           @display {label: "Offset"} int offset) 
                           returns @display {label: "Old Bit At Offset"} int | error {
        return setBit(self.datasource, java:fromString(key), value, offset);
    }

    # Set the value and expiration of a key.
    #
    # + key - Key referring to a value
    # + value - Value to be set
    # + expirationPeriodSeconds - Expiration time to be set, in seconds
    # + return - On success `OK` or `error` if an error occurs
    @display {label: "Set Expirable Value (s)"}
    remote function setEx(@display {label: "Key"} string key, @display {label: "Value"} string value, 
                          @display {label: "TTL (s)"} int expirationPeriodSeconds)
                          returns @display {label: "Result"} string | error {
        return <string>java:toString(check setEx(self.datasource, java:fromString(key), java:fromString(value),
        expirationPeriodSeconds));

    }

    # Set value of a key, only if key does not exist.
    #
    # + key - Key referring to a value
    # + value - Value to be set
    # + return - `True` if exist `False` if not or `error` if an error occurs
    @display {label: "Set Value If Absent"} 
    remote function setNx(@display {label: "Key"} string key, @display {label: "Value"} string value) 
                          returns @display {label: "Result"} boolean | error {
        return setNx(self.datasource, java:fromString(key), java:fromString(value));
    }

    # Overwrite part of string at key starting at the specified offset.
    #
    # + key - Key referring to a value
    # + offset - Offset at which the value should be set
    # + value - Value to be set
    # + return - Length of the string after it was modified or `error` if an error occurs
    @display {label: "Overwrite Value From Offset"} 
    remote function setRange(@display {label: "Key"} string key, 
                             @display {label: "Start Position"} int offset,
                             @display {label: "Value"} string value) 
                             returns @display {label: "Result String Length"} int | error {
        return setRange(self.datasource, java:fromString(key), offset, java:fromString(value));
    }

    # Get length of value stored in a key.
    #
    # + key - Key referring to a value
    # + return - Length of string at key, or 0 when key does not exist or `error` if an error occurs
    @display {label: "Get String Length"} 
    remote function strln(@display {label: "Key"} string key) 
                          returns @display {label: "String Length"} int | error {
        return strln(self.datasource, java:fromString(key));
    }

    // list operations

    # Prepend one or multiple values to list.
    #
    # + key - Key referring to a value
    # + values - Values to be prepended
    # + return - Length of list after the push operation(s) or `error` if an error occurs
    @display {label: "Push Value To List"}
    remote function lPush(@display {label: "Key"} string key, @display {label: "Values"} string[] values) 
                          returns @display {label: "List Length"} int | error {
        return lPush(self.datasource, java:fromString(key), values);
    }

    # Remove and get the first element in a list.
    #
    # + key - Key referring to a value
    # + return - Value of the first element, or nil when key does not exist or `error` if an error occurs
    @display {label: "Pop Value From List"}
    remote function lPop(@display {label: "Key"} string key) 
                         returns @display {label: "First Element Popped"} string?|error {
        return java:toString(check lPop(self.datasource, java:fromString(key)));
    }

    # Prepend one or multiple values to a list, only if the list exists.
    #
    # + key - Key referring to a value
    # + values - Values to be prepended
    # + return - Length of the list after the push operation(s)
    @display {label: "Push To Available List"}
    remote function lPushX(@display {label: "Key"} string key, @display {label: "Values"} string[] values) 
                           returns @display {label: "List Length"} int | error {
        return lPushX(self.datasource, java:fromString(key), values);
    }

    # Remove and get the first element in a list, or block until one is available.
    #
    # + timeOut - Timeout in seconds
    # + keys - Keys referring to values
    # + return - `Nil` when no element could be popped and the timeout expired. A map containing one item, with the
    #         key being  the name of the key where an element was popped and the second element  being the value of the
    #         popped element, or `error` if an error occurs
    @display {label: "Pop List First Element And Block If Absent"}
    remote function bLPop(@display {label: "Timeout (s)"} int timeOut, @display {label: "Keys"} string[] keys)
                          returns @display {label: "Key-Value Pair"} map<any> | error {
        return bLPop(self.datasource, timeOut, keys);
    }

    # Remove and get the last element in a list, or block until one is available.
    #
    # + timeOut - Timeout in seconds
    # + keys - Keys referring to values
    # + return - `nil` when no element could be popped and the timeout expired. A map containing one item, with the
    #         key being  the name of the key where an element was popped and the second element being the value of the
    #         popped element, or `error` if an error occurs
    @display {label: "Pop List Last Element And Block If Absent"}
    remote function bRPop(@display {label: "Timeout (s)"} int timeOut, @display {label: "Key Referring To a Values"} string[] keys)
                          returns @display {label: "Key-Value Pair"} map<any> | error {
        return bRPop(self.datasource, timeOut, keys);
    }

    # Get an element from list by its index.
    #
    # + key - Key referring to a value
    # + index - Index from which the element should be retrieved
    # + return - Value at the given index
    @display {label: "Get List Element By Index"}
    remote function lIndex(@display {label: "Key"} string key, @display {label: "Index"} int index) 
                           returns @display {label: "Value"} string?|error {
        return java:toString(check lIndex(self.datasource, java:fromString(key), index));
    }

    # Insert an element before or after another element in a list.
    #
    # + key - Key referring to a value
    # + before - Boolean value representing Whether element should be inserted before or after the pivot
    # + pivot - Pivot position
    # + value - Value to insert
    # + return - Length of the list after the insert operation, or -1 when the value pivot not found, or `error` if
    #           an error occurs
    @display {label: "Insert To List In Specific Position"}
    remote function lInsert(@display {label: "Key"} string key, 
                            @display {label: "Insert Before or Not"} boolean before,
                            @display {label: "Place To Insert"} string pivot, @display {label: "Value"} string value) 
                            returns @display {label: "Result List Length"} int | error {
        return lInsert(self.datasource, java:fromString(key), before, java:fromString(pivot), java:fromString(value));
    }

    # Get length of a list.
    #
    # + key - Key referring to a value
    # + return - Length of list at key or `error` if an error occurs
    @display {label: "Get List Length"}
    remote function lLen(@display {label: "Key"} string key) returns @display {label: "List Length"} int | error {
        return lLen(self.datasource, java:fromString(key));
    }

    # Get a range of elements from a list.
    #
    # + key - Key referring to a value
    # + startPos - Begining index of the range
    # + stopPos - Last index of the range
    # + return - Array of elements in the specified range or `error` if an error occurs
    @display {label: "Get Range of List Elements"}
    remote function lRange(@display {label: "Key"} string key, @display {label: "Start Position"} int startPos, 
                           @display {label: "End Position"} int stopPos) 
                           returns @display {label: "Elements In Range"} string[] | error {
        return lRange(self.datasource, java:fromString(key), startPos, stopPos);
    }

    # Remove elements from list.
    #
    # + key - Key referring to a value
    # + count - Number of elements to be removed
    # + value - Value which the elements to be removed should be equal to
    # + return - Number of elements removed or `error` if an error occurs
    @display {label: "Remove List Elements"}
    remote function lRem(@display {label: "Key"} string key, @display {label: "Member Count"} int count, 
                         @display {label: "Value"} string value) 
                         returns @display {label: "Removed Member Count"} int | error {
        return lRem(self.datasource, java:fromString(key), count, java:fromString(value));
    }

    # Set the value of an element in a list by its index.
    #
    # + key - Key of the list
    # + index - Index of the element of which the value needs to be set
    # + value - Value to be set
    # + return - String with the value `OK` if the operation was successful or `error` if an error occurs
    @display {label: "Set List Element At Index"}
    remote function lSet(@display {label: "Key"} string key, @display {label: "Index"} int index, 
                         @display {label: "Value"} string value) 
                         returns @display {label: "Result"} string | error {
        return <string>java:toString(check lSet(self.datasource, java:fromString(key), index, java:fromString(value)));
    }

    # Trim list to the specified range.
    #
    # + key - Key of the list
    # + startPos - Starting index of the range
    # + stopPos - End index of the range
    # + return - String with the value `OK` if the operation was successful
    @display {label: "Trim List To Range"}
    remote function lTrim(@display {label: "Key"} string key, @display {label: "Start Position"} int startPos, 
                          @display {label: "End Position"} int stopPos) 
                          returns @display {label: "Result"} string | error {
        return <string>java:toString(check lTrim(self.datasource, java:fromString(key), startPos, stopPos));
    }

    # Remove and get the last element in a list.
    #
    # + key - Key of the list
    # + return - Value of the last element, or `nil` when key does not exist or `error` if an error occurs
    @display {label: "Pop List Last Element"}
    remote function rPop(@display {label: "Key"} string key) 
                         returns @display {label: "Popped Value"} string?|error {
        return java:toString(check rPop(self.datasource, java:fromString(key)));
    }

    # Remove the last element in a list, append it to another list and return it.
    #
    # + src - Source key
    # + destination - Destination key
    # + return - Element being popped and pushed or `error` if an error occurs
    @display {label: "Move List Last Element To Another"}
    remote function rPopLPush(@display {label: "Current Key"} string src, 
                              @display {label: "Destination Key"} string destination) 
                              returns @display {label: "Value"} string | error {
        return <string>java:toString(check rPopLPush(self.datasource, java:fromString(src),
        java:fromString(destination)));
    }

    # Append one or multiple values to a list.
    #
    # + key - Key of the list
    # + values - Array of values to be appended
    # + return - Length of the list after the push operation or `error` if an error occurs
    @display {label: "Enrich Values To List"}
    remote function rPush(@display {label: "Key"} string key, @display {label: "Values"} string[] values) 
                          returns @display {label: "List Length"} int | error {
        return rPush(self.datasource, java:fromString(key), values);
    }

    # Append one or multiple values to a list, only if the list exists.
    #
    # + key - Key of the list
    # + values - Array of values to be appended
    # + return - Length of the list after the push operation or `error` if an error occurs
    @display {label: "Enrich Values To List If Exists"}
    remote function rPushX(@display {label: "Key"} string key, @display {label: "Values"} string[] values) 
                           returns @display {label: "List Length"} int | error {
        return rPushX(self.datasource, java:fromString(key), values);
    }

    // Set Commands

    # Add one or more members to a set.
    #
    # + key - Key of the set
    # + values - Array of values to be added
    # + return - Number of elements that were added to the set, not including all the elements which were
    #            already present in the set, or `error` if an error occurs
    @display {label: "Add Members To Set"}
    remote function sAdd(@display {label: "Key"} string key, @display {label: "Values"} string[] values) 
                         returns @display {label: "Number of Elements Added"} int | error {
        return sAdd(self.datasource, java:fromString(key), values);
    }

    # Get the number of members in a set
    #
    # + key - Key of the set
    # + return - Cardinality (number of elements) of the set or `error` if an error occurs
    @display {label: "Get Member Count In Set"}
    remote function sCard(@display {label: "Key"} string key) 
                          returns @display {label: "Elements In Set"} int | error {
        return sCard(self.datasource, java:fromString(key));
    }

    # Return set resulting from the difference between the first set and all the successive sets
    #
    # + keys - The keys of the sets
    # + return - An array of members of the resulting set or `error` if an error occurs
    @display {label: "Get Difference of Set"}
    remote function sDiff(@display {label: "Keys"} string[] keys) 
                          returns @display {label: "Members"} string[] | error {
        return sDiff(self.datasource, keys);
    }

    # Obtain the set resulting from the difference between the first set and all the successive.
    # sets and store at the provided destination.
    #
    # + destination - Destination key of the resulting set
    # + keys - Keys of the sets to find the difference of
    # + return - Number of members in the resulting set or `error` if an error occurs
    @display {label: "Set Difference of Set"}
    remote function sDiffStore(@display {label: "Destination Key"} string destination, 
                               @display {label: "Keys"} string[] keys) 
                               returns @display {label: "Member Count"} int | error {
        return sDiffStore(self.datasource, java:fromString(destination), keys);
    }

    # Return the intersection of the provided sets.
    #
    # + keys - Keys of the sets to be intersected
    # + return - Array of members of the resulting set or `error` if an error occurs
    @display {label: "Get Intersections of Sets"}
    remote function sInter(@display {label: "Keys"} string[] keys) 
                           returns @display {label: "Members"} string[] | error {
        return sInter(self.datasource, keys);
    }

    # Obtain the intersection of the provided sets and store at the provided destination.
    #
    # + destination - Destination key of the resulting set
    # + keys - Keys of the sets to be intersected
    # + return - Number of members of the resulting set or `error` if an error occurs
    @display {label: "Set Intersections of Sets"}
    remote function sInterStore(@display {label: "Destination Key"} string destination, 
                                @display {label: "Keys"} string[] keys) 
                                returns @display {label: "Member Count"} int | error {
        return sInterStore(self.datasource, java:fromString(destination), keys);
    }

    # Determine if a given value is a member of a set.
    #
    # + key - Key of the set
    # + value - Value of a key
    # + return - boolean true/false depending on whether the value is a member of the set or not, or `error` if an error
    #            occurs
    @display {label: "Check Value In Set"}
    remote function sIsMember(@display {label: "Key"} string key, @display {label: "Value"} string value) 
                              returns @display {label: "Result"} boolean | error {
        return sIsMember(self.datasource, java:fromString(key), java:fromString(value));
    }

    # Get all members in a set.
    #
    # + key - Key of the set
    # + return - Array of all members in the set or `error` if an error occurs
    @display {label: "Get Members In Set"}
    remote function sMembers(@display {label: "Key"} string key) 
                             returns @display {label: "Members"} string[] | error {
        return sMembers(self.datasource, java:fromString(key));
    }

    # Move a member from one set to another.
    #
    # + src - Source key
    # + destination - Destination key
    # + member - Member to be moved
    # + return - `True` if the element is moved. `false` if the element is not a member of source and no
    #             operation was performed or `error` if an error occurs
    @display {label: "Move Member Between Sets"}
    remote function sMove(@display {label: "Source Key"} string src, 
                          @display {label: "Destination Key"} string destination, 
                          @display {label: "Member"} string member) 
                          returns @display {label: "Result"} boolean | error {
        return sMove(self.datasource, java:fromString(src), java:fromString(destination), java:fromString(member));
    }


    # Remove and return a random member from a set.
    #
    # + key - Source key
    # + count - Number of members to pop
    # + return - Array of removed elements or `nil` if key does not exist or `error` if an error occurs
    @display {label: "Pop Set Random Member"}
    remote function sPop(@display {label: "Key"} string key, @display {label: "Member Count"} int count) 
                         returns @display {label: "Removed Elements"} string[]?|error {
        handle|string[]|error result = sPop(self.datasource, java:fromString(key), count);
        if (result is handle) {
            return ();
        } else if (result is string[]) {
            return result;
        } else {
            return result;
        }
    }

    # Get one or multiple random members from a set.
    #
    # + key - Key of the set
    # + count - Number of members to obtain
    # + return - Array of the randomly selected elements, or `nil` when key does not exist or `error` if an error occurs
    @display {label: "Get Random Members In Set"}
    remote function sRandMember(@display {label: "Key"} string key, @display {label: "Member Count"} int count) 
                                returns @display {label: "Elements"} string[] | error {
        return sMembers(self.datasource, java:fromString(key));
    }

    # Remove one or more members from a set.
    #
    # + key - Key of the set
    # + members - Array of members to remove
    # + return - Number of members that were removed from the set, not including non existing members or `error` if
    #            an error occurs
    @display {label: "Remove Members In Set"}
    remote function sRem(@display {label: "Key"} string key, @display {label: "Members"} string[] members) 
                         returns @display {label: "Member Count"} int | error {
        return sRem(self.datasource, java:fromString(key), members);
    }

    # Return the union of multiple sets.
    #
    # + keys - Array of keys of sets
    # + return - Array of members of the resulting set or `error` if an error occurs
    @display {label: "Get Multiple Sets Union"}
    remote function sUnion(@display {label: "Keys"} string[] keys) 
                           returns @display {label: "Members"} string[] | error {
        return sUnion(self.datasource, keys);
    }

    # Return the union of multiple sets.
    #
    # + destination - Destination key of the resulting set
    # + keys - Array of keys of sets
    # + return - Number of members of the resulting set or `error` if an error occurs
    @display {label: "Set Multiple Sets Union"}
    remote function sUnionStore(@display {label: "Destination Key"} string destination,
                                @display {label: "Keys"} string[] keys) 
                                returns @display {label: "Member Count"} int | error {
        return sUnionStore(self.datasource, java:fromString(destination), keys);
    }

    // Sorted set Commands

    # Add one or more members to a sorted set, or update its score if it already exist.
    #
    # + key - Key of the sorted set
    # + memberScoreMap - Map of members and corresponding scores
    # + return - Number of elements that were added to the sorted set, not including all the elements which were
    #            already present in the set for which the score was updated, or `error` if an error occurs
    @display {label: "Set Sorted Set Members"} 
    remote function zAdd(@display {label: "Key"} string key, 
                         @display {label: "Member-Value Pairs"} map<any> memberScoreMap) 
                         returns @display {label: "Added Member Count"} int | error {
        return zAdd(self.datasource, java:fromString(key), memberScoreMap);
    }

    # Get the number of members in a sorted set.
    #
    # + key - Key of the sorted set
    # + return - Cardinality (number of elements) of the sorted set or `error` if an error occurs
    @display {label: "Get Sorted Set Member Count"}
    remote function zCard(@display {label: "Key"} string key) 
                          returns @display {label: "Member Count"} int | error {
        return zCard(self.datasource, java:fromString(key));
    }

    # Count the members in a sorted set with scores within the given range.
    #
    # + key - Key of the sorted set
    # + min - Minimum score of the range
    # + max - Maximum score of the range
    # + return - Number of elements in the specified score range or `error` if an error occurs
    @display {label: "Get Sorted Set Member Count (By Range)"}
    remote function zCount(@display {label: "Key"} string key, @display {label: "Minimum Value"} float min, 
                           @display {label: "Maximum Value"} float max) 
                           returns @display {label: "Member Count"} int | error {
        return zCount(self.datasource, java:fromString(key), min, max);
    }

    # Increment the score of a member in a sorted set.
    #
    # + key - Key of the sorted set
    # + amount - Amount to increment
    # + member - Member whose score to be incremented
    # + return - New score of the member or `error` if an error occurs
    @display {label: "Increment Sorted Set Member"}
    remote function zIncrBy(@display {label: "Key"} string key, @display {label: "Value"} float amount, 
                            @display {label: "Member"} string member) 
                            returns @display {label: "Incremented Member Score"} float | error {
        return zIncrBy(self.datasource, java:fromString(key), amount, java:fromString(member));
    }

    # Intersect multiple sorted sets and store the resulting sorted set in a new key.
    #
    # + destination - Destination key of the resulting sorted set
    # + keys - Keys of the sorted sets to be intersected
    # + return - Number of elements in the resulting sorted set or `error` if an error occurs
    @display {label: "Get Member Count (Sorted Sets Intersection)"}
    remote function zInterStore(@display {label: "Destination Key"} string destination, 
                                @display {label: "Keys"} string[] keys) 
                                returns @display {label: "Member Count"} int | error {
        return zInterStore(self.datasource, java:fromString(destination), keys);
    }

    # Count the members in a sorted set within the given lexicographical range.
    #
    # + key - Key of the sorted set
    # + min - Minimum lexicographical value of the range
    # + max - Maximum lexicographical value of the range
    # + return - Number of elements in the specified lexicographical value range or `error` if an error occurs
    @display {label: "Get Member Count (Lexicographical Range)"}
    remote function zLexCount(@display {label: "Key"} string key, @display {label: "Minimum Value"} string min, 
                              @display {label: "Maximum Value"} string max) 
                              returns @display {label: "Member Count"} int | error {
        return zLexCount(self.datasource, java:fromString(key), java:fromString(min), java:fromString(max));
    }

    # Return a range of members in a sorted set, by index.
    #
    # + key - Key of the sorted set
    # + min - Minimum index of the range
    # + max - Maximum index of the range
    # + return - Range of members in a sorted set, by index, or `error` if an error occurs
    @display {label: "Get Sorted Set Members (By Index Range)"}
    remote function zRange(@display {label: "Key"} string key, @display {label: "Minimum Index"} int min, 
                           @display {label: "Maximum Index"} int max) 
                           returns @display {label: "Members"} string[] | error {
        return zRange(self.datasource, java:fromString(key), min, max);
    }

    # Return a range of members in a sorted set, by lexicographical range from lowest to highest.
    #
    # + key - Key of the sorted set
    # + min - Minimum lexicographical value of the range
    # + max - Maximum lexicographical value of the range
    # + return - Array of members in the specified lexicographical value range ordered from lowest to highest or `error`
    #            if an error occurs
    @display {label: "Get Sorted Set Members From Lowest (By Lexicographical Range)"}
    remote function zRangeByLex(@display {label: "Key"} string key, @display {label: "Minimum Value"} string min, 
                                @display {label: "Maximum Value"} string max) 
                                returns @display {label: "Members"} string[] | error {
        return zRangeByLex(self.datasource, java:fromString(key), java:fromString(min), java:fromString(max));
    }

    # Return a range of members in a sorted set, by lexicographical range ordered from highest to
    # lowest.
    #
    # + key - Key of the sorted set
    # + min - Lexicographical value of the range
    # + max - Maximum lexicographical value of the range
    # + return - Array of members in the specified lexicographical value range ordered from highest to lowest or `error`
    #            if an error occurs
    @display {label: "Get Sorted Set Members From Highest (By Lexicographical Range)"}
    remote function zRevRangeByLex(@display {label: "Key"} string key, @display {label: "Minimum Value"} string min, 
                                   @display {label: "Maximum Value"} string max) 
                                   returns @display {label: "Members"} string[] | error {
        return zRevRangeByLex(self.datasource, java:fromString(key), java:fromString(min), java:fromString(max));
    }

    # Return a range of members in a sorted set, by score from lowest to highest.
    #
    # + key - Key of sorted set
    # + min - Minimum score of range
    # + max - Maximum score of range
    # + return - Array of members in the specified score range ordered from lowest to highest or `error` if an error
    #            occurs
    @display {label: "Get Sorted Set Members (By Score Range)"}
    remote function zRangeByScore(@display {label: "Key"} string key, @display {label: "Minimum Value"} float min, 
                                  @display {label: "Maximum Value"} float max) 
                                  returns @display {label: "Members"} string[] | error {
        return zRangeByScore(self.datasource, java:fromString(key), min, max);
    }

    # Determine index of a member in a sorted set.
    #
    # + key - Key of the sorted set
    # + member - Member of which the index needs to be obtained
    # + return - Index of the member or `error` if an error occurs
    @display {label: "Get Sorted Set Member Index"}
    remote function zRank(@display {label: "Key"} string key, @display {label: "Member"} string member) 
                          returns @display {label: "Index"} int | error {
        return zRank(self.datasource, java:fromString(key), java:fromString(member));
    }

    # Remove one or more members from a sorted set
    #
    # + key - Key of the sorted set
    # + members - Members to be removed
    # + return - Number of members removed from the sorted set, not including non existing members or `error` if an
    #            error occurs
    @display {label: "Remove Sorted Set Members"}
    remote function zRem(@display {label: "Key"} string key, @display {label: "Members"} string[] members) 
                         returns @display {label: "Removed Member Count"} int | error {
        return zRem(self.datasource, java:fromString(key), members);
    }


    # Remove all members in a sorted set between the given lexicographical range.
    #
    # + key - Key of the sorted set
    # + min - Minimum lexicographical value of the range
    # + max - Maximum lexicographical value of the range
    # + return - Number of members removed from the sorted set or `error` if an error occurs
    @display {label: "Deleted Member Count Between Lexicographical Range"}
    remote function zRemRangeByLex(@display {label: "Key"} string key, @display {label: "Minimum Value"} string min, 
                                   @display {label: "Maximum Value"} string max) 
                                   returns @display {label: "Removed Member Count"} int | error {
        return zRemRangeByLex(self.datasource, java:fromString(key), java:fromString(min), java:fromString(max));
    }

    # Remove all members in a sorted set within the given indices.
    #
    # + key - Key of the sorted set
    # + min - Minimum index of the range
    # + max - Maximum index of the range
    # + return - Number of members removed from the sorted set or `error` if an error occurs
    @display {label: "Deleted Member Count Between Indexes"}
    remote function zRemRangeByRank(@display {label: "Key"} string key, @display {label: "Minimum Index"} int min, 
                                    @display {label: "Maximum Index"} int max) 
                                    returns @display {label: "Removed Member Count"} int | error {
        return zRemRangeByRank(self.datasource, java:fromString(key), min, max);
    }

    # Remove all members in a sorted set within the given scores.
    #
    # + key - Key of the sorted set
    # + min - Minimum score of the range
    # + max - Maximum score of the range
    # + return - Number of members removed from the sorted set or `error` if an error occurs
    @display {label: "Deleted Member Count Between Scores"}
    remote function zRemRangeByScore(@display {label: "Key"} string key, @display {label: "Minimum Value"} float min, 
                                     @display {label: "Maximum Value"} float max) 
                                     returns @display {label: "Removed Member Count"} int | error {
        return zRemRangeByScore(self.datasource, java:fromString(key), min, max);
    }

    # Return a range of members in a sorted set, by index, ordered highest to lowest.
    #
    # + key - Key of the sorted set
    # + min - Minimum index of the range
    # + max - Maximum index of the range
    # + return - Number of elements in the specified index range or `error` if an error occurs
    @display {label: "Get Members (By Index Range)"}
    remote function zRevRange(@display {label: "Key"} string key, @display {label: "Minimum Index"} int min, 
                              @display {label: "Maximum Index"} int max) 
                              returns @display {label: "Members"} string[] | error {
        return zRevRange(self.datasource, java:fromString(key), min, max);
    }

    # Return a range of members in a sorted set, by score from highest to lowest.
    #
    # + key - Key of the sorted set
    # + min - Minimum score of the range
    # + max - Maximum score of the range
    # + return - Array of members in the specified score range ordered from highest to lowest or `error` if an error
    #            occurs
    @display {label: "Get Members (By Score Range)"}
    remote function zRevRangeByScore(@display {label: "Key"} string key, @display {label: "Minimum Value"} float min, 
                                     @display {label: "Maximum Value"} float max) 
                                     returns @display {label: "Members"} string[] | error {
        return zRevRangeByScore(self.datasource, java:fromString(key), min, max);
    }

    # Determine the index of a member in a sorted set
    #
    # + key - Key of the sorted set
    # + member - Member of which the index needs to be obtained
    # + return - Index of the member or `error` if an error occurs
    @display {label: "Get Sorted Set Member Index"}
    remote function zRevRank(@display {label: "Key"} string key, @display {label: "Member"} string member) 
                             returns @display {label: "Index"} int | error {
        return zRevRank(self.datasource, java:fromString(key), java:fromString(member));
    }

    # Determine the score of a member in a sorted set
    #
    # + key - Key of the sorted set
    # + member - Member of which the score needs to be obtained
    # + return - Score of the member or `error` if an error occurs
    @display {label: "Get Sorted Set Member Score"}
    remote function zScore(@display {label: "Key"} string key, @display {label: "Member"} string member) 
                           returns @display {label: "Score"} float | error {
        return zScore(self.datasource, java:fromString(key), java:fromString(member));
    }

    # Return the union of multiple sorted sets
    #
    # + destination - Destination key of the resulting set
    # + keys - Array of keys of sorted sets
    # + return - Number of members of the resulting sorted set or `error` if an error occurs
    @display {label: "Get Sorted Sets Union"}
    remote function zUnionStore(@display {label: "Destination Key"} string destination, 
                                @display {label: "Keys"} string[] keys) 
                                returns @display {label: "Member Count"} int | error {
        return zUnionStore(self.datasource, java:fromString(destination), keys);
    }

    // Hash Commands

    # Delete one or more hash fields.
    #
    # + key - Key of the hash
    # + fields - Array of fields to be deleted
    # + return - Number of fields that were removed from the hash, not including specified but non existing fields or
    #            `error` if an error occurs
    @display {label: "Delete Hash Fields"}
    remote function hDel(@display {label: "Key"} string key, @display {label: "Fields"} string[] fields) 
                         returns @display {label: "Deleted Fields Count"} int | error {
        return hDel(self.datasource, java:fromString(key), fields);
    }

    # Determine if a hash field exists.
    #
    # + key - Key of the hash
    # + field - Array of fields to be deleted
    # + return - Boolean `true` if the hash contains the field. boolean false if the hash does not contain
    #            field or key does not exist or `error` if an error occurs
    @display {label: "Check Hash Field Availability"}
    remote function hExists(@display {label: "Key"} string key, @display {label: "Field"} string 'field) 
                            returns @display {label: "Result"} boolean | error {
        return hExists(self.datasource, java:fromString(key), java:fromString('field));
    }

    # Get the value of a hash field.
    #
    # + key - Key of the hash
    # + field - Field in the hash
    # + return - Value of the field or `error` if an error occurs
    @display {label: "Get Hash Field Value"} 
    remote function hGet(@display {label: "Key"} string key, @display {label: "Field"} string 'field) 
                         returns @display {label: "Value of Field"} string | error {
        return <string>java:toString(check hGet(self.datasource, java:fromString(key), java:fromString('field)));
    }

    # Get the all values of a hash.
    #
    # + key - Key of the hash
    # + return - Map of field-value pairs or `error` if an error occurs
    @display {label: "Get Hash Values"} 
    remote function hGetAll(@display {label: "Key"} string key) 
                            returns @display {label: "Field-value Pairs"} map<any> | error {
        return hGetAll(self.datasource, java:fromString(key));
    }

    # Increment the integer value of a hash field by the given number.
    #
    # + key - Key of the hash
    # + field - Field in the hash
    # + amount - Amount to increment
    # + return - Value of the field or `error` if an error occurs
    @display {label: "Increment Hash Field (By Number)"}
    remote function hIncrBy(@display {label: "Key"} string key, @display {label: "Field"} string 'field, 
                            @display {label: "Increment Value"} int amount) 
                            returns @display {label: "Incremented Value"} int | error {
        return hIncrBy(self.datasource, java:fromString(key), java:fromString('field), amount);
    }

    # Increment the float value of a hash field by the given number.
    #
    # + key - Key of the hash
    # + field - Field in the hash
    # + amount - Amount to increment
    # + return - Value of the field or `error` if an error occurs
    @display {label: "Increment Hash Field (By Float)"}
    remote function hIncrByFloat(@display {label: "Key"} string key, @display {label: "Field"} string 'field, 
                                 @display {label: "Value To Increment"} float amount)
                                 returns @display {label: "Incremented Value"} float | error {
        return hIncrByFloat(self.datasource, java:fromString(key), java:fromString('field), amount);
    }

    # Get all the fields in a hash.
    #
    # + key - Key of the hash
    # + return - Array of hash fields or `error` if an error occurs
    @display {label: "Get Hash Fields"} 
    remote function hKeys(@display {label: "Key"} string key) 
                          returns @display {label: "Hash Fields"} string[] | error {
        return hKeys(self.datasource, java:fromString(key));
    }

    # Get the number of fields in a hash.
    #
    # + key - Key of the hash
    # + return - Number of fields or `error` if an error occurs
    @display {label: "Get Hash Fields Count"} 
    remote function hLen(@display {label: "Key"} string key) 
                         returns @display {label: "Number of hash fields"} int | error {
        return hLen(self.datasource, java:fromString(key));
    }

    # Get the values of all the given hash fields.
    #
    # + key - Key of the hash
    # + fields - Array of hash fields
    # + return - Map of field-value pairs or `error` if an error occurs
    @display {label: "Get Hash Fields Values"} 
    remote function hMGet(@display {label: "Key"} string key, @display {label: "Fields"} string[] fields) 
                          returns @display {label: "Field-Value Pairs"} map<any> | error {
        return hMGet(self.datasource, java:fromString(key), fields);
    }

    # Set multiple hash fields to multiple values.
    #
    # + key - Key of the hash
    # + fieldValueMap - Map of field-value pairs
    # + return - String with the value `OK` if the operation was successful, or `error` if an error occurs
    @display {label: "Set Hash Fields"} 
    remote function hMSet(@display {label: "Key"} string key, 
                          @display {label: "Field-Value Pairs"} map<any> fieldValueMap) 
                          returns @display {label: "Result"} string | error {
        return <string>java:toString(check hMSet(self.datasource, java:fromString(key), fieldValueMap));
    }

    # Set the string value of a hash field.
    #
    # + key - Key of the hash
    # + field - Field in the hash
    # + value - Value to be set to the field
    # + return - Boolean `true` if field is a new field in the hash and value was set. boolean false if
    #         field already exists in the hash and the value was updated, or `error` if an error occurs
    @display {label: "Set Hash Field"} 
    remote function hSet(@display {label: "Key"} string key, @display {label: "Hash Field"} string 'field,
                         @display {label: "Value"} string value) returns @display {label: "Result"} boolean | error {
        return hSet(self.datasource, java:fromString(key), java:fromString('field), java:fromString(value));
    }

    # Set the string value of a hash field, only if the field does not exist.
    #
    # + key - Key of the hash
    # + field - Field in the hash
    # + value - Value to be set to the field
    # + return - Boolean `true` if field is a new field in the hash and value was set. boolean false if
    #            field already exists in the hash and no operation was performed, or `error` if an error occurs
    @display {label: "Set Hash Field If Absent"} 
    remote function hSetNx(@display {label: "Key"} string key, @display {label: "Hash Field"} string 'field, 
                           @display {label: "Value"} string value) returns @display {label: "Result"} boolean | error {
        return hSetNx(self.datasource, java:fromString(key), java:fromString('field), java:fromString(value));
    }

    # Get the string length of the field value in a hash.
    #
    # + key - Key of the hash
    # + field - Field in the hash
    # + return - Length of the field value, or 0 when field is not present in the hash or key does
    #            not exist at all, or `error` if an error occurs
    @display {label: "Get Value String Length"}
    remote function hStrln(@display {label: "Key"} string key, @display {label: "Hash Field"} string 'field) 
                           returns @display {label: "String Length"} int | error {
        return hStrln(self.datasource, java:fromString(key), java:fromString('field));
    }

    # Get all the values in a hash.
    #
    # + key - Key of the hash
    # + return - Array of values in the hash, or an empty array when key does not exist or `error` if an error occurs
    @display {label: "Get Values In Hash"}
    remote function hVals(@display {label: "Key"} string key) 
                          returns @display {label: "Values"} string[] | error {
        return hVals(self.datasource, java:fromString(key));
    }

    // Key Commands

    # Delete one or more keys.
    #
    # + keys - Key to be deleted
    # + return - Number of keys that were removed
    @display {label: "Delete Keys"}
    remote function del(@display {label: "Keys"} string[] keys) 
                        returns @display {label: "Number of keys deleted"} int | error {
        return del(self.datasource, keys);
    }

    # Determine how many keys exist.
    #
    # + keys - Keys of which existence to be found out
    # + return - Number of existing keys or `error` if an error occurs
    @display {label: "Check Keys"}
    remote function exists(@display {label: "Keys"} string[] keys) 
                           returns @display {label: "Number of Keys Exists"} int|error {
        return exists(self.datasource, keys);
    }

    # Set a key's time to live in seconds.
    #
    # + key - Keys of which expiry time to be set
    # + seconds - Expiry in seconds
    # + return - Boolean `true` if the timeout was set. false if key does not exist or the timeout could not be set or
    # `error` if an error occurs
    @display {label: "Set TTL (s)"}
    remote function expire(@display {label: "Key"} string key, @display {label: "TTL (s)"} int seconds)
                           returns @display {label: "Result"} boolean | error {
        return expire(self.datasource, java:fromString(key), seconds);
    }

    # Find all keys matching the given pattern.
    #
    # + pattern - Pattern to match
    # + return - Array of keys matching the given pattern or `error` if an error occurs
    @display {label: "Get Matching Keys"}
    remote function keys(@display {label: "Pattern String"} string pattern) 
                         returns @display {label: "Keys"} string[] | error {
        return keys(self.datasource, java:fromString(pattern));
    }

    # Move a key to another database.
    #
    # + key - Key to be moved
    # + database - Database to which the key needs to be moved
    # + return - Boolean true if key was succesfully moved, boolean false otherwise or `error` if an error occurs
    @display {label: "Move Key"}
    remote function move(@display {label: "Key"} string key, 
                         @display {label: "Destination Database"} int database) 
                         returns @display {label: "Result"} boolean | error {
        return move(self.datasource, java:fromString(key), database);
    }

    # Remove the expiration from a key.
    #
    # + key - Key of which expiry time should be removed
    # + return - Boolean `true` if the timeout was removed. boolean `false` if key does not exist or does not have
    #            an associated timeout, or `error` if an error occurs
    @display {label: "Remove Key Timeout"}
    remote function persist(@display {label: "Key"} string key) returns @display {label: "Result"} boolean | error {
        return persist(self.datasource, java:fromString(key));
    }

    # Set a key's time to live in milliseconds.
    #
    # + key - Key of which expiry time should be removed
    # + timeMilliSeconds - Expiry time in milli seconds
    # + return - Boolean `true` if the timeout was set. boolean false if key does not exist or the timeout could not
    #         be set, or `error` if an error occurs
    @display {label: "Set TTL (ms)"}
    remote function pExpire(@display {label: "Key"} string key, 
                            @display {label: "TTL (ms)"} int timeMilliSeconds)
                            returns @display {label: "Result"} boolean | error {
        return pExpire(self.datasource, java:fromString(key), timeMilliSeconds);
    }

    # Get the time to live for a key in milliseconds.
    #
    # + key - Key of which time-to-live should be obtained
    # + return - TTL of the key, in milli seconds or `error` if an error occurs
    @display {label: "Get TTL (ms)"}
    remote function pTtl(@display {label: "Key"} string key) 
                         returns @display {label: "TTL (ms)"} int | error {
        return pTtl(self.datasource, java:fromString(key));
    }

    # Return a random key from the keyspace.
    #
    # + return - Random key, or `nil` when the database is empty or `error` if an error occurs
    @display {label: "Get Random Key"}
    remote function randomKey() returns @display {label: "Key"} string?|error {
        return java:toString(check randomKey(self.datasource));
    }

    # Rename a key.
    #
    # + key - Key to be renamed
    # + newName - New name of the key
    # + return - String with the value `OK` if the operation was successful or `error` if an error occurs
    @display {label: "Rename Key"}
    remote function rename(@display {label: "Key"} string key, @display {label: "New Key Name"} string newName)
                           returns @display {label: "Result"} string | error {
        return <string>java:toString(check rename(self.datasource, java:fromString(key), java:fromString(newName)));
    }

    # Rename a key, only if the new key does not exist.
    #
    # + key - Key to be renamed
    # + newName - New name of the key
    # + return - Boolean `true` if key was renamed to newkey. boolean `false` if newkey already exists. Or `error` if an
    #            error occurs
    @display {label: "Rename Key If Absent"}
    remote function renameNx(@display {label: "Key"} string key, @display {label: "New Key Name"} string newName)
                             returns @display {label: "Result"} boolean | error {
        return renameNx(self.datasource, java:fromString(key), java:fromString(newName));
    }

    # Sort elements in a list, set or sorted set.
    #
    # + key - Key of the data typeure to be sorted
    # + return - Sorted array containing the members of the sorted data type or `error` if an error occurs
    @display {label: "Sort Elements"}
    remote function sort(@display {label: "Key"} string key) 
                         returns @display {label: "Sorted Members"} string[] | error {
        return sort(self.datasource, java:fromString(key));
    }

    # Get the time to live for a key.
    #
    # + key - Key of which the time to live needs to be obtained
    # + return - Time to live in seconds or a negative value/`error` in order to signal an error in evaluating ttl.
    #         Whether it is a negative value of an `error` would differ depending on whether the error occurs at DB
    #         level or the driver level
    @display {label: "Get Key TTL"}
    remote function ttl(@display {label: "Key"} string key) 
                        returns @display {label: "TTL (s)"} int | error {
        return ttl(self.datasource, java:fromString(key));
    }

    # Determine the type stored at key.
    #
    # + key - Key of which the type needs to be obtained
    # + return - Type stored at key
    @display {label: "Get Key Type"}
    remote function redisType(@display {label: "Key"} string key) 
                              returns @display {label: "Type Of Key"} string | error {
        return <string>java:toString(check redisType(self.datasource, java:fromString(key)));
    }

    // Connection commands

    # Ping the server.
    # 
    # + return - String with the value `PONG` if the operation was successful
    @display {label: "Ping the server"}
    remote function ping() returns @display {label: "Result"} string|error {
        var result = ping(self.datasource); 
        if (result is handle) {
            return <string>java:toString(result);
        } else {
            return result;
        }
    }

    # Authenticate to the server.
    #
    # + password - Password to authenticate
    # + return - String with the value `OK` if the operation was successful or `error` if an error occurs
    @display {label: "Authenticate Server"}
    remote function auth(@display {label: "Password"} string password) 
                         returns @display {label: "Result"} string | error {
        return <string>java:toString(check auth(self.datasource, java:fromString(password)));
    }

    # Echo the given string.
    #
    # + message - Message to be echo-ed
    # + return - Message itself if the operation was successful or `error` if an error occurs
    @display {label: "Echo Input String"}
    remote function echo(@display {label: "String To Echo"} string message)
                         returns @display {label: "Result"} string|error {
        var result = echo(self.datasource, java:fromString(message)); 
        if (result is handle) {
            return <string>java:toString(result);
        } else {
            return result;
        }
    }

    # Stops the registered service.
    public function stop() {
        close(self.datasource);
    }
}

# Initialize redis client.
#
# + clientEndpointConfig - Client end point configuration
# + return - `error` if error occurs
function initClient(ClientEndpointConfiguration clientEndpointConfig) returns handle = @java:Method {
    'class: "org.ballerinalang.redis.endpoint.InitRedisClient"
} external;

# An internal function used by clients to shutdown the connection/connection pool(if pooling enabled).
# 
# + datasource - data source handle
function close(handle datasource) = @java:Method {
    'class: "org.ballerinalang.redis.endpoint.Close"
} external;

function append(handle datasource, handle key, handle value) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function bitCount(handle datasource, handle key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function bitOpAnd(handle datasource, handle destination, string[] keys) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function bitOpOr(handle datasource, handle destination, string[] keys) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function bitOpNot(handle datasource, handle destination, handle key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function bitOpXor(handle datasource, handle destination, string[] keys) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function decr(handle datasource, handle key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function decrBy(handle datasource, handle key, int value) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function get(handle datasource, handle key) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function getBit(handle datasource, handle key, int offset) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function getRange(handle datasource, handle key, int startPos, int end) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function getSet(handle datasource, handle key, handle value) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function incr(handle datasource, handle key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function incrBy(handle datasource, handle key, int value) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function incrByFloat(handle datasource, handle key, float value) returns float | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

public function mGet(handle datasource, string[] keys) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

public function mSet(handle datasource, map<any> keyValueMap) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

public function mSetNx(handle datasource, map<any> keyValueMap) returns boolean | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function pSetEx(handle datasource, handle key, handle value, int expirationTime) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function set(handle datasource, handle key, handle value) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function setBit(handle datasource, handle key, int value, int offset) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function setEx(handle datasource, handle key, handle value, int expirationPeriodSeconds) returns handle | error =
@java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function setNx(handle datasource, handle key, handle value) returns boolean | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function setRange(handle datasource, handle key, int offset, handle value) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function strln(handle datasource, handle key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.StringActions"
} external;

function lPush(handle datasource, handle key, string[] values) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function lPop(handle datasource, handle key) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function lPushX(handle datasource, handle key, string[] values) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function bLPop(handle datasource, int timeOut, string[] keys) returns map<any> | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function bRPop(handle datasource, int timeOut, string[] keys) returns map<any> | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function lIndex(handle datasource, handle key, int index) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function lInsert(handle datasource, handle key, boolean before, handle pivot, handle value) returns int | error =
@java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function lLen(handle datasource, handle key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function lRange(handle datasource, handle key, int startPos, int stopPos) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function lRem(handle datasource, handle key, int count, handle value) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function lSet(handle datasource, handle key, int index, handle value) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function lTrim(handle datasource, handle key, int startPos, int stopPos) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function rPop(handle datasource, handle key) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function rPopLPush(handle datasource, handle src, handle destination) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function rPush(handle datasource, handle key, string[] values) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function rPushX(handle datasource, handle key, string[] values) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ListActions"
} external;

function sAdd(handle datasource, handle key, string[] values) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sCard(handle datasource, handle key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sDiff(handle datasource, string[] keys) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sDiffStore(handle datasource, handle destination, string[] keys) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sInter(handle datasource, string[] keys) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sInterStore(handle datasource, handle destination, string[] keys) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sIsMember(handle datasource, handle key, handle value) returns boolean | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sMembers(handle datasource, handle key) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sMove(handle datasource, handle src, handle destination, handle member) returns boolean | error =
@java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sPop(handle datasource, handle key, int count) returns handle | string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sRandMember(handle datasource, handle key, int count) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sRem(handle datasource, handle key, string[] members) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sUnion(handle datasource, string[] keys) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function sUnionStore(handle datasource, handle destination, string[] keys) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SetActions"
} external;

function zAdd(handle datasource, handle key, map<any> memberScoreMap) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zCard(handle datasource, handle key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zCount(handle datasource, handle key, float min, float max) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zIncrBy(handle datasource, handle key, float amount, handle member) returns float | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zInterStore(handle datasource, handle destination, string[] keys) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zLexCount(handle datasource, handle destination, handle min, handle max) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zRange(handle datasource, handle key, int min, int max) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zRangeByLex(handle datasource, handle key, handle min, handle max) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zRevRangeByLex(handle datasource, handle key, handle min, handle max) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zRangeByScore(handle datasource, handle key, float min, float max) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zRank(handle datasource, handle key, handle member) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zRem(handle datasource, handle key, string[] members) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zRemRangeByLex(handle datasource, handle key, handle min, handle max) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zRemRangeByRank(handle datasource, handle key, int min, int max) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zRemRangeByScore(handle datasource, handle key, float min, float max) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zRevRange(handle datasource, handle key, int min, int max) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zRevRangeByScore(handle datasource, handle key, float min, float max) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zRevRank(handle datasource, handle key, handle member) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zScore(handle datasource, handle key, handle member) returns float | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function zUnionStore(handle datasource, handle destination, string[] keys) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.SortedSetActions"
} external;

function del(handle datasource, string[] key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function exists(handle datasource, string[] key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function expire(handle datasource, handle key, int seconds) returns boolean | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function keys(handle datasource, handle pattern) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function move(handle datasource, handle key, int database) returns boolean | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function persist(handle datasource, handle key) returns boolean | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function pExpire(handle datasource, handle key, int timeMilliSeconds) returns boolean | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function pTtl(handle datasource, handle key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function randomKey(handle datasource) returns handle|error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function rename(handle datasource, handle key, handle newName) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function renameNx(handle datasource, handle key, handle newName) returns boolean | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function sort(handle datasource, handle key) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function ttl(handle datasource, handle key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function redisType(handle datasource, handle key) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.KeyActions"
} external;

function ping(handle datasource) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ConnectionActions"
} external;

function auth(handle datasource, handle password) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ConnectionActions"
} external;

function echo(handle datasource, handle message) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.ConnectionActions"
} external;

function hDel(handle datasource, handle key, string[] fields) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hExists(handle datasource, handle key, handle 'field) returns boolean | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hGet(handle datasource, handle key, handle 'field) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hGetAll(handle datasource, handle key) returns map<any> | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hIncrBy(handle datasource, handle key, handle 'field, int amount) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hIncrByFloat(handle datasource, handle key, handle 'field, float amount) returns float | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hLen(handle datasource, handle key) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hMGet(handle datasource, handle key, string[] fields) returns map<any> | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hMSet(handle datasource, handle key, map<any> fieldValueMap) returns handle | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hKeys(handle datasource, handle key) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hSet(handle datasource, handle key, handle 'field, handle value) returns boolean | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hSetNx(handle datasource, handle key, handle 'field, handle value) returns boolean | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hStrln(handle datasource, handle key, handle 'field) returns int | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

function hVals(handle datasource, handle key) returns string[] | error = @java:Method {
    'class: "org.ballerinalang.redis.actions.HashActions"
} external;

# Connection options for Redis Client Endpoint.
#
# + clientName - The clientName of the connection
# + connectionPooling - Boolean value depending on whether the connection
#   pooling is enabled or not
# + isClusterConnection - Whether to enable cluster connection or not
# + ssl - Boolean value depending on whether SSL is enabled or not
# + startTls - Boolean value depending on whether startTLS is enabled or not
# + verifyPeer - Boolean value depending on whether peer verification is
#   enabled or not
# + database - The database to be used with the connection
# + connectionTimeout - The timeout value for the connection
public type Options record {|
    @display{label: "Client Name"} 
    string clientName = "";
    @display{label: "Connection Pooling Enabled"} 
    boolean connectionPooling = false;
    @display{label: "Cluster Connection Enabled"} 
    boolean isClusterConnection = false;
    @display{label: "SSL Enabled"} 
    boolean ssl = false;
    @display{label: "STARTTLS Enabled"} 
    boolean startTls = false;
    @display{label: "Peer Verification Enabled"} 
    boolean verifyPeer = false;
    @display{label: "Database"} 
    int database = -1;
    @display{label: "Connection Timeout"} 
    int connectionTimeout = -1;
|};

# The Client endpoint configuration for Redis databases.
#
# + host - The host of the Redis database
# + password - Password for the database connection
# + options - Properties for the connection configuration
@display{label: "Connection Config"} 
public type ClientEndpointConfiguration record {|
    @display{label: "Host"} 
    string host = "localhost";
    @display{label: "Password"} 
    string password = "";
    @display{label: "Connection Options"} 
    Options options = {};
|};
