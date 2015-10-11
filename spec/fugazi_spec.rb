require 'spec_helper'

module Fugazi
  describe Fugazi do
    it 'can initialize fields' do
      class A
        include Fugazi

        fields :a, :z
      end

      a = A.new 2, 4
      expect(a.a).to eq 2
      expect(a.z).to eq 4
    end

    it 'can initialize default args' do
      class A2
        include Fugazi

        defaults a: 0, z: []
      end

      a = A2.new 4
      expect(a.a).to eq 4
      expect(a.z).to eq []
    end

    it 'can initialize keywords args' do
      class Z
        include Fugazi

        fields :name
        keywords :z, y: {}
      end

      z = Z.new nil, z: 8
      expect(z.name).to be nil
      expect(z.z).to eq 8
      expect(z.y).to eq({})
    end
  end
end

