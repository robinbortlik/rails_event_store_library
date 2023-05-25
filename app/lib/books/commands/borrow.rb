module Books
  module Commands
    class Borrow < Infra::Command
      attribute :book_id, Types::Nominal::Integer
      attribute :user_id, Types::Nominal::Integer
    end
  end
end