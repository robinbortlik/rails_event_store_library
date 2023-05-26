module Books
  module Models
    class Book < ApplicationRecord
      self.table_name = 'books'

      def status
        user_id ? 'Borrowed' : 'Available'
      end
    end
  end
end