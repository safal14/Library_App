class RentalsController < ApplicationController
  def checkout
    @books = Book.all
  end
  
  def process_checkout
    CheckoutService.new(params).call

    redirect_to checkout_path, notice: "Book successfully checked out!"
  end

  private

  def rental_params
    params.permit(:book_id, :customer_email, :rented_on, :returned_on)
  end
end