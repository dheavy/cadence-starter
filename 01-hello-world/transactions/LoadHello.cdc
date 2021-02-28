import HelloWorld from 0x02

transaction {
    prepare(acct: AuthAccount) {
        let helloResource <- acct.load<@HelloWorld.HelloAsset>(from: /storage/Hello)
        log(helloResource?.hello())
        acct.save(<- helloResource!, to: /storage/Hello)
    }
}
