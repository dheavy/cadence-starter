import FungibleToken from 0x01

pub fun main() {
    let acct1 = getAccount(0x01)
    let acct2 = getAccount(0x02)

    let acct1ReceiverRef = acct1
        .getCapability<&FungibleToken.Vault{FungibleToken.Balance}>(/public/MainReceiver)
        .borrow()
            ?? panic("Could not borrow a reference to the acct1 receiver")

    let acct2ReceiverRef = acct2
        .getCapability<&FungibleToken.Vault{FungibleToken.Balance}>(/public/MainReceiver)
        .borrow()
            ?? panic("Could not borrow a reference to the acct2 receiver")

    log("Account 1 balance")
    log(acct1ReceiverRef.balance)
    log("Account 2 balance")
    log(acct2ReceiverRef.balance)
}
