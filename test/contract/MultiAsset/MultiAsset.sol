pragma solidity ^0.4.24;

contract MultiAsset {
    constructor() public payable {
    }
    function reg(string desc) public payable{
        issueasset(desc);
    } 
    function add(uint256 assetId, address to, uint256 value ) public {
        addasset(assetId,to,value);
    }
    function transAsset(address to, uint256 assetId, uint256 value) public payable {
        to.transferex(assetId, value);
    }
    function changeOwner(address newOwner, uint256 assetId) public {
        setassetowner(assetId, newOwner);
    }
   function getBalanceEx(address to,uint256 assetId) public {
        log1(bytes32(to.balanceex(assetId)),"getbalanceex");
       // return to.balanceex(assetId);
    }
    
   function getAssetAmount(uint256 assetId, uint256 time) public{
            uint256 x;
            x = assetamount(assetId,time);
            log1(bytes32(x),"getassetamount");
     }

    function getSnapshotTime(uint256 t,uint256 time) public{
              uint256 x;
             x = snapshottime(t,time);
             log1(bytes32(x),"getSnapshotTime" );

    }

    function getSnapBalance(address to,uint256 assetId, uint256 time, uint256 typeId) public {
        uint256 x ;
        x = to.snapbalance(assetId,time,typeId);
        log1(bytes32(x),"getSnapBalance");
    }

    function balances(uint256 a) public pure returns (uint256 balance) { 
        balance = a; 
    }

    function getdg(address user, uint256 t) external returns (uint256 a, uint256 b, uint256 c) {
        uint256 aa;
        uint256 bb;
        uint256 cc;
        (aa,bb,cc) = getdelegate(user,t);
        log1(bytes32(aa), "delegateNum");
        log1(bytes32(bb), "VoteNum");
        log1(bytes32(cc), "BlockNum");
        return (aa,bb,cc);
    }

   function setdestroyasset(uint256 assetId, uint256 value) public returns (uint256) {
        return destroyasset(assetId, value);
    }
}
