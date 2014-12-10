require 'docking_station'

describe DockingStation do

	let(:station) { DockingStation.new(:capacity => 20) }
	let(:bike) { double :bike }

	it 'should be able to dock a bike' do
		expect(station.bike_count).to eq 0
		station.dock(:bike)
		expect(station.bike_count).to eq 1
	end

	it 'should be able to release a bike' do
		station.dock(:bike)
		expect(station.bike_count).to eq 1
		station.release(:bike)
		expect(station.bike_count).to eq 0
	end

	it 'should be know when its full' do
		expect(station).not_to be_full
		fill_station
		expect(station).to be_full
	end

	it 'should not be able to accept a bike when full' do 
		fill_station
		expect{station.dock(:bike)}.to raise_error(RuntimeError, 'station is full')
	end

	def fill_station
		20.times { station.dock(Bike.new) }
	end

	it 'should provide the list of available bikes' do
	  working_bike, broken_bike = Bike.new, Bike.new
	  broken_bike.break!
	  station.dock(working_bike)
	  station.dock(broken_bike)
	  expect(station.available_bikes).to eq([working_bike])
	end

end