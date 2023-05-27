require 'rails_helper'

RSpec.describe Books::Events::Handlers::OnReturn do
  describe '#call' do
    let(:user) { Users::Models::User.create!(name: 'John Doe') }
    let(:book) { Books::Models::Book.create!(title: 'Hobit', user_id: user.id) }
    let(:event) { instance_double(Books::Events::Returned, data: { book_id: book.id }) }

    it 'sets the user_id of the book to nil' do
      described_class.new.call(event)
      expect(book.reload.user_id).to be_nil
    end
  end
end