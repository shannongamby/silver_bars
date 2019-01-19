require 'order'

describe Order do
  subject { described_class.new(1, 10, 100, :BUY, 1) }

  it 'should store the user_id' do
    expect(subject.user_id).to eq 1
  end

  it 'should store quantity' do
    expect(subject.quantity).to eq 10
  end

  it 'should store price' do
    expect(subject.price).to eq 100
  end

  it 'should store type' do
    expect(subject.type).to eq :BUY
  end

  it 'should store order_id' do
    expect(subject.type).to eq :BUY
  end
end
