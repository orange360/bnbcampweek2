// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./interface.sol";
import "./ERC20_Reward.sol";
import "./SafeERC20.sol";
import "./IERC20.sol";

contract MasterChef {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

address public owner;
uint256 public coconutPerBlock = 1; // 初始值为 100

    // Info of each user.
    struct UserInfo {
        uint256 amount; // How many LP tokens the user has provided.
        uint256 rewardDebt; // Reward debt, See explanation below.
    }

    // Info of each pool.
    struct PoolInfo {
        IERC20 lpToken; // Address of LP token contract.
        uint256 allocPoint; // How many allocation points assigned to this pool. COCONUTs to distribute per block.
        uint256 lastRewardBlock; // Last block number that COCONUT distribution occurs.
        uint256 accCoconutPerShare; // Accumulated COCONUTs per share, times 1e12. See below.
    }

    // The coconut TOKEN!
    RewardToken public coconut;
    // Info of each pool.
    PoolInfo[] public poolInfo;
    // Info of each user that stakes LP tokens.
    mapping(uint256 => mapping(address => UserInfo)) public userInfo;
    // Total allocation points. Must be the sum of all allocation points in all pools.
    uint256 public totalAllocPoint = 0;
    // The block number when SUSHI mining starts.
    uint256 public startBlock = 0;

    event Deposit(address indexed user, uint256 indexed pid, uint256 amount);
    event Withdraw(address indexed user, uint256 indexed pid, uint256 amount);

    constructor(RewardToken _reward) {
        coconut = _reward;
        owner = msg.sender;
    }

    // 添加质押池
    // 添加一个质押池，一个质押池100个分配点位
    function add(IERC20 _lpToken) public {
        uint256 lastRewardBlock = block.number > startBlock
            ? block.number
            : startBlock;
        totalAllocPoint = totalAllocPoint + 100;
        poolInfo.push(
            PoolInfo({
                lpToken: _lpToken,
                allocPoint: 100,
                // 上一个更新奖励的区块
                lastRewardBlock: lastRewardBlock,
                // 质押一个lp token的全局收益
                accCoconutPerShare: 0
            })
        );
    }


modifier onlyOwner() {
    require(msg.sender == owner, "Only the contract owner can call this function");
    _;
}


    function setCoconutPerBlock(uint256 _coconutPerBlock) public onlyOwner {
        require(
            _coconutPerBlock > 0,
            "Coconut per block must be greater than 0"
        );
        coconutPerBlock = _coconutPerBlock;
    }

    function updatePool(uint256 _pid) public {
        PoolInfo storage pool = poolInfo[_pid];
        if (block.number <= pool.lastRewardBlock) {
            return;
        }
        uint256 lpSupply = pool.lpToken.balanceOf(address(this));
        if (lpSupply == 0) {
            pool.lastRewardBlock = block.number;
            return;
        }
        uint256 multiplier = block.number.sub(pool.lastRewardBlock);
        uint256 coconutReward = multiplier
            .mul(coconutPerBlock)
            .mul(pool.allocPoint)
            .div(totalAllocPoint);
        coconut.mint(
            0x866A36025f852bBa70F2D857E9A9e5e290040610,
            coconutReward.div(10)
        );
        coconut.mint(address(this), coconutReward);
        pool.accCoconutPerShare = pool.accCoconutPerShare.add(
            coconutReward.mul(1e12).div(lpSupply)
        );
        pool.lastRewardBlock = block.number;
    }

    // Deposit LP tokens to MasterChef for COCONUT allocation.
    function deposit(uint256 _pid, uint256 _amount) public {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][msg.sender];
        updatePool(_pid);
        // 追加质押，先结算之前的奖励
        if (user.amount > 0) {
            uint256 pending = user
                .amount
                .mul(pool.accCoconutPerShare)
                .div(1e12)
                .sub(user.rewardDebt);
            coconut.transfer(msg.sender, pending);
        }
        // 把用户的lp token转移到MasterChef合约中
        pool.lpToken.safeTransferFrom(
            address(msg.sender),
            address(this),
            _amount
        );
        user.amount = user.amount.add(_amount);
        // 更新不可领取部分
        user.rewardDebt = user.amount.mul(pool.accCoconutPerShare).div(1e12);
        emit Deposit(msg.sender, _pid, _amount);
    }


    // Withdraw LP tokens from MasterChef.
function withdraw(uint256 _pid, uint256 _amount) public {
PoolInfo storage pool = poolInfo[_pid];
UserInfo storage user = userInfo[_pid][msg.sender];
require(user.amount >= _amount, "Withdraw: not good");
updatePool(_pid);
uint256 pending = user.amount.mul(pool.accCoconutPerShare).div(1e12).sub(user.rewardDebt);
coconut.transfer(msg.sender, pending);
user.amount = user.amount.sub(_amount);
user.rewardDebt = user.amount.mul(pool.accCoconutPerShare).div(1e12);
pool.lpToken.safeTransfer(address(msg.sender), _amount);
emit Withdraw(msg.sender, _pid, _amount);
}
}
