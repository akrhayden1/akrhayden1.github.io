// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyMint is ERC20 {

    string private constant tokenName = "My minting smart contract."; // You set the name.
    string private constant tokenSymbol = "MINT"; // You set the symbol.
    uint8 private constant tokenDecimals = 18; // Most tokens use 18 decimal places.
    uint256 private constant maxTokenSupply = 1000000 * (10 ** tokenDecimals); // You set the max supply.

    constructor() ERC20(tokenName, tokenSymbol) {
        // Token is created, but no initial mint.
    }

    function mint(uint256 amountToMint) public {
        uint256 currentSupply = totalSupply();

        require(
            currentSupply + amountToMint <= maxTokenSupply,
            "Minting the amount requested would exceed the max supply allowed."
        );

        _mint(msg.sender, amountToMint);
    }
}
