class Quote < ActiveRecord::Base

  after_create :ask_esperanza

  def ask_esperanza
    AskEsperanzaJob.perform_later(self.id)
  end

  def vote_up!
    self.vote_ups += 1
  end

  def vote_down!
  	self.vote_downs += 1
  end

  def tot_votes
    self.vote_ups - self.vote_downs
  end
end
