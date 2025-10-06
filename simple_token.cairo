# simple_token.cairo
# Minimal StarkNet/Cairo style contract skeleton.
# This is illustrative and may need adjustments for a specific Cairo version.
%lang starknet

@contract_interface
namespace IERC20:
    func name() -> (res: felt):
    end
end

@storage_var
func balance_of(account: felt) -> (res: felt):
end

@external
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}():
    # initialize if needed
    return ()
end
