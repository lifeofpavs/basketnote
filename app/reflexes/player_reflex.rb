# frozen_string_literal: true

class PlayerReflex < ApplicationReflex
  before_reflex do 
    @player_params = params.slice(:player_name, :player_number, :player_team)
  end

  def create_player
    new_player = Player.new({name: @player_params[:player_name], number: @player_params[:player_number], team: @player_params[:player_team], image: player_image})
    (session["players_#{@player_params[:player_team]}".to_sym] ||=[]) << new_player

    @points_a = element.dataset[:points_a].to_i
    @points_b = element.dataset[:points_b].to_i
  end

  def update_player_fouls
    @points_a = element.dataset[:points_a].to_i
    @points_b = element.dataset[:points_b].to_i

    players_team = session["players_#{@player_params[:player_team]}".to_sym]
    player = players_team.select { |m| m.name == element.dataset[:player_name] && m.number == element.dataset[:player_number] }
    player.fouls = player.fouls + 1
    session["players_#{@player_params[:player_team]}".to_sym].merge(player)
  end

  private 

  def player_image
    images = ["http://tshf.net/wp-content/uploads/2017/06/i.png", "https://estaticos-cdn.prensaiberica.es/clip/e9d928b3-b3ee-498a-9dbd-f4bc694e2916_16-9-aspect-ratio_default_0.jpg", "https://arxiu.fcbarcelona.cat/web/thumbnails/199_150/Imatges/2010-2011/basquet/primer_equip/plantilla/Juan_Carlos_Navarro.jpg"]
    images[rand(3)]
  end

end
