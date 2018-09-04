class SalesController < ApplicationController
  def done
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sales_params)
    @sale.total = @sale.value.to_i - @sale.discount.to_i
    if @sale.tax == 0
      @sale.total = @sale.value - (@sale.value * 0.19)
      @sale.tax = 19
    end

    if @sale.tax == 1
      @sale.total = @sale.total
      @sale.tax = 0
    end
    @sale.save

    if @sale.save
      redirect_to sales_done_path
    else
      redirect_to sales_new_path
    end
  end

  private
  def sales_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end
end
