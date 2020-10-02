pragma solidity ^0.6.12;

contract Transfer {
    address payable accountOwner;

    constructor() public {
        accountOwner = 0x0F211499dBC20F7967CDf53EC3d0F4bf639cEdE2;
    }

    modifier onlyOwner() {
        require(accountOwner == msg.sender, "You are not the owner");
        _;
    }

    function depositFunds() public payable {}

    function transferFundsdonor(address payable _userAddress) public payable {
        _userAddress.transfer(msg.value);
    }

    function checkBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }

    function withdrawFunds() public onlyOwner {
        accountOwner.transfer(address(this).balance);
    }

    // function transferFunds(address payable _userAddress) public onlyOwner{
    //     _userAddress.transfer(1 ether);
    // }
}

//deployed at 0x0d98cB8643406361a8102ad8a1aCe6816Ae52518
// from account 4
