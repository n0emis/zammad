# Copyright (C) 2012-2021 Zammad Foundation, http://zammad-foundation.org/

require 'rails_helper'

RSpec.describe 'Group', type: :request, authenticated_as: -> { user } do
  describe 'Zammad returns stack error when one tries to remove groups via API #3841' do
    let(:group) { create(:group) }
    let(:ticket) { create(:ticket, group: group) }
    let(:user) { create(:admin) }

    before do
      ticket
    end

    it 'does return reference error on delete if related objects exist' do
      delete "/api/v1/groups/#{group.id}", params: {}, as: :json
      expect(json_response['error']).to eq("Can't delete, object has references.")
    end
  end
end
