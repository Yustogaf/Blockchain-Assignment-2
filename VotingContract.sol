// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract VotingBallot {
    address public admin;
    bool public isElectionOpen = false; 
    
    struct Candidate {
        string name;
        uint256 votes;
    }

    Candidate[] public candidates;
    
    
    mapping(address => bool) public registeredVoters; 
    mapping(address => bool) public hasVoted;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized: Admin only");
        _;
    }

    modifier duringElection() {
        require(isElectionOpen == true, "The election is not active");
        _;
    }

    
    function addCandidate(string memory names) public onlyAdmin {
        candidates.push(Candidate(names, 0));
    }

    
    function registerVoter(address votersAddress) public onlyAdmin {
        registeredVoters[votersAddress] = true;
    }

    
    function startElection() public onlyAdmin {
        isElectionOpen = true;
    }

    function stopElection() public onlyAdmin {
        isElectionOpen = false;
    }

    
    function vote(uint256 candidatesIndex) public duringElection {
        
        require(registeredVoters[msg.sender] == true, "You are not a registered voter");
        
        require(hasVoted[msg.sender] == false, "You have already cast your vote");
        
        require(candidatesIndex < candidates.length, "Candidate not found");

        candidates[candidatesIndex].votes += 1;
        hasVoted[msg.sender] = true;
    }
}
