require 'rails_helper'
require_relative '../../lib/scoping.rb'

describe Scoping::Retrieve do
  context 'scoped(user)' do
    let(:coach) { create(:coach_user) }
    let(:athlete) { create(:athlete_user) }
    let(:role1) { create(:role) }
    let(:role2) { create(:role) }
    let!(:document1) { create(:document) }
    let!(:document2) { create(:document) }

    it 'returns all resources when user is a coach' do
      result = Document.scoped(coach)
      expect(result.count).to eq(Document.count)
      expect(result.first).to eq(document1)
      expect(result.second).to eq(document2)
    end

    it 'returns only the resources the user has access to when they are an athlete' do
      Scope.create(resource: 'Document', resource_id: document1.id, role_id: role1.id)
      athlete.add_role role1.name
      result = Document.scoped(athlete)
      expect(result.count).to eq(1)
      expect(result.first).to eq(document1)
    end
  end
end

describe Scoping::Scopey do
  context 'scopify(roles)' do
    let!(:role1) { create(:role) }
    let!(:role2) { create(:role) }
    let!(:doc) { create(:document) }

    it 'adds the selected roles only when roles is defined' do
      doc.scopify([role1.id])
      expect(Scope.where(resource_id: doc.id).first.role_id).to eq(role1.id)
    end

    it 'adds all the roles when no roles are given' do
      doc.scopify(nil)
      expect(Scope.where(resource_id: doc.id).count).to eq(Role.count)
    end
  end
end
