require_relative '../../../test_helper'

describe MingleModel do
  context 'with attributes' do
    before do
      @mingle = MingleModel.new
      @mingle.attributes = { 'foo' => 'bar', 'bizz' => 'buzz' }
    end

    it { @mingle.foo.should eq('bar') }

    it { @mingle.bizz.should eq('buzz') }
  end

  context 'with properties' do
    before do
      @mingle = MingleModel.new
      @mingle.properties = [ OpenStruct.new({ :name => 'foo', :value => 'bar' }), OpenStruct.new({ :name => 'bizz', :value => 'buzz' }) ]
    end

    it { @mingle.foo.should eq('bar') }

    it { @mingle.bizz.should eq('buzz') }
  end

  it { expect { MingleModel.new.invalid_method }.to raise_error(NoMethodError) }

  context 'key encode' do
    before do
      @mingle = MingleModel.new
      @mingle.properties = [ OpenStruct.new({ :name => 'Foo Bar', :value => 'bar' }) ]
    end

    it { @mingle.foo_bar.should eq('bar') }
  end
end
