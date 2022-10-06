// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

// contract address = 0x566186997327cF65ED4c7f549FBC45C711997761(ropsten)
contract auction {
    address payable assetOwner;

    mapping(address => uint) public bidders;

    uint public duration;

    uint[] public bids;

    uint public startPoint;

    uint largest;

    uint asset = 2 ether;

    address payable winner;

    uint public _time;

    function setAuction(uint timing, address payable owner, uint feePoint) external {
        assetOwner = owner;
        duration = timing;
        startPoint = feePoint;
         _time = block.timestamp;
    }

    function bid(uint amount,address payable bidder) external {
        uint clock = block.timestamp;
        require(amount > startPoint);
        require(clock < _time + duration);
        bids.push(amount);
        bidders[bidder] = amount;
        if(amount > largest) {
            largest = amount;
            winner = bidder;
        }
    }

    modifier onlyOwner() {
        require(msg.sender == assetOwner);
        _;
    }

    modifier onlyWinner() {
        require(msg.sender == winner);
        _;
    }

    function getWinner() external view onlyOwner returns(address) {
        require(block.timestamp > _time + duration);
        return winner;        
    }

    function getAsset(uint fee) external onlyWinner payable {
        require(fee == largest);
        fee = msg.value;
        assetOwner.transfer(largest);
    }

    function sendAsset() external onlyOwner payable {
        winner.transfer(asset);
    }    
}
