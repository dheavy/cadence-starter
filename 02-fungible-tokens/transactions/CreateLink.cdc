import FungibleToken from 0x01

transaction {
    prepare(acct: AuthAccount) {
        acct.link<&FungibleToken.Vault{FungibleToken.Receiver, FungibleToken.Balance}>(/public/MainReceiver, target: /storage/MainVault)
        log("Public Receiver reference created!")
    }

    post {
        getAccount(0x01)
            .getCapability<&FungibleToken.Vault{FungibleToken.Receiver}>(/public/MainReceiver)
            .check():
                "Vault Receiver reference was not created correctly"
    }
}
