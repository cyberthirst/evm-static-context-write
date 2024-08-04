import boa as b

def test_staticall_write():
    caller = b.load("contracts/caller.vy")
    callee = b.load("contracts/callee.vy")
    caller.set_callee(callee.address)
    result = caller.call_calle()
    assert result == 10