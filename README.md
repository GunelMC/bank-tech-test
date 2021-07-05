# Bank tech test

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

### CRC Cards 

| Class Name:               | Account        |
|---------------------------|----------------|
| Reponsibilities:          | Collaborators: |
| Knows Balance             | Transaction    |
| Knows transaction history |                |
| Can Deposit               |                |
| Can Withdraw              |                |
| Can Print statement       |                |

| Class Name:                       | Transaction    |
|-----------------------------------|----------------|
| Reponsibilities:                  | Collaborators: |
| Knows Date                        |                |
| Knows Credit Amount               |                |
| Knows Debit Amount                |                |
| Knows Balance (after transaction) |                |

## User Stories
```
As a customer,
So I can make a transaction,
I want to create bank account with a balance of 0
```
```
As a customer,
So I can save money,
I want to deposit money into my account 
```
```
As a customer,
So I can spend money,
I want to withdraw money from my account 
```

```
As a customer,
So I do not have a negative balance,
I want to withdraw only the money that I have 
```

```
As a customer,
So I can see my balance and transaction history,
I want to print account statement
```