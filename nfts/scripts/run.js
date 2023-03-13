const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory("MyNFT");
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed to:", nftContract.address);

    // call the function
    let txn = await nftContract.makeNFT()
    // wait for it to be mined
    await txn.wait()

    // mint another nft
    txn = await nftContract.makeNFT()
    await txn.wait()
};

const runMain = async () => {
    try {
        console.log("STARTING123");
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();