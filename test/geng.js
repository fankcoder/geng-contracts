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
      var s1 = "你在教我做事";
      await instance.safeMintGeng(acc0, s1);
      assert.equal(acc0, instance.ownerOf(1));

      var s2 = "小丑竟是我自己";
      await instance.safeMintGeng(acc1, s2);
      assert.equal(acc1, instance.ownerOf(2));
      let marketBalance = await token.balanceOf(kmarket.address);
      assert.notEqual(marketBalance.toString(), zeroBN.toString());
      assert.equal(marketBalance.sub(lastMarketBalance).toString(), zeroBN.clone().add(keyPriceBN).toString());
    });
    it("should transform nft each account 1, 2", async () => {
      
    });
  });