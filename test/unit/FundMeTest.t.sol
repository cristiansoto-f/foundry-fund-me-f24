// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";

//import {Script} from "forge-std/Script.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    // fake user that sends 1 ether
    address USER = makeAddr("user");
    uint256 STARTING_BALANCE = 1 ether;
    uint256 constant SEND_VALUE = 0.1 ether;

    //uint256 constant GAS_PRICE = 1;

    function setUp() external {
        //fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, STARTING_BALANCE);
    }

    function testMinimumDollarIsFive() public view {
        assert(fundMe.MINIMUM_USD() == 5e18);
    }

    function testOwnerIsDeployer() public view {
        console.log("owner is", address(fundMe.getOwner()));
        console.log("message sender is", address(msg.sender));
        assert(fundMe.getOwner() == address(msg.sender));
    }

    function testPriceFeedVersion() public view {
        uint256 version = fundMe.getVersion();
        console.log("version is", version);
    }

    function testFundFailsWithoutEnoughEther() public {
        vm.expectRevert();
        fundMe.fund();
    }

    function testFundUpdatesFundedDataStructure() public {
        vm.prank(USER); // The next TX will be from USER
        fundMe.fund{value: SEND_VALUE}();
        assert(fundMe.getAddresToAmountFunded(address(USER)) == SEND_VALUE);
    }

    function testAddsFunderToArrayOfFunders() public {
        vm.prank(USER); // The next TX will be from USER
        fundMe.fund{value: SEND_VALUE}();
        address funder = fundMe.getFunder(0);

        assert(funder == address(USER));
    }

    modifier funded() {
        vm.prank(USER); // The next TX will be from USER
        fundMe.fund{value: SEND_VALUE}();
        _;
    }

    function testWithdrawFailsIfNotOwner() public funded {
        //vm.prank(USER);
        vm.expectRevert();
        fundMe.withdraw();
        console.log("transaction seder is", address(msg.sender));
        console.log("owner is", address(fundMe.getOwner()));
        console.log("user address is", address(USER));
    }

    function testWithdrawWithASingleFunder() public funded {
        // arrange (set up the test)
        uint256 startingOwnerBalance = fundMe.getOwner().balance;
        uint256 startingFundMeBalance = address(fundMe).balance;

        // act (perform the test)
        vm.prank(fundMe.getOwner()); // The next TX will be from the owner
        fundMe.withdraw();

        // assert
        uint256 endingOwnerBalance = fundMe.getOwner().balance;
        uint256 endingFundMeBalance = address(fundMe).balance;
        assert(endingFundMeBalance == 0);
        assert(
            endingOwnerBalance == startingOwnerBalance + startingFundMeBalance
        );
    }

    function testWithdrawWithMultipleFunders() public funded {
        // arrange (set up the test)
        uint160 numberOfFunders = 10; // uint160 is requiered to generate addresses
        uint160 startingFunderIndex = 1;
        for (uint160 i = startingFunderIndex; i < numberOfFunders; i++) {
            // hoax does prank and deal combined
            hoax(address(i), SEND_VALUE);
            fundMe.fund{value: SEND_VALUE}();
            // fund the fundMe contract
        }

        uint256 startingOwnerBalance = fundMe.getOwner().balance;
        uint256 startingFundMeBalance = address(fundMe).balance;

        // act (perform the test)
        vm.startPrank(fundMe.getOwner());
        fundMe.withdraw();
        vm.stopPrank();

        // assert
        assert(address(fundMe).balance == 0);
        assert(
            startingFundMeBalance + startingOwnerBalance ==
                fundMe.getOwner().balance
        );
    }

    function testWithdrawWithMultipleFundersCheaper() public funded {
        // arrange (set up the test)
        uint160 numberOfFunders = 10; // uint160 is requiered to generate addresses
        uint160 startingFunderIndex = 1;
        for (uint160 i = startingFunderIndex; i < numberOfFunders; i++) {
            // hoax does prank and deal combined
            hoax(address(i), SEND_VALUE);
            fundMe.fund{value: SEND_VALUE}();
            // fund the fundMe contract
        }

        uint256 startingOwnerBalance = fundMe.getOwner().balance;
        uint256 startingFundMeBalance = address(fundMe).balance;

        // act (perform the test)
        vm.startPrank(fundMe.getOwner());
        fundMe.cheaperWithdraw();
        vm.stopPrank();

        // assert
        assert(address(fundMe).balance == 0);
        assert(
            startingFundMeBalance + startingOwnerBalance ==
                fundMe.getOwner().balance
        );
    }
}
