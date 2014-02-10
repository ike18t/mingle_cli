require 'spec_helper'

describe Formattable do
  before do
    @card = Card.find 19480
    @card.extend Formattable
  end

  it { @card.format('no attributes here').should eq('no attributes here') }

  it { @card.status.should eq(@card.format('[status]')) }

  it { @card.format('name is [name], status is [status]').should eq("name is #{@card.name}, status is #{@card.status}") }

  it { expect { @card.format('[not invalid] is invalid') }.to raise_error(NoMethodError) }

  it { @card.format('').should be_empty }

end
