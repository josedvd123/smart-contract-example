// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract HashUploader {

    struct Hash {
        address ownerAddress;
        uint creationDt;
    }

    mapping(bytes32 => Hash) private HashInfo;

    function setHashInfo(bytes32 _hash) public {
        require(HashInfo[_hash].ownerAddress == address(0), "Hash already set");

        HashInfo[_hash].ownerAddress = msg.sender;
        HashInfo[_hash].creationDt = block.timestamp;

        emit LogNewHash(_hash, msg.sender, HashInfo[_hash].creationDt);
    }

    function getHashInfo(bytes32 _hash) public view returns (address, uint) {
       return (
            HashInfo[_hash].ownerAddress,
            HashInfo[_hash].creationDt
        );
    }

    event LogNewHash(bytes32 hash, address ownerAddress, uint creationDt);
}
