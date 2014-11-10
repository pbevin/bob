class BobController < ApplicationController
  before_action :stare_blankly

  def kick
    render json: kick_bob
  end

  def joke
    render json: tell_joke
  end

  private

  def stare_blankly
    sleep rand() * 2.0
  end

  def tell_joke
    case rand(1..3)
    when 1
      mood("sad", "Your joke bombed. Better luck next time.")
    else
      mood("happy", "Bob laughs.")
    end
  end

  def kick_bob
    case rand(1..3)
    when 1
      mood("happy", "Joke's on you! Bob had armor plating. You hurt your foot.")
    else
      mood("sad", "Bob starts to cry.")
    end
  end

  def mood(mood, message)
    { mood: mood, message: message }
  end
end
