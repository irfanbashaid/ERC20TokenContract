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