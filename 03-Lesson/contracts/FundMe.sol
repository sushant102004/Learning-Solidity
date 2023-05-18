// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    address[] public donators;
    mapping(address => uint256) public addressToDonator;

    AggregatorV3Interface internal priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

    uint256 minUSD = 1 * 1e18;

    function fund() payable  public {
        require(getConversionRate(msg.value) >= minUSD, "Send at least $1");
        donators.push(msg.sender);
        addressToDonator[msg.sender] = msg.value;
    }

    function getLatestPrice() public view returns (uint256) {(
            , int price, , ,
        ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getLatestPrice();
        uint256 amountInUSD = (ethPrice * ethAmount) / 1e18;
        return amountInUSD;
    }
}