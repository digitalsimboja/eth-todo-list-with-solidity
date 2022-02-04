// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract TodoList {
    // The taskcount is a state variable and so gets stored on the Blockchain
    uint public taskCount = 0;

    // Solidity provides a data structure form called `struct` 
    // which allows us to define non-abitrary data structures

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    // we need another state variable which would be a key value mapping
    // we shall call it `tasks` which is a type of the `struct` Task to 
    // hold the tasks

    mapping(uint => Task) public tasks;

    // We need a default task which is to be created upon the initial\
    // deployment of the contract. The Solidity language provides a function
    // call Constructor which is run for the first time when the contract is 
    // deployed

    constructor() public {
        createTask("This is your first task, smile and be happy");
    }

    // Declare a function which would actually put the Task inside the mapping
    function createTask(string memory _content) public {
        taskCount ++;
        // if you look at the mapping definition of `tasks`,
        // the key is an `uint` and the value is a form of `Task` or new Task
        // so we map the tasks to new task created which is to be stored on the 
        // Blockchain
        tasks[taskCount] = Task(taskCount, _content, false);        
    }
}