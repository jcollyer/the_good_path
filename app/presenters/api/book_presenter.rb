class Api::BookPresenter

  attr_reader :book

  def initialize(book)
    @book = book
  end

  def as_json(options = {})
    {
      :book => book_hash
    }
  end

  def book_hash
    {
      :id => book.id,
      :title => book.title,
      :summary => book.summary
    }
  end
end
