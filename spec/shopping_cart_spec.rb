require 'rspec'
require_relative '../book'
require_relative '../shopping_cart'

RSpec.describe '.total_price' do
  subject { cart.total_price }
  let(:cart) { ShoppingCart.new }
  let(:book_1) { Book.new(title: '1') }
  let(:book_2) { Book.new(title: '2') }
  let(:book_3) { Book.new(title: '3') }
  let(:book_4) { Book.new(title: '4') }
  let(:book_5) { Book.new(title: '5') }
  context 'Only one book in the basket' do
    before do
      cart.add_book(book_1)
    end
    it 'price should eq to 8 euros' do
      expect(subject).to eq(8)
    end
  end

  context 'Two book in the basket' do
    context 'Different book' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_2)
      end
      it 'should apply 5%' do
        expect(subject).to eq(15.20)
      end
    end

    context 'Same book' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_1)
      end
      it 'price should eq to 16 euros' do
        expect(subject).to eq(16)
      end
    end
  end

  context 'Three book in the basket' do
    context 'Three differents book' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_2)
        cart.add_book(book_3)
      end

      it 'should apply 10%' do
        expect(subject).to eq(21.6)
      end
    end

    context 'Two diffent book' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_2)
        cart.add_book(book_1)
      end
      it 'should apply 5% ' do
        expect(subject).to eq(22.8)
      end
    end

    context 'Same book' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_1)
        cart.add_book(book_1)
      end
      it 'shouldnt have any discount' do
        expect(subject).to eq(24)
      end
    end
  end

  context 'Four Book in the basket' do
    context 'Four differents books' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_2)
        cart.add_book(book_3)
        cart.add_book(book_4)
      end

      it 'should apply 20%' do
        expect(subject).to eq(25.6)
      end
    end
    context 'three differents books' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_2)
        cart.add_book(book_3)
        cart.add_book(book_1)
      end
      it 'should have 10% on three book' do
        expect(subject).to eq(28.8)
      end
    end

    context 'two differents books' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_2)
        cart.add_book(book_2)
        cart.add_book(book_2)
      end
      it 'should apply discount 5%' do
        expect(subject).to eq(30.4)
      end
    end

    context 'two same book in the basket' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_1)
        cart.add_book(book_2)
        cart.add_book(book_2)
      end

      it 'should apply 5%' do
        expect(subject).to eq(30.4)
      end
    end

    context 'two same book and two different' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_1)
        cart.add_book(book_2)
        cart.add_book(book_3)
      end

      it 'should aplply 20%' do
        expect(subject).to eq(28.8)
      end
    end

    context 'no differents books' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_1)
        cart.add_book(book_1)
        cart.add_book(book_1)
      end
      it 'should not apply discount' do
        expect(subject).to eq(32)
      end
    end
  end

  context 'Five book in the basket' do
    context 'Five differents books' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_2)
        cart.add_book(book_3)
        cart.add_book(book_4)
        cart.add_book(book_5)
      end
      it 'should apply discount 25%' do
        expect(subject).to eq(30)
      end
    end
    context 'Four differents books' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_2)
        cart.add_book(book_3)
        cart.add_book(book_4)
        cart.add_book(book_4)
      end
      it 'should apply discount 20%' do
        expect(subject).to eq(32)
      end
    end
    context 'Three differents books' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_2)
        cart.add_book(book_3)
        cart.add_book(book_3)
        cart.add_book(book_2)
      end
      it 'should apply discount 10%' do
        expect(subject).to eq(36)
      end
    end
    context 'Two differents books' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_4)
        cart.add_book(book_4)
        cart.add_book(book_4)
        cart.add_book(book_1)
      end
      it 'should apply discount 5%' do
        expect(subject).to eq(38)
      end
    end

    context 'No differents books' do
      before do
        cart.add_book(book_1)
        cart.add_book(book_1)
        cart.add_book(book_1)
        cart.add_book(book_1)
        cart.add_book(book_1)
      end
      it 'no discount' do
        expect(subject).to eq(40)
      end
    end
  end
end
