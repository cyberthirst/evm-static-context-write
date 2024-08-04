LEN: constant(uint256) = 666
GAS_WARM_ACCESS: constant(uint256) = 100
GAS_COLD_SLOAD:  constant(uint256) = 2100

counter: HashMap[uint256, uint256]

@view
def get_counter() -> uint256:
    gas_original: uint256 = msg.gas
    tmp: uint256 = 0
    delta: uint256 = 0
    for i: uint256 in range(LEN):
        tmp = self.counter[i]
        delta = gas_original - msg.gas
        if delta > GAS_COLD_SLOAD: 
            return i
        else:
            gas_original = msg.gas

    return max_value(uint256)

@view
@external
def foo() -> uint256:
    tmp: uint256 = self.get_counter()
    return 0

@view
@external
def get_num_of_accesses() -> uint256:
    return self.get_counter()
    
