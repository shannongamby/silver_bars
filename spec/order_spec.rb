require 'order'

describe Order do
  before :each do
    subject.create(1, 10, 100, :BUY)
  end
  
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
end
