module Books
  module Commands
    module Handlers
      class OnReturn
        include Infra::CommandHandler

        def call(command)
          with_aggregate(Books::Aggregates::Book, command.book_id) do |book|
            book.return
          end
        end
      end
    end
  end
end