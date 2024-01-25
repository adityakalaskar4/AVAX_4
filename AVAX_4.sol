// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract COL_Degen is ERC20, Ownable {

    string[] public list_items = ["1.Black Token", "2. Blue NFT", "3. Yellow Tag", "4 . Green Band"];

   constructor() ERC20("COL-Degen", "DGN") Ownable(msg.sender) {}

    function Col_mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
     function Col_burn(uint amount) public {
        require(balanceOf(msg.sender) >= amount, "Can you first Mint the tokens");
        _burn(msg.sender, amount);
    }

   // To Redeem the items 
    function Col_redeem(uint to_redeem) public returns(string memory) {
    require(balanceOf(msg.sender) >= 38, "Can you first Mint the tokens");
    if(balanceOf(msg.sender) >= 120 && to_redeem == 245){
        _burn(msg.sender, 120);
        return list_items[2];
    }
    else if(balanceOf(msg.sender) >= 175 && to_redeem == 259){
        _burn(msg.sender, 175);
        return list_items[3];
    }
    else if(balanceOf(msg.sender) >= 99 && to_redeem == 345){
        _burn(msg.sender,99);
        return list_items[0];
    }
    else if(balanceOf(msg.sender) >= 125 && to_redeem == 225){
        _burn(msg.sender, 125);
        return list_items[1];
    }
    else {
        return "Type Correct Redeem Code of List items";
    }
} 
 // To Transfer the tokens into another players address
    function Col_transferX(address to, uint amount) public {
        require(balanceOf(msg.sender) >= amount, "You should have to mint the tokens to run this functions");
        approve(msg.sender, amount);
        transferFrom(msg.sender, to, amount);
    }
    function Col_BalanceStatus() public view returns(uint) {
        return balanceOf(msg.sender);
    }
    
}
