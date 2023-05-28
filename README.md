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
