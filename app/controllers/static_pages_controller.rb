class StaticPagesController < ApplicationController
  # 料金プラン
  FREE = 1
  LIGHT = 2
  STANDARD = 3
  
  FREE_LIMIT = 1000
  LIGHT_LIMIT = 15000
  
  FREE_FEE = 0
  LIGHT_FEE = 5000
  
  LIGHT_UNIT_PRICE = 5
  
  def home
  end
  
  def calc
    
    if params[:number].empty?
      return
    end
    
    if params[:plan] == FREE
      if params[:number] > FREE_LIMIT
        @result = "通数が上限を超えています"
      else
        @result = "#{FREE_FEE}円です"
      end
    elsif params[:plan] == LIGHT
      if params[:number] > LIGHT_LIMIT
        @add_num = params[:number] - LIGHT_LIMIT
        @total_cost = @add_num * LIGHT_UNIT_PRICE + LIGHT_FEE
        @result =  "#{@total_cost}円です"
      else
        @result =  "#{LIGHT_FEE}円です"
      end
    elsif params[:plan] == STANDARD
    
      
    end
    # respond_to do |format|
    #   format.html { redirect_to @result, notice: 'Novel was successfully created.' }
    #   format.json { render :show, status: :created, location: @result }
    #   #scaffoldにformat.jsを追加
    #   format.js
    # end
  end
end
