const Dogs = artifacts.require('Dogs');
const DogsUpdated = artifacts.require('DogsUpdated');
const Proxy = artifacts.require('Proxy');

module.exports = async function(deployer, network, accounts){

    //deploy contracts
    const dogs = await Dogs.new();
    const proxy = await Proxy.new(dogs.address);

    //create proxy dog to fool truffle
    var proxyDog = await Dogs.at(proxy.address);

    //set number of dogs through proxy
    await proxyDog.setNumberOfDogs(10);

    //tested
    var nrOfDogs = await proxyDog.getNumberOfDogs();
    console.log("Before update: " + nrOfDogs.toNumber());

    //deploy new version of Dogs
    const dogsUpdated = await DogsUpdated.new();
    proxy.upgrade(dogsUpdated.address);

    //fool truffle again. It now thinks proxyDog has all functions.
    proxyDog = await DogsUpdated.at(proxy.address);

    //check so that storage remained - should return 10
    var nrOfDogs = await proxyDog.getNumberOfDogs();
    console.log("After update: " + nrOfDogs.toNumber());

    //set the nr of dogs through the proxy with new func contract
    await proxyDog.setNumberOfDogs(30, {from: accounts[0]});

    //check so that setNumberOfDogs worked with new func contract
    nrOfDogs = await proxyDog.getNumberOfDogs();
    console.log("After update2: " + nrOfDogs.toNumber());
}