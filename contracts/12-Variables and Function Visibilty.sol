    //SPDX-License-Identifier: GPL-3.0
     
    pragma solidity >=0.5.0 <0.9.0;
     
    contract A{
        int public x = 10;
        int y = 20; // internal by default
        
        function get_y() public view returns(int){
            return y;
        }
        
        function f1() private view returns(int){
            return x;
        }
        
        function f2() public view returns(int){
            int a;
            a = f1();
            return a;
        }
        
        function f3() internal view returns(int){
            return x;
        }
        
        function f4() external view returns(int){
            return x;
        }
        
        function f5() public pure returns(int){
            int b;
            // b = f4(); //f4() is external
            // Even though f4() wasn’t external it wouldn’t be possible to be called 
            // from within f5() because f5() is pure (it can not read nor write to the blockchain)
     
            return b;
        }
    }
     
    contract B is A{
        int public xx = f3();
        // int public yy = f1(); -> f1() is private and cannot be called from derived contracts
    }
     
    contract C{
        A public contract_a = new A();
        int public xx = contract_a.f4();
        // int public y = contract_a.f1();
        // int public yy = contract_a.f3();
    }









/*-----------------------------------------------------------------NOTE------------------------------------------------------------------------------
Variables & Functions Visibility
There are four visibility specifiers for functions and state variables:
1. Public
● The function is part of the contract interface and can be called both internally (from within the
same contract) and externally (from other contracts or by EOA accounts);
● A getter is automatically created for public variables. They can be easily accessed from dApps;
2. Private
● Private functions and variables are available only in the contract they are defined.
● This is the default for state variables, they can be accessed only by a getter function;
3. Internal
● Functions are accessible only from the contract they are defined in and from derived contracts;
4. External
● The function is part of the contract interface, can be accessed only from other contracts or by
EOA accounts using transactions. It’s automatically public;
● Not-available for state variables;
Variables & Functions Visibility (cont)
● Everything that is inside a contract is visible to all external observers. Making something private
only prevents other contracts from accessing and modifying the information, but it will still be
visible to the whole world outside of the blockchain;
● Information is not encrypted by default on the Ethereum Blockchain;
● The visibility specifier is given after the type for state variables and between parameter list and
return parameter list for functions;
● External functions are more efficient than public functions in terms of gas consu



------------------------------------------------------------------------------------------------------------------------------------------------------*/