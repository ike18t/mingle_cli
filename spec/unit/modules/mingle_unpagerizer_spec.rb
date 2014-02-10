require 'spec_helper'

describe MingleUnpagerizer do
  class MockMingleModel
    attr_reader :call_count

    def initialize
      @call_count = 0
    end

    def find_every options
      @call_count += 1
      case options[:params][:page]
        when 1
          [:a, :b, :c]
        when 2
          [:d, :e, :f]
        when 3..100
          [:d, :e, :f]
      end
    end
  end

  context 'find_every' do
    it 'should return unique data when hitting a duplicate page' do
      stub_const 'MingleUnpagerizer::MINGLE_ITEMS_PER_PAGE', 3
      m = MockMingleModel.new
      m.extend MingleUnpagerizer
      m.find_every({:params => {}}).should eq([:a, :b, :c, :d, :e, :f])
      m.call_count.should eq(3)
    end

    it 'should not try for another page if count is less than the items per page' do
      stub_const 'MingleUnpagerizer::MINGLE_ITEMS_PER_PAGE', 4
      m = MockMingleModel.new
      m.extend MingleUnpagerizer
      m.find_every({:params => {}}).should eq([:a, :b, :c])
    end
  end
end
