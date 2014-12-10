require 'garage'

describe Garage do

	let(:garage) { Garage.new }
	let(:bike) { double :bike }
	let(:broken_bike) { double :bike, :broken? }

	it 'should be able to accept bikes from van' do
		expect(garage.bike_count).to eq 0
		50.times { garage.van_unload(:bike) }
		expect(garage.bike_count).to eq 50
	end

end