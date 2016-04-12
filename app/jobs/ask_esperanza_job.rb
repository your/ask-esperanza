class AskEsperanzaJob < ActiveJob::Base
  queue_as :high

  def perform(quote_id)
    @quote = Quote.find_by(id: quote_id)

    # This might take a little bit..
    @esperanza = Esperanza.help?

    @quote.update(value: @esperanza)
  end
end
