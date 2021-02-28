import FungibleToken from 0x01

transaction {
    let mintingRef: &FungibleToken.VaultMinter
    var receiverRef: Capability<&FungibleToken.Vault{FungibleToken.Receiver}>

    prepare(acct: AuthAccount) {
        self.mintingRef = acct.borrow<&FungibleToken.VaultMinter>(from: /storage/MainMinter)
            ?? panic("Could not borrow a reference to the minter")
        let recipient = getAccount(0x02)
        self.receiverRef = recipient.getCapability<&FungibleToken.Vault{FungibleToken.Receiver}>(/public/MainReceiver)
    }

    execute {
        self.mintingRef.mintTokens(amount: 30.0, recipient: self.receiverRef)
        log("30 tokens minted and deposited to account 0x02")
    }
}
