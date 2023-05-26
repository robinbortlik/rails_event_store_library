require 'rails_helper'

RSpec.describe Books::Aggregates::Book, type: :aggregate do
  let(:book_id) { SecureRandom.uuid }
  let(:user_id) { SecureRandom.uuid }

  it 'can be borrowed' do
    book = Books::Aggregates::Book.new(book_id)
    book.borrow(user_id)

    expect(book).to have_applied(an_event(Books::Events::Borrowed).with_data(book_id: book_id, user_id: user_id))
    expect(book.status).to eq(:borrowed)
  end

  it 'cannot be borrowed if already borrowed' do
    book = Books::Aggregates::Book.new(book_id)
    book.borrow(user_id)

    expect {
      book.borrow(SecureRandom.uuid)
    }.to raise_error(Books::Aggregates::Book::BookAlreadyBorrowed)
  end

  it 'can be returned' do
    book = Books::Aggregates::Book.new(book_id)
    book.borrow(user_id)
    book.return

    expect(book).to have_applied(an_event(Books::Events::Returned).with_data(book_id: book_id))
    expect(book.status).to eq(:available)
  end

  it 'cannot be returned if already available' do
    book = Books::Aggregates::Book.new(book_id)

    expect {
      book.return
    }.to raise_error(Books::Aggregates::Book::BookAlreadyReturned)
  end
end