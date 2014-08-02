require 'spec_helper'

module XOX
  describe Square do
    it 'has a sensible hash function' do
      expect(Square::Full['O'].hash).to eq 'O'.hash
    end
  end
end
