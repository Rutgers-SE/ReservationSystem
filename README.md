# Reservation System

Nothing from the garage repo should be managed in this git repo. This is purely for creating reservations, and creating users.

## Backend Heavy
- [x] Basic User authentication
- [ ] Payment Controller
  - [x] Setup Stripe Account
  - [x] Integrate Stripe into Rails
  - [ ] Create UI for the Owner to change prices
	- [ ] Integrate this into the owner dashboard
- [ ] Reservation Creation
- [ ] Garage HTTP Interface Controller
- [ ] Owner Finance Panel
- [ ] Admin Switch Panel


## Frontend heavy

This portion should be left for the final demo. In this portion, we will be converting the static pages that are generated at every request into single page applications.

- [ ] Convert CRUD into single page experiences.
  - [ ] User
  - [ ] Reservation
  - [ ] Admin Switch Panel

### Payment Testing


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
