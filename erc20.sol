@@ -4,22 +4,22 @@ pragma solidity ^0.4.24;

contract SafeMath {

    function safeAdd(uint a, uint b) public pure returns (uint c) {
    function safeAdd(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }

    function safeSub(uint a, uint b) public pure returns (uint c) {
    function safeSub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }

    function safeMul(uint a, uint b) public pure returns (uint c) {
    function safeMul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }

    function safeDiv(uint a, uint b) public pure returns (uint c) {
    function safeDiv(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
@@ -63,8 +63,8 @@ contract QKCToken is ERC20Interface, SafeMath {
        name = "QuikNode Coin";
        decimals = 2;
        _totalSupply = 100000;
        balances[YOUR_METAMASK_WALLET_ADDRESS] = _totalSupply;
        emit Transfer(address(0), YOUR_METAMASK_WALLET_ADDRESS, _totalSupply);
        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function totalSupply() public constant returns (uint) {
@@ -76,6 +76,7 @@ contract QKCToken is ERC20Interface, SafeMath {
    }

    function transfer(address to, uint tokens) public returns (bool success) {
        require(tokens <= balances[msg.sender], "Not enough balance");
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
@@ -89,6 +90,8 @@ contract QKCToken is ERC20Interface, SafeMath {
    }

    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        require(tokens <= balances[from]," Not enough balance");
        require(tokens <= allowed[from][msg.sender], "Not approved to withdraw this much tokens");
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
