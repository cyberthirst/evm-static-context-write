interface Callee:
    def foo() -> uint256: view
    def get_num_of_accesses() -> uint256: view


callee: public(Callee)

@external
def set_callee(callee: address):
    self.callee = Callee(callee)

@external
def call_calle() -> uint256:
    for i: uint256 in range(10):
        u: uint256 = staticcall self.callee.foo()

    return staticcall self.callee.get_num_of_accesses()
    
