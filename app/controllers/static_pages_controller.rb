class StaticPagesController < ApplicationController
  # 料金プラン
  FREE = "1"
  LIGHT = "2"
  STANDARD = "3"
  
  def home
  end
  
  def calc
    @result = "エラーです";
    if params[:number].present?
      if params[:plan] == FREE
        if params[:number].to_i > 1000
          @result = "通数が上限を超えています"
        else
          @result = "月額合計費用は1,000円です"
        end
      elsif params[:plan] == LIGHT
        if params[:number].to_i > 15000
          if params[:number].to_i > 1000000
            @result = "通数が上限を超えています"
          else
            @add_num = params[:number].to_i - 15000
            @total_cost = (@add_num * 5) + 5000
            @result =  "月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          end
        else
          @result =  "月額合計費用は5,000円です"
        end
      elsif params[:plan] == STANDARD
        if params[:number].to_i > 45000
          @add_num = params[:number].to_i - 45000
          p @add_num
          case @add_num
          when (0..50000) then
            @total_cost = (@add_num * 3) + 15000
            @result =  "月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..100000) then
            @add_num = @add_num - 50000
            @total_cost = (@add_num * 2.8) + (50000 * 3) + 15000 
            @result =  "月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..200000) then
            @add_num = @add_num - 100000
            @total_cost = (@add_num * 2.6) + (50000 * 3) + (50000 * 2.8) + 15000
            @result =  "月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..300000) then
            @add_num = @add_num - 200000
            @total_cost = (@add_num * 2.4) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + 15000
            @result =  "月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..400000) then
            @add_num = @add_num - 300000
            @total_cost = (@add_num * 2.2) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + 15000
            @result =  "月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..500000) then
            @add_num = @add_num - 400000
            @total_cost = (@add_num * 2) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + (100000 * 2.2) + 15000
            @result =  "月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..600000) then
            @add_num = @add_num - 500000
            @total_cost = (@add_num * 1.9) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + (100000 * 2.2) + (100000 * 2) + 15000
            @result =  "月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..700000) then
            @add_num = @add_num - 600000
            @total_cost = (@add_num * 1.8) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + (100000 * 2.2) + (100000 * 2) + (100000 * 1.9) + 15000
            @result =  "月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..800000) then
            @add_num = @add_num - 700000
            @total_cost = (@add_num * 1.7) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + (100000 * 2.2) + (100000 * 2) + (100000 * 1.9) + (100000 * 1.8) + 15000
            @result =  "月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..900000) then
            @add_num = @add_num - 800000
            @total_cost = (@add_num * 1.6) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + (100000 * 2.2) + (100000 * 2) + (100000 * 1.9) + (100000 * 1.8) + (100000 * 1.7) + 15000
            @result =  "月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          when (0..1000000) then
            @add_num = @add_num - 900000
            @total_cost = (@add_num * 1.5) + (50000 * 3) + (50000 * 2.8) + (100000 * 2.6) + (100000 * 2.4) + (100000 * 2.2) + (100000 * 2) + (100000 * 1.9) + (100000 * 1.8) + (100000 * 1.7) + (100000 * 1.6) + 15000
            @result =  "月額合計費用は#{@total_cost.to_s(:delimited)}円です"
          else
            @result =  "通数が上限を超えています"
          end
        else
          @result =  "月額合計費用は15,000円です"
        end
      end
      results = { :results => @result }
      render partial: 'result', locals: { :results => results }
    end
  end
end
