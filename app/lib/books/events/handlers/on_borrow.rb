module Books
  module Events
    module Handlers
      class OnBorrow
        def call(event)
          book = Books::Models::Book.find_by(id: event.data[:book_id])
          book.user_id = event.data[:user_id]
          book.save
        end
      end
    end
  end
end
