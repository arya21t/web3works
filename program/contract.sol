// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRecords {

    struct Student {
        string name;
        string course;
        uint marks;
        bool verified;
    }

    mapping(string => Student) public students; // studentId → Student
    address public owner;

    constructor() {
        owner = msg.sender; // the person who deploys is the owner
    }

    // Add a new student record
    function addStudent(string memory studentId, string memory name, string memory course, uint marks) public {
        require(msg.sender == owner, "Only owner can add records");
        students[studentId] = Student(name, course, marks, false);
    }

    // Verify student record
    function verifyStudent(string memory studentId) public {
        require(msg.sender == owner, "Only owner can verify records");
        students[studentId].verified = true;
    }

    // Get student details
    function getStudent(string memory studentId) public view returns (string memory, string memory, uint, bool) {
        Student memory s = students[studentId];
        return (s.name, s.course, s.marks, s.verified);
    }
}
