// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./interface.sol";
import "./SafeERC20.sol";

contract RewardToken is Context, IBEP20, Ownable {
    using SafeMath for uint256;
    string private _name = "Coconut Token";
    string private _symbol = "coconut";
    uint8 private _decimals = 18;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply = 520 * 10**_decimals;

    constructor() {
        _balances[_msgSender()] = _totalSupply;
        emit Transfer(address(0), _msgSender(), _totalSupply);
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount)
        public
        override
        returns (bool)
    {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender)
        public
        view
        override
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount)
        public
        override
        returns (bool)
    {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(
            sender,
            _msgSender(),
            _allowances[sender][_msgSender()] - amount
        );
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue)
        public
        virtual
        returns (bool)
    {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender] + addedValue
        );
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue)
        public
        virtual
        returns (bool)
    {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender] - subtractedValue
        );
        return true;
    }

    function renounceOwnership() public override view onlyOwner {
        revert("Ownable: cannot renounce ownership");
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal {
        require(sender != address(0), "BEP20: transfer from the zero address");
        require(recipient != address(0), "BEP20: transfer to the zero address");

        uint256 senderBalance = _balances[sender];
        require(
            senderBalance >= amount,
            "BEP20: transfer amount exceeds balance"
        );
        _balances[sender] = senderBalance - amount;
        _balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        require(owner != address(0), "BEP20: approve from the zero address");
        require(spender != address(0), "BEP20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
//     function mint(address _to, uint256 _amount) public onlyOwner returns (bool) {
//     totalSupply = totalSupply.add(_amount);
//     _balances[_to] = _balances[_to].add(_amount);
//     emit Transfer(address(0), _to, _amount);
//     return true;
// }



function _mint(address account, uint256 amount) internal {
    require(account != address(0), "ERC20: mint to the zero address");
    

    _totalSupply += amount;
    _balances[account] += amount;
    emit Transfer(address(0), account, amount);
}


function mint(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
    _totalSupply = _totalSupply.add(amount); // 在 mint 函数中进行 totalSupply 的修改
}

}
