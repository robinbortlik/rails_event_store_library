module Books
  module Aggregates
    class Book
     include AggregateRoot

      BookAlreadyBorrowed = Class.new(StandardError)
      BookAlreadyReturned = Class.new(StandardError)

      def initialize(id)
        @id = id
        @status = :available
      end

      def borrow(user_id)
        raise BookAlreadyBorrowed if @status == :borrowed
        apply(Events::Borrowed.new(data: { book_id: @id, user_id: user_id }))
      end

      def return
        raise BookAlreadyReturned if @status == :available
        apply(Events::Returned.new(data: { book_id: @id }))
      end


      private

      on Events::Borrowed do |event|
        @user_id = event.data.fetch(:user_id)
        @status = :borrowed
      end

      on Events::Returned do |event|
        @user_id = nil
        @status = :available
      end
    end
  end
end