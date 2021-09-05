const Geng = artifacts.require("Geng");

contract("test Geng", async accounts => {
    const acc0 = accounts[0];
    const acc1 = accounts[1];
    const acc2 = accounts[2];
    const acc3 = accounts[3];
    before(async function() {
      geng = await Geng.deployed();
    });
    it("should mint to account 0, 1", async () => {
      assert.equal(addr, acc0);

      let marketBalance = await token.balanceOf(kmarket.address);
      assert.notEqual(marketBalance.toString(), zeroBN.toString());
      assert.equal(marketBalance.sub(lastMarketBalance).toString(), zeroBN.clone().add(keyPriceBN).toString());
    });
  });