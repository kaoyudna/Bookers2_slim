class Public::SearchesController < ApplicationController

  def search
    @model = params[:model]
    if @model == 'user'
      @q = User.ransack(name_cont: params[:q])
      @record = @q.result
    elsif @model == 'book'
      @q = Book.ransack(title_or_body_cont: params[:q])
      @record = @q.result
    end
  end

end
