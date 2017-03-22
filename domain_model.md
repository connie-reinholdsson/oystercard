# Domain Model

##User Story 4
In order to pay for my journey
As a customer
I need my fare deducted from my card

### Nouns:
In order to pay for my journey
As a **customer**
I need my fare deducted from my **card**

### Verbs
In order to **pay** for my journey
As a customer
I need my fare **deducted** from my card

### Objects
1. User (customer)
2. Card
### Messages
1. Card => Fare deducted


##User Story 5
In order to get through the barriers.
As a customer
I need to touch in and out.

### Nouns
In order to get through the **barriers**.
As a **customer**
I need to touch in and out.
### Verbs
In order to get through the barriers.
As a customer
I need to **touch in and out**.
### Objects
1. User (customer)
2. Card
### Messages
1. Card => Touch In
2. Card => Touch Out


##User Story 6
In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.
### Nouns
In order to pay for my journey
As a **customer**
I need to have the minimum amount (£1) for a **single journey**.
### Verbs
In order to **pay** for my journey
As a customer
I need to **have the minimum amount (£1)** for a single journey.
### Objects
1. User (customer)
2. Card
### Messages
1. Card => To pay, condition: balance = 1

##User Story 7
In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card
### Nouns
In order to pay for my journey
As a **customer**
When my journey is complete, I need the correct amount deducted from my **card**
### Verbs
In order to **pay** for my journey
As a customer
When my journey is complete, I need the correct amount **deducted** from my card
### Objects
1. User (customer)
2. Card
### Messages
1. Card => Deducted, when touching out

##User Story 8
In order to pay for my journey
As a customer
I need to know where I've travelled from
### Nouns
In order to pay for my journey
As a **customer**
I need to know where I've travelled from
### Verbs
In order to pay for my journey
As a customer
I need to **know where I've travelled from**
### Objects
1. User (customer)
2. Card
### Messages
2. Card => Take station during touch_in
2. Card => Keep record of journeys

##User Story 8
In order to know where I have been
As a customer
I want to see to all my previous trips
### Nouns
In order to know where I have been
As a **customer**
I want to see to all my **previous trips**
### Verbs
In order to know where I have been
As a customer
I want to **see to all my previous trips**
### Objects
1. User (customer)
2. Card
### Messages
2. Card => Record the journeys
2. Card => Store the journeys
3. Card => Displaying the journeys
