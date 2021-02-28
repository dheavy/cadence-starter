import HelloWorld from 0x02

pub fun main() {
    let helloAccount = getAccount(0x02)
    let helloCapability = helloAccount.getCapability<&HelloWorld.HelloAsset>(/public/Hello)
    let helloReference = helloCapability.borrow()
        ?? panic("Could not borrow a reference to the hello capability")
    log(helloReference.hello())
}
