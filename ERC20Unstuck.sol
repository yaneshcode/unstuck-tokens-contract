pragma solidity ^0.5.1;

contract ERC20Interface {
    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract ERC20Unstuck {

    mapping(bytes32 => address) public Tokens;
    
    event AddedToken(string tokenName, address tokenAddress);
    
    constructor() public {

    }
    
    function addToken(string memory _tokenName, address _tokenAddress) public {
        bytes memory bytesName = bytes(_tokenName);
        bytes32 key = keccak256(bytesName);
        Tokens[key] = _tokenAddress;
        
        emit AddedToken(_tokenName, _tokenAddress);
    }

    // transfer from contract
    function transferToken(string memory _tokenName, address _to, uint _numTokens) public {
        bytes memory bytesName = bytes(_tokenName);
        bytes32 key = keccak256(bytesName);
        address tokenAddress = Tokens[key];
    
        ERC20Interface myToken = ERC20Interface(tokenAddress);
        myToken.transfer(_to, _numTokens);
    }
    
    // transfer from sender
    function transferTokenFrom(string memory _tokenName, address _to, uint _numTokens) public {
        bytes memory bytesName = bytes(_tokenName);
        bytes32 key = keccak256(bytesName);
        address tokenAddress = Tokens[key];
    
        ERC20Interface myToken = ERC20Interface(tokenAddress);
        myToken.transferFrom(msg.sender, _to, _numTokens);
    }

}
