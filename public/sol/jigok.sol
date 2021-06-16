pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

contract jigok {

    uint8 numberOfaccounts; // 총 제품의 수입니다.
    uint8 numberOfDonations;
    uint8 numberOfDonaToCoins;

    address contractOwner;

    struct accountList { //기부자 전자지갑 주소 내역
        uint   number;
        string account;
        uint timestamp;
    }

    struct donationList { //전자지갑별 기부 금액
        uint   number;
        string account;
        uint donateCoin;
        string donationTo;
        uint timestamp;
    }
    struct donaToCoinList { //기부처별 기부 금액
        uint   number;
        string account;
        uint donateCoin;
        string donationTo;
        uint timestamp;
    }

    accountList[] public accountLists;
    donationList[] public donationLists;
    donaToCoinList[] public donaToCoinLists;

    constructor() public {        
        contractOwner = msg.sender;
    }

    function addAccountList (uint _initNumber, string _account) public {
        accountLists.push(accountList(_initNumber,_account, now)) -1;
        numberOfaccounts++;
    }
    function addDonationList (uint _initNumber, string _account, uint _donateCoin, string _donationTo) public {
        donationLists.push(donationList(_initNumber,_account,_donateCoin,_donationTo,now)) -1;
        numberOfDonations++;
    }
    function addDonaToCoinList (uint _initNumber, string _account, uint _donateCoin, string _donationTo) public {
        donationLists.push(donationList(_initNumber,_account,_donateCoin,_donationTo,now)) -1;
        numberOfDonaToCoins++;
    }

    //제품 등록의 수를 리턴합니다.//===============================================
    function getNumOfAccounts() public constant returns(uint8) {
        return numberOfaccounts;
    }
    
    function getAllAccounts() public view returns (accountList[]) {
        return accountLists;
        
    }
    //번호에 해당하는 제품의 이름을 리턴합니다.
    function getAccountListsRe(uint _index) public view returns (string, uint) {
        return (accountLists[_index].account, accountLists[_index].timestamp);
    }
    //================================================================================
    
    function getNumOfDonations() public constant returns(uint8) {
        return numberOfDonations;
    }
    
    function getAllDonations() public view returns (donationList[]) {
        return donationLists;
        
    }
    function getDonationListsRe(uint _index) public view returns (string, string, uint, uint) {
        return (donationLists[_index].account,donationLists[_index].donationTo, donationLists[_index].donateCoin, donationLists[_index].timestamp);
    }
    //================================================================
    
    function getNumOfDonaToCoins() public constant returns(uint8) {
        return numberOfDonaToCoins;
    }
    
    function getAllDonaToCoins() public view returns (donaToCoinList[]) {
        return donaToCoinLists;
        
    }
    function getDonaToCoinRe(uint _index) public view returns (string, string, uint, uint) {
        return (donaToCoinLists[_index].account,donaToCoinLists[_index].donationTo, donaToCoinLists[_index].donateCoin, donaToCoinLists[_index].timestamp);
    }

    //================================================================
    //컨트랙트를 삭제합니다.
    function killContract() public {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
    
}