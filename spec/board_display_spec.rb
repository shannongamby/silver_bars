require 'board_display'
require 'order'

describe BoardDisplay do
  let(:aggregator) { double :aggregator }
  let(:sorter) { double :sorter }
  subject { described_class.new(aggregator, sorter) }

  before :each do
    @order_one = {:price => 1, :quantity => 5}
  end

  context 'printing' do
    it 'prints the type, quantity, and price' do
      expect { subject.display([@order_one], :BUY) }.to output(
        "BUY: 5kg for £1\n" \
      ).to_stdout
    end
  end

  context 'when #print_board is called' do
    it 'should pass the orders to @sorter and @aggregator' do
      aggregator = spy('aggregator')
      sorter = spy('sorter')
      subject = BoardDisplay.new(aggregator, sorter)
      subject.print_board(@order_one, @order_one)
      expect(sorter).to have_received(:sort).twice
      expect(aggregator).to have_received(:aggregate).twice
    end
  end
end
