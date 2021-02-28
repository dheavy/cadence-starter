import HelloWorld from 0x02

transaction {
    prepare(acct: AuthAccount) {
        let capability = acct.link<&HelloWorld.HelloAsset>(/public/Hello, target: /storage/Hello)
        let helloReference = capability!.borrow()
            ?? panic("Could not borrow a reference to the hello capability")
        log(helloReference.hello())
    }
}
