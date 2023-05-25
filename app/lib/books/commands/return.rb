module Books
  module Commands
    class Return < Infra::Command
      attribute :book_id, Types::Nominal::Integer
    end
  end
end