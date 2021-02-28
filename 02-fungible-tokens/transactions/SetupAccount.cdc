import FungibleToken from 0x01

transaction {
    prepare(acct: AuthAccount) {
        let vault <- FungibleToken.createEmptyVault()
        acct.save<@FungibleToken.Vault>(<- vault, to: /storage/MainVault)
        log("Empty Vault created")

        let receiverRef = acct.link<&FungibleToken.Vault{FungibleToken.Receiver, FungibleToken.Balance}>(/public/MainReceiver, target: /storage/MainVault)
        log("References created")
    }

    post {
        getAccount(0x02)
            .getCapability(/public/MainReceiver)
            .check<&FungibleToken.Vault{FungibleToken.Receiver}>():
                "Vault Receiver Reference was not created correctly"
    }
}
