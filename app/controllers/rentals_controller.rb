class RentalsController < ApplicationController
  def checkout
    @books = Book.all
  end
  byebug
  def process_checkout
    CheckoutService.new(params).call

    redirect_to checkout_path, notice: "Book successfully checked out!"
  end
  def history
  @customers = Customer.all
  @selected_customer = Customer.find_by(id: params[:customer_id])
  @rentals = @selected_customer.rentals.includes(:book) if @selected_customer
  end
  private

  def rental_params
    params.permit(:book_id, :customer_email, :rented_on, :returned_on)
  end
end
