module Books
  module Commands
    module Handlers
      class OnBorrow
        include Infra::CommandHandler

        def call(command)
          with_aggregate(Books::Aggregates::Book, command.book_id) do |book|
            book.borrow(command.user_id)
          end
        end
      end
    end
  end
end