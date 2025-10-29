 README.md

🎓 StudentRecords Smart Contract

📖 Project Description

StudentRecords is a simple Ethereum-based smart contract written in Solidity that securely stores and verifies student academic records on the blockchain.
It ensures transparency and trust — once data is stored, it cannot be tampered with, making it perfect for decentralized academic record management.


---

⚙️ What It Does

This contract allows an admin (the owner) to:

Add student records (name, course, and marks)

Verify student records
Anyone can then view student details and check if the record is verified.


It’s a great beginner-level project for learning how to build, deploy, and interact with smart contracts using Solidity.


---

✨ Features

🔐 Owner Access Control — Only the deployer (admin) can add or verify records

🧠 Student Record Storage — Stores name, course, and marks

✅ Verification System — Marks students as verified when approved by the admin

🌍 Public Transparency — Anyone can read student information from the blockchain



---

🔗 Deployed Smart Contract

Contract Address: XXX
(Replace with your deployed contract link once deployed on Remix, Sepolia, or any Ethereum testnet)


---

💻 Smart Contract Code

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


---

🚀 How to Use

1. Open Remix IDE.


2. Create a new file named StudentRecords.sol and paste the code above.


3. Compile the contract (Solidity version 0.8.0 or higher).


4. Deploy the contract.


5. Use the following functions:

addStudent() → Add a student record (only owner)

verifyStudent() → Verify the student’s record (only owner)

getStudent() → View a student’s details





---

🧠 Example

1. Deploy the contract.


2. Add a record:

addStudent("STU001", "Arya Ghosh", "Computer Science", 95)


3. Verify it:

verifyStudent("STU001")


4. View it:

getStudent("STU001")




---

🪙 Technologies Used

Solidity (v0.8.0) — Smart contract programming language

Remix IDE — Online Solidity IDE

Ethereum Blockchain — For decentralized storage



---

📚 Author

Created by Ritam Ghosh
A simple beginner project to understand blockchain data storage and verification.
