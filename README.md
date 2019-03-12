# Unstuck Tokens Contract
Design pattern for contracts to allow unrecognized tokens to be unstuck from contract.
This works by adding the Token to the contract (even after the unrecognized tokens have already been sent to this contract) to be recognized and allowing the tokens to be usable, or at least able to be trasferred out of the contract.

### Example: ERC20 Tokens

##### Problem: 
Quote from [EIP223](https://github.com/ethereum/EIPs/issues/223) (NOTE: This solution does not implement ERC223!)
>ERC20 token standard is leading to money losses for end users. The main problem is lack of possibility to handle incoming ERC20 transactions, that were performed via transfer function of ERC20 token.

>If you send 100 ETH to a contract that is not intended to work with Ether, then it will reject a transaction and nothing bad will happen. If you will send 100 ERC20 tokens to a contract that is not intended to work with ERC20 tokens, then it will not reject tokens because it cant recognize an incoming transaction. As the result, your tokens will get stuck at the contracts balance.

##### Solution
A contract that allows for dynamic ERC20 Token management. The contract can add new ERC20 Tokens after deployment (and remove or modify if needed). Tokens that were sent to this contract prior to being recognized can be added to the contract and the tokens interacted with through the ERC20 Interface, thus the tokens are now unstuck!
