# Homework 6

Adding more functionality to the Volcano Coin contract

##### 1.We made a payment mapping, but we havenʼt added the functionality for it yet. Firstly, make your payment record mapping `public` so that view calls can be made to read the contractʼs data.

##### 2. For the payments record mapping, create a function called recordPayment that takes

    1. the senderʼs address,
    2. the receiverʼs address and
    3. amount
    as an input, then creates a new payment record.
    Add the new record to the userʼs payment record.

##### 3. Each time we make a transfer of tokens, we should call the `recordPayment` function to record the transfer.
