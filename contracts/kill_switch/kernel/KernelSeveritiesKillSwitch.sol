pragma solidity 0.4.24;

import "./KernelKillSwitch.sol";
import "../base/SeveritiesKillSwitch.sol";


contract KernelSeveritiesKillSwitch is KernelKillSwitch, SeveritiesKillSwitch {
    constructor(bool _shouldPetrify) Kernel(_shouldPetrify) public {
        // solium-disable-previous-line no-empty-blocks
    }

    function setContractAction(address _contract, ContractAction _action)
        external
        auth(SET_CONTRACT_ACTION_ROLE, arr(_contract, msg.sender))
    {
        _setContractAction(_contract, _action);
    }

    function setLowestAllowedSeverity(address _contract, IssuesRegistry.Severity _severity)
        external
        auth(SET_LOWEST_ALLOWED_SEVERITY_ROLE, arr(_contract, msg.sender))
    {
        _setLowestAllowedSeverity(_contract, _severity);
    }
}
