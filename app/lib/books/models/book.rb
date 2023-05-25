module Books
  module Models
    class Book < ApplicationRecord
      self.table_name = 'books'
    end
  end
end