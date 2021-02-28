import FungibleToken from 0x01

transaction {
    var tempVault: @FungibleToken.Vault

    prepare(acct: AuthAccount) {
        let vaultRef = acct.borrow<&FungibleToken.Vault>(from: /storage/MainVault)
            ?? panic("Could not borrow vault reference")

        self.tempVault <- vaultRef.withdraw(amount: 30.0)
    }

    execute {
        let recipient = getAccount(0x01)
        let receiverRef = recipient
            .getCapability(/public/MainReceiver)
            .borrow<&FungibleToken.Vault{FungibleToken.Receiver}>()
                ?? panic("Could not get reference to the receiver")

        receiverRef.deposit(from: <- self.tempVault)
        log("Transfer succeeded")
    }
}
