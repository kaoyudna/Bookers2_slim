class Public::SearchesController < ApplicationController

  def search
    @model = params[:model]
    if @model == 'user'
      @q = User.ransack(params[:q])
      @record = @q.record(distinct: true)
    elsif @model == 'book'
      @q = Book.ransack(params[:q])
      @record = @q.record(distinct: true)
    end
  end

end
