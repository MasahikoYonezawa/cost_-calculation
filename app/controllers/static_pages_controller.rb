class StaticPagesController < ApplicationController
  # 料金プラン
  FREE = "1"
  LIGHT = "2"
  STANDARD = "3"
  
  NOT_JOIN = "0"
  OLD_FREE = "1"
  BASIC = "2"
  PRO = "3"
  PRO_API = "4"
  
  def home
  end
  
  def calc
    @result = "エラーです";
    @result2 = "";
    
    if params[:number].present?
      if params[:plan] == FREE
        if params[:number].to_i > 1000
          @result = "通数が上限を超えています"
        else
          @total_cost = 1000
          @result = "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
        end
      elsif params[:plan] == LIGHT
        if params[:number].to_i > 15000
          if params[:number].to_i > 1000000
            @result = "通数が上限を超えています"
          else
            @add_num = params[:number].to_i - 15000
            @total_cost = (@add_num * 5) + 5000
            @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          end
        else
          @total_cost = 5000
          @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
        end
      elsif params[:plan] == STANDARD
        if params[:number].to_i > 45000
          @add_num = params[:number].to_i - 45000
          case @add_num
          when (0..50000) then
            @total_cost = (@add_num * 3) + 15000
            @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..100000) then
            @add_num = @add_num - 50000
            @total_cost = (@add_num * 2.8) + (50000 * 3) + 15000 
            @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..200000) then
            @add_num = @add_num - 100000
            @total_cost = (@add_num * 2.6) + (50000 * 3) + (50000 * 2.8) + 15000
            @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..300000) then
            @add_num = @add_num - 200000
            @total_cost = (@add_num * 2.4) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + 15000
            @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..400000) then
            @add_num = @add_num - 300000
            @total_cost = (@add_num * 2.2) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + 15000
            @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..500000) then
            @add_num = @add_num - 400000
            @total_cost = (@add_num * 2) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + (100000 * 2.2) + 15000
            @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..600000) then
            @add_num = @add_num - 500000
            @total_cost = (@add_num * 1.9) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + (100000 * 2.2) + (100000 * 2) + 15000
            @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..700000) then
            @add_num = @add_num - 600000
            @total_cost = (@add_num * 1.8) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + (100000 * 2.2) + (100000 * 2) + (100000 * 1.9) + 15000
            @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..800000) then
            @add_num = @add_num - 700000
            @total_cost = (@add_num * 1.7) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + (100000 * 2.2) + (100000 * 2) + (100000 * 1.9) + (100000 * 1.8) + 15000
            @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..900000) then
            @add_num = @add_num - 800000
            @total_cost = (@add_num * 1.6) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + (100000 * 2.2) + (100000 * 2) + (100000 * 1.9) + (100000 * 1.8) + (100000 * 1.7) + 15000
            @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..1000000) then
            @add_num = @add_num - 900000
            @total_cost = (@add_num * 1.5) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + (100000 * 2.2) + (100000 * 2) + (100000 * 1.9) + (100000 * 1.8) + (100000 * 1.7) + (100000 * 1.6) + 15000
            @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          else
            @result =  "通数が上限を超えています"
          end
        else
          @total_cost = 15000
          @result =  "新規プランの月額合計費用は#{@total_cost.to_s(:delimited)}円です"
        end
      end
      
      unless @result == "通数が上限を超えています"
        if params[:old_plan] == OLD_FREE
          @difference = @total_cost.to_i - 0
          @result2 =  "加入中のプランとの差額は#{@difference.to_s(:delimited)}円です"
        elsif params[:old_plan] == BASIC
          @difference = @total_cost.to_i - 5400
          @result2 =  "加入中のプランとの差額は#{@difference.to_s(:delimited)}円です"
        elsif params[:old_plan] == PRO
          @difference = @total_cost.to_i - 21600
          @result2 =  "加入中のプランとの差額は#{@difference.to_s(:delimited)}円です"
        elsif params[:old_plan] == PRO_API
          @difference = @total_cost.to_i - 32400
          @result2 =  "加入中のプランとの差額は#{@difference.to_s(:delimited)}円です"
        end
      end
    end
    
    p @result2
    results = { :results => @result, :results2 => @result2 }
    render partial: 'result', locals: { :results => results }
  end
end
