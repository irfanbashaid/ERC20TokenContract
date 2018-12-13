pragma solidity ^0.4.0;

library SafeMath 
{
    function add(uint a, uint b) internal pure returns (uint) 
    {
        uint c;
        c = a + b;
        require(c >= a);
        return c;
    }
    
    function sub(uint a, uint b) internal pure returns (uint) 
    {
        require(b <= a);
        uint c;
        c = a - b;
        return c;
    }
    
    function mul(uint a, uint b) internal pure returns (uint) 
    {
        uint c;
        c = a * b;
        require(a == 0 || c / a == b);
        return c;
    }
    
    function div(uint a, uint b) internal pure returns (uint) 
    {
        require(b > 0);
        uint c;
        c = a / b;
        return c;
    }
    
}
contract StandardToken
{
    using SafeMath for uint;
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    
    constructor() public payable
    {
        symbol = "SDT";
        name = "Standard Token";
        decimals = 18;
        _totalSupply = 10000000 * 10**uint(decimals);
        balances[msg.sender]= _totalSupply;
    }

    event Transfer(address indexed_from, address indexed_to, uint256 _value);
    
    event Approval(address indexed_owner, address indexed_spender, uint256 _value);
    
    function totalSupply() public constant returns (uint256) 
    {
        return _totalSupply;
    }

    function balanceOf(address _owner) public constant returns (uint256) 
    {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public payable returns (bool) 
    {
        require(balances[msg.sender] >= _value &&  _value > 0);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public payable returns (bool) 
    {
        require(balances[_from] >= _value && _value > 0 && allowed[_from][msg.sender]>= _value);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender]= allowed[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public payable returns (bool) 
    {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public constant returns (uint256) 
    {
        return allowed[_owner][_spender];
    }

} 