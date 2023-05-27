require 'rails_helper'

RSpec.describe Books::Events::Handlers::OnBorrow do
  describe '#call' do
    let(:book) { Books::Models::Book.create!(title: 'Hobit' ) }
    let(:user) { Users::Models::User.create!(name: 'John Doe') }
    let(:event) { instance_double(Books::Events::Borrowed, data: { book_id: book.id, user_id: user.id }) }

    it 'updates the book with the user_id' do
      expect { subject.call(event) }.to change { book.reload.user_id }.from(nil).to(user.id)
    end
  end
end