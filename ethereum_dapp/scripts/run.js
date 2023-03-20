const main = async () => {
  console.log("Starting the main function");
  
  const [owner, randomPerson] = await hre.ethers.getSigners();
  const portalContractFactory = await hre.ethers.getContractFactory("Portal");
  const portalContract = await portalContractFactory.deploy();
  await portalContract.deployed();
  
  console.log("Contract deployed to:", portalContract.address);
  console.log("Contract deployed by:", owner.address);

  await portalContract.getTotalInteractions();

  const portalTxn = await portalContract.interact();
  await portalTxn.wait();

  await portalContract.getTotalInteractions();
};


const runMain = async () => {
  try {
    await main();
    process.exit(0); // exit Node process without error
  } catch (error) {
    console.log(error);
    process.exit(1); // exit Node process while indicating 'Uncaught Fatal Exception' error
  }
  // Read more about Node exit ('process.exit(num)') status codes here: https://stackoverflow.com/a/47163396/7974948
};

runMain();
  