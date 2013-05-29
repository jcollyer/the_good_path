class Api::BooksPresenter

  attr_reader :book

  def initialize(book)
    @book = book
  end

  def as_json(options = {})
    {
      :book => book_array
    }
  end

  def book_array
    book.map do |book|
      Api::BookPresenter.new(book).book_hash
    end
  end
end
