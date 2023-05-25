module Users
  module Models
    class User < ApplicationRecord
      self.table_name = 'users'
    end
  end
end