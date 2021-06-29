class FieldsController < ApplicationController 
  def home
    @fields = Field.all
    render json: @fields
  end
end
  
  
