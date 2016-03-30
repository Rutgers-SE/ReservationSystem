# Reservation System

Nothing from the garage repo should be managed in this git repo. This is purely for creating reservations, and creating users.


## How to run

When running this rails server with the correct stripe credentials, make sure that you are in the root of the project directory, and run
```bash
  bash <(./run)
```

The `run` script depends on the `secret` file. The `secret` file is not tracked by the Git repo, and should be requested from the owner through email.

This will change eventually, so make sure you stay updated on how to run it


## Backend Heavy
- [x] Basic User authentication
- [ ] Payment Controller
  - [x] Setup Stripe Account
  - [x] Integrate Stripe into Rails
  - [x] Implement a payment API so that models that act as 'items' can be made purchasable and given a price.
  - [x] Create UI for the Owner to change prices
	- [ ] Integrate this into the owner dashboard
- [x] Reservation Creation (CRUD)
  - [ ] Make the reservation model conform to the payment service API
- [ ] Garage HTTP Interface Controller
- [ ] Owner Finance Panel
- [ ] Admin Switch Panel


## Frontend heavy

This portion should be left for the final demo. In this portion, we will be converting the static pages that are generated at every request into single page applications.

- [ ] Convert CRUD into single page experiences.
  - [ ] User
  - [ ] Reservation
  - [ ] Admin Switch Panel

### Making resources purchasable

Inside the model class that you want to make purchasable, you will need to add

```ruby
  class NowPurchasable < ActiveRecord::Base
    has_one :price, as: :item
  end
```

### Payment Testing

#### Filling in the form
- Email must be the email of the user.
- Credit card should be one of the number from the table below
  - Unless "remember me" button is clicked. If so, to token generated by stripe should be saved into the payment database.
- Any future day can be used as the credit card exiration date.
- Any CVC number can be used (try 3 or 4 digits)

##### Successful Numbers
| Number           | Card type            |
|------------------|----------------------|
| 4242424242424242 | Visa                 |
| 4012888888881881 | Visa                 |
| 4000056655665556 | Visa (debit)         |
| 5555555555554444 | MasterCard           |
| 5200828282828210 | MasterCard (debit)   |
| 5105105105105100 | MasterCard (prepaid) |
| 378282246310005  | American Express     |
| 371449635398431  | American Express     |
| 6011111111111117 | Discover             |
| 6011000990139424 | Discover             |
| 30569309025904   | Diners Club          |
| 38520000023237   | Diners Club          |
| 3530111333300000 | JCB                  |
| 3566002020360505 | JCB                  |

Other important numbers for testing creditcar payment

|Number          |    Description                                                                                                                                                     |
|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|4000000000000077|  Charge will succeed and funds will be added directly to your available balance (bypassing your pending balance).                                                  |
|4000000000000093|  Charge will succeed and domestic pricing will be used (other test cards use international pricing). This card is only significant in countries with split pricing.|
|4000000000000010|  With default account settings, charge will succeed but address_line1_check and address_zip_check will both fail.                                                  |
|4000000000000028|  With default account settings, charge will succeed but address_line1_check will fail.                                                                             |
|4000000000000036|  With default account settings, charge will succeed but address_zip_check will fail.                                                                               |
|4000000000000044|  With default account settings, charge will succeed but address_zip_check and address_line1_check will both be unavailable.                                        |
|4000000000000101|  With default account settings, charge will succeed unless a CVC is entered, in which case cvc_check will fail and the charge will be declined.                    |
|4000000000000341|  Attaching this card to a Customer object will succeed, but attempts to charge the customer will fail.                                                             |
|4000000000000002|  Charge will be declined with a card_declined code.                                                                                                                |
|4100000000000019|  Charge will be declined with a card_declined code and a fraudulent reason.                                                                                        |
|4000000000000127|  Charge will be declined with an incorrect_cvc code.                                                                                                               |
|4000000000000069|  Charge will be declined with an expired_card code.                                                                                                                |
|4000000000000119|  Charge will be declined with a processing_error code.                                                                                                             |
