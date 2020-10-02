pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;


contract details{
    string userType;
    


     struct ngoDetail{
         address ngoAddress;
         string ngoRegName;
         string ngoRegNo;
         string ngofield;
         
     }
     
     struct donorDetail{
        address donorAddress;
        string donorName;
        string donorEmail;
        uint donorMobile;
        //uint amount;
        string userType;
        int donorTokens; 
     }
     
     struct whyUsingDonation{
         string whyUsing;
     }

    
    mapping(address => donorDetail) donorDetails;
    mapping(address => ngoDetail) ngoDetails;
    mapping(address => whyUsingDonation) wud;
    
    address[] donorAddress;
    address[] ngoAddress;
    
    uint donorsDetailsCount = 0;
    uint ngospendtime=0;

    
   
    // Create Operations
    function createNgo(address _ngoAddress, string memory _ngoRegName,string memory _ngoRegNo, string memory _ngofield) public{
        
        ngoDetails[_ngoAddress].ngoAddress = _ngoAddress;
        ngoDetails[_ngoAddress].ngoRegName = _ngoRegName;
        ngoDetails[_ngoAddress].ngoRegNo = _ngoRegNo;
        ngoDetails[_ngoAddress].ngofield =_ngofield;
        
        ngoAddress.push(_ngoAddress);
        
    }
    
    function ngospend(string memory _whyUsing, address _ngoAddress) public {
       
      
        wud[_ngoAddress].whyUsing= _whyUsing;
        ngospendtime++;
    
    }
    
    function createDonor(address _donorAddress,string memory _donorName,string memory _donorEmail,uint _donorMobile) external{
        donorDetails[_donorAddress].donorAddress = _donorAddress;
        donorDetails[_donorAddress].donorName = _donorName;
        donorDetails[_donorAddress].donorEmail = _donorEmail;
        donorDetails[_donorAddress].donorMobile = _donorMobile;
        donorDetails[_donorAddress].userType  = "Donor";
        donorDetails[_donorAddress].donorTokens = 100;
        
        donorAddress.push(_donorAddress);
        donorsDetailsCount++;
    }
    
   
   
    // View all address
    function viewAlldonorAddress() view public returns(address[] memory){
        return donorAddress;
    } 
    
    
    
}

//deployed at 0x16A23fa179205dE9D7383E23128Fb92296330995
//from account 4