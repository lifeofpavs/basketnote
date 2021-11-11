# frozen_string_literal: true

class PointsReflex < ApplicationReflex
  def increment
    if element.dataset[:team] == 'a'
      @points_a = element.dataset[:points_a].to_i +  element.dataset[:step].to_i
      @points_b = element.dataset[:points_b]
    elsif element.dataset[:team] == 'b'
      @points_a = element.dataset[:points_a]
      @points_b = element.dataset[:points_b].to_i +  element.dataset[:step].to_i
    end
    @loser_message = set_loser_message
  end

  def reset
    @points_a = 0
    @points_b = 0
    @loser_message = ''
  end

  def set_loser_message
    if @points_a.to_i < @points_b.to_i
       'A is a loser, B is winning'
    elsif @points_a.to_i > @points_b.to_i
      'B is a loser, A is winning' 
    else 
      'A and B are in a tie'
    end
  end
end
