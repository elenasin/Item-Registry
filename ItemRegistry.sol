///////////////////////////
//Solidity smart contract
//Copyright (c) 2017, Elena Sinelnikova, all rights reserved
//////////////////////////
pragma solidity 0.4.10;

contract ItemRegistry {
    address public admin;
    Item[]  items;
    Owner[]  owners;
    Company[]  validationCompanies;
    
    
    event ItemRegistered(uint256 id);
    event ItemDeleted(uint256 id);
    event ItemValidated(uint256 id, string serialNumber, string validationCompany);
    event ItemInvalidated(uint256 id);
    event ItemTransferred(address fromOwner, address toOwner, uint16 price);
    
    event OwnerRegistered(address ownerAddress);
    event ValidationCompanyRegistered(address companyAddress);
    
    struct DateTime {
        uint16 year;
        uint8 month;
        uint8 day;
        uint8 hour;
        uint8 minute;
        uint8 second;
        uint8 weekday;
    }
    
    //item owner
    struct Owner {
        address OwnerAddress;
    }
    
    //proof of item authenticity
    struct Authenticity {
        string serialNumber;
        Company validationCompany;
        DateTime validationDate;
    }
    
    //validating company
    struct Company {
        address companyAddress;
    }
    
    //item
    struct Item {
        uint256 id;
        bool    isValid;
        Owner itemOwner;
        Authenticity itemAuthenticity;
        string origin;
        string description;
        DateTime issueDate;
    }
    
    //constructor
    function ItemRegistry()
    {
        admin = msg.sender;
       
    }
    
    //owners can register themselves
    function RegisterOwner()
        public
    {
       Owner memory newOwner;
       newOwner.OwnerAddress = msg.sender;
       owners.push(newOwner);
       OwnerRegistered(newOwner.OwnerAddress);
    }
    
    //only admin can register validating agency
    function RegisterValidationCompany(address companyAddress)
        public
    {
        if (msg.sender != admin){throw;}
       Company memory newCompany;
       newCompany.companyAddress = companyAddress;
       validationCompanies.push(newCompany);
       ValidationCompanyRegistered(companyAddress);
    }
    
    //delete item
    function IsItemValid(uint256 id)
        public
        constant
        returns(bool isValid)
    {
        //TODO
        return false;
    }
    
    
    //delete item
    function SearchItem(string description)
        public
//        constant
//        returns(Item[] searchItems)    
    {
        //TODO
//        return items;
    }
    
    //create item
    function RegisterItem()
        public
    {
        Item memory newItem;
        newItem.id = items.length;
        //finish up
    }
    
     //delete item
    function DeleteItem()
        public
    {
    }
    
     //sell item
    function TransferItem()
        public
        payable
        returns(bool isSuccess)
    {
        //TODO
        return false;
    }
    
    //validate item
    function ValidateItem(uint256 id)
        public
        returns(bool isSuccess)
    {
        //TODO
        return false;
    }
    
    

}