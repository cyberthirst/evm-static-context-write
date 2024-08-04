## Write to state in static context
- use the fact that there's a gas difference between accessing a warm and cold storage slot
- intentionally warm the slots to store information even in the static EVM context
- to decode the information access the slots and check the gas usage to see if the slots are warm or cold
- run tests with `pytest`

## Requireements
- `pip install vyper==0.4.0`
- `pip install titanoboa`