require 'rails_helper'

RSpec.describe Quote, type: :model do

  let(:quote) { create(:quote) }

  describe "model" do
    it { expect(subject).to have_db_column(:value).of_type(:string) }
    it { expect(subject).to have_db_column(:vote_ups).of_type(:integer).with_options(default: 0) }
    it { expect(subject).to have_db_column(:vote_downs).of_type(:integer).with_options(default: 0) }
    it { expect(subject).to have_db_column(:created_at).of_type(:datetime) }
    it { expect(subject).to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "#vote_up!" do
    it { expect{ quote.vote_up! }.to change{ quote.vote_ups }.from(0).to(1) }
  end

  describe "#vote_down!" do
    it { expect{ quote.vote_down! }.to change{ quote.vote_downs }.from(0).to(-1) }
  end

  describe "#tot_votes" do
    it { expect(quote.tot_votes).to eq 0 }
  end
end