const auction = artifacts.require('auction');

let fund = null;

contract('auction', () => {
    let assetOwner;
    let duration;
    let startPoint;
    let bids = [];
    const bidder = '0xC00AB10238A2C48D7E952D53Ffd7a2d41c8eEb0B';
    const fee = 2000;
    let largest;

    before(async() => {
        fund = await auction.deployed()
    })

    it('set auction', async() => {
        let _assetOwner = '0x2dFC4A588E36CB6dd5E7192F3a409241F9f2f65f';
        let timing = 120;
        let _feePoint = 1000;
        await fund.setAuction(timing,_assetOwner,_feePoint);{
            duration = timing;
            assetOwner = _assetOwner;
            startPoint = _feePoint;
        }
    })


    it('bid', async() => {
        largest = 0;
        try{
        const bid = await fund.bid(bidder,fee);
        bids.push[fee]
    } catch (error) {
        assert(fee > startPoint);
        assert(fee > largest);
    }
    })



    it('get asset', async() => {
        const _fee = 5000;
        largest = 5000;
        try{
            const ghetto = await fund.getAsset(_fee);
        } catch (error) {
            assert(_fee == largest)
        }
    })


    it('send asset', async() => {
        let winner = '0x86c4bba539dfd1fe0b99e5d69cb2539cdf0167ae';
        const asset = '3000';
        await fund.sendAsset();
    })
})