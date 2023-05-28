# Library app

## Setup

```bash
git clone git@github.com:robinbortlik/rails_event_store_library.git
```

```bash
bundle install
bundle exec rake db:setup
```

## About project

This is experimental project built just for education purposes.

Application implements basic "Library" functions to keep evidence of borrowed and returned books.

## Demo app
App is available on [https://rails-event-store-library.herokuapp.com/](https://rails-event-store-library.herokuapp.com/)

## Screenshots
<img width="1291" alt="Screenshot 2023-05-28 at 21 44 08" src="https://github.com/robinbortlik/rails_event_store_library/assets/228502/e870b9f0-1936-4099-802e-3045611a968f">

<img width="1254" alt="Screenshot 2023-05-28 at 21 44 15" src="https://github.com/robinbortlik/rails_event_store_library/assets/228502/ad5dce00-a95f-41be-8aff-849866a08d20">

## Architecture

All object state changes are handled as events with help of Rails Event Store library

### Files structure

```
- app
 |
  - lib
   |
    - Domain (Books, Users)
      |
        - Purpose (Models, Events, Commands, Aggregates)
          |
          - Class/Module name (book.rb, borrow.rb, on_return.rb)
```

### Flow

```
  HTTP -> controller#action
          -> command_bus(command)
            -> aggregate.action
              -> event triggered
                -> event store updated
                -> read_model updated
```

### Unknowns

- [ ] How to correctly design and update the read model, so I do not need to duplicate business logic between aggregate root and read model
- [ ] How read model handles updates on linked objects:

  Example: `Book read model` stores `User full name`. User updates his name, shall I subscribe book to `User name changed` event and update the user name stored on the book record?
