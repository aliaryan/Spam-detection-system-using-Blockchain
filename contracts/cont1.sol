pragma solidity 0.5.1;

contract Call_log {
    uint256 public Count = 0;
    mapping(uint => Clients) public Database;
    uint256 call_duration=0;

    address owner;
    uint256 startTime;
    
    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    modifier afterCall() {
        require(block.timestamp >= startTime);
        _;
    }

    struct Clients {
        uint _id;
        uint _call_duration;
        string _firstName;
        string _lastName;
        string _location;
        uint _flag;
    }

    constructor() public {
        owner = msg.sender;
        startTime = 1617211726; // Update this value
    }
    

    function addPerson(string memory _firstName, string memory _lastName, string memory _location) public isOwner afterCall
    {
        call_duration = block.timestamp-startTime;
        Count += 1;
        Database[Count] = Clients(Count,call_duration,_firstName, _lastName, _location,0);
    }

}