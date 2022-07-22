# Coding-Quest-Solved-the-unsolved
Welcome to Coding Quests

Instructions on Coding Quests: 
1. Fork the repository - {link to github} 
2. Scout the code for errors and solve them 
3. Once the code is solved, raise a PR with your name. 
4. Once our team checks out the code we’ll merge the PR. 
5. The code snippet is in Solidity.

# Replacments 👾

Replace **YOUR_METAMASK_WALLET_ADDRESS** with **msg.sender** which implies the address which is initiating the transaction.

# Vulnerablity 😈

This contract is using the function by ERC827 Token Standard. According to the official docs of ERC827 Token Standard, **"This standard is still a draft and is proven to be unsafe to be used"**. It allows the token to execute a function in the receiver contract  after the approval or transfer happens. Openzeppelin library has also removed this Token standard from their official Repo.

**Best Practices for approveAndCall**

**approveAndCall:** It allows the receiver contract to use approved balance. The best practice is to check the allowance of the sender and then do your stuff using the transferFromAndCall method.


