module Books
  module Events
    module Handlers
      class OnReturn
        def call(event)
          book = Books::Models::Book.find_by(id: event.data[:book_id])
          book.user_id = nil
          book.save
        end
      end
    end
  end
end
