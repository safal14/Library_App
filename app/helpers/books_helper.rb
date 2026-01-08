    module BooksHelper
  def formatted_author(book)
    if book.rating.present? && book.rating > 4
      "Masterpiece by #{book.author}"
    else
      "by #{book.author}"
    end
  end
end

