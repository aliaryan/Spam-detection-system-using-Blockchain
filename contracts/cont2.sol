pragma solidity 0.5.1;
import "./caller.sol";

contract functionalities is Call_log {
    uint256 threshold;
    uint256 temp_id; string temp_firstName; string temp_lastName; string temp_location;
    
    function incrementFlag(uint _id) public {
       Clients memory _client = Database[_id];
       _client._flag++;
       threshold = _client._flag;
       Database[_id] = _client;
       if (threshold > 3){
           temp_id = _client._id;
           temp_firstName = _client._firstName;
           temp_lastName = _client._lastName;
           temp_location = _client._location;
           delete Database[_id];
           addBlacklist();
       }
    }
    mapping(uint => not_Clients) public Blacklist;
    struct not_Clients {
        uint _id;
        string _firstName;
        string _lastName;
        string _location;
    }
    
    function addBlacklist() internal{
        Blacklist[temp_id] = not_Clients(temp_id,temp_firstName, temp_lastName, temp_location);
    }
}