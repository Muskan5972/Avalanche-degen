// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract AdventureQuest {
    struct Adventurer {
        address adventurerAddress;
        uint256 questCount;
        uint256 totalGems;
        uint256 iceCavernQuests;
        uint256 galacticBaseQuests;
        uint256 hauntedRuinsQuests;
        uint256 celestialTowerQuests;
    }

    enum QuestType { IceCavern, GalacticBase, HauntedRuins, CelestialTower }

    mapping(address => Adventurer) public adventurers;
    address[] public adventurerAddresses;

    event QuestOutcome(address indexed adventurer, uint256 gems, QuestType questType);

    function enroll() external {
        require(adventurers[msg.sender].adventurerAddress == address(0), "Adventurer already enrolled");
        adventurers[msg.sender] = Adventurer(msg.sender, 0, 0, 0, 0, 0, 0);
        adventurerAddresses.push(msg.sender);
    }

    function embark(QuestType questType) external {
        require(adventurers[msg.sender].adventurerAddress != address(0), "You must enroll first");

        adventurers[msg.sender].questCount += 1;

        if (questType == QuestType.IceCavern) {
            adventurers[msg.sender].iceCavernQuests += 1;
        } else if (questType == QuestType.GalacticBase) {
            adventurers[msg.sender].galacticBaseQuests += 1;
        } else if (questType == QuestType.HauntedRuins) {
            adventurers[msg.sender].hauntedRuinsQuests += 1;
        } else if (questType == QuestType.CelestialTower) {
            adventurers[msg.sender].celestialTowerQuests += 1;
        }

        uint256 gems = _calculateGems(questType);
        adventurers[msg.sender].totalGems += gems;

        emit QuestOutcome(msg.sender, gems, questType);
    }

    function _calculateGems(QuestType questType) private view returns (uint256) {
        uint256 baseGems = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, questType))) % 100;
        return baseGems;
    }

    function getAdventurer(address _adventurer) external view returns (Adventurer memory) {
        return adventurers[_adventurer];
    }

    function getAdventurerCount() external view returns (uint256) {
        return adventurerAddresses.length;
    }

    function getTopAdventurers(uint256 limit) external view returns (Adventurer[] memory) {
        require(limit > 0 && limit <= adventurerAddresses.length, "Invalid limit");

        Adventurer[] memory topAdventurers = new Adventurer[](limit);
        uint256[] memory gems = new uint256[](adventurerAddresses.length);

        for (uint256 i = 0; i < adventurerAddresses.length; i++) {
            gems[i] = adventurers[adventurerAddresses[i]].totalGems;
        }

        _sortDescending(gems, adventurerAddresses);

        for (uint256 i = 0; i < limit; i++) {
            topAdventurers[i] = adventurers[adventurerAddresses[i]];
        }

        return topAdventurers;
    }

    function _sortDescending(uint256[] memory data, address[] memory addresses) private pure {
        uint256 len = data.length;
        for (uint256 i = 0; i < len; i++) {
            for (uint256 j = i + 1; j < len; j++) {
                if (data[i] < data[j]) {
                    (data[i], data[j]) = (data[j], data[i]);
                    (addresses[i], addresses[j]) = (addresses[j], addresses[i]);
                }
            }
        }
    }

    function getAllAdventurers() external view returns (address[] memory) {
        return adventurerAddresses;
    }
}
