// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Ownable{
    address public owner;
    
    constructor(){
        owner = msg.sender;
    }
    modifier  onlyOwner(){
        require(msg.sender == owner,"not owner");
        _;
    }
    function transferOwnership(address _newOwner) external onlyOwner{
        require(_newOwner != address(0), "invalid address");
        owner = _newOwner;
    }

}
contract MyContract is Ownable{
    uint256 someValue;
    function setSomeValue(uint256 newValue) external onlyOwner{
        someValue = newValue;
    }
    function getValue() external view returns(uint256){
        return someValue;
    }    
}