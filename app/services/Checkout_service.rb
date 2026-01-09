class CheckoutService
  def initialize(params)
    @book_id        = params[:book_id]
    @customer_email = params[:customer_email]
    @rented_on      = params[:rented_on]
    @returned_on    = params[:returned_on]
  end

  def call
    book = Book.find(@book_id)

    customer = Customer.find_or_create_by(email: @customer_email.downcase.strip) do |c|
      c.name = @customer_email.split('@').first.capitalize
    end

    Rental.create!(
      book: book,
      customer: customer,
      rented_on: @rented_on,
      returned_on: @returned_on
    )
  end

  private

  def extract_name_from_email(email)
    email.split('@').first.capitalize
  end
end