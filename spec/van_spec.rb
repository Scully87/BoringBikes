require 'Van'

describe Van do

	let(:van) { Van.new(:capacity => 50) }
	let(:bike) { double :bike }

	it 'should be able to accept a bike' do
		expect(van.bike_count).to eq 0
		van.accept(:bike)
		expect(van.bike_count).to eq 1
	end

	it 'should be able to release bikes'  do
		van.accept(:bike)
		van.release(:bike)
		expect(van.bike_count).to eq 0
	end

	it 'should only be able to accept broken bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		van.accept(working_bike)
		van.accept(broken_bike)
		expect(van.damaged_bikes).to eq([broken_bike])
	end

	it 'should know when its full' do
		expect(van).not_to be_full
		fill_van
		expect(van).to be_full
	end

	it 'should not be able to accept a bike when full' do
		fill_van
		expect{ van.accept(:bike)}.to raise_error('Van full')
	end

	def fill_van
		50.times { van.accept(Bike.new) }
	end

end