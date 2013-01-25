require './darts.rb'

describe Darts do
  describe '.get_theta' do
    it 'should return the correct theta for 1, 3' do
      Darts.get_theta(1,3).should be_within(0.01).of 71.57
    end

    it 'should return the correct theta for 1, 4' do
      Darts.get_theta(1,4).should be_within(0.01).of 75.96
    end

    it 'should return the correct theta for 0, 4' do
      Darts.get_theta(0,4).should == 90
    end

    it 'should return the correct theta for 0, -4' do
      Darts.get_theta(0,-4).should == 270
    end

    it 'should return the correct theta for 4, 0' do
      Darts.get_theta(4,0).should == 0
    end

    it 'should return the correct theta for -4, 0' do
      Darts.get_theta(-4,0).should == 180
    end

    it 'should return the correct theta for 0, 0' do
      lambda {
        Darts.get_theta(0,0)
      }.should raise_error
    end
  end

  describe '.distance_from_bullseye' do
    it 'should give the correct distance to the bullseye for 1, 3' do
      Darts.distance_from_bullseye(1,3).should be_within(0.01).of 3.16
    end

    it 'should give the correct distance to the bullseye for 3, 4' do
      Darts.distance_from_bullseye(3,4).should be_within(0).of 5
    end

    it 'should give the correct distance to the bullseye for 0, 0' do
      Darts.distance_from_bullseye(0,0).should be_within(0).of 0
    end

    it 'should give the correct distance to the bullseye for -3, -4' do
      Darts.distance_from_bullseye(-3,-4).should be_within(0).of 5
    end
  end

  describe '.slice' do
    it 'should return 13 for a theta of 11' do
      Darts.slice(11).should == 13
    end

    it 'should return 4 for a theta of 28' do
      Darts.slice(28).should == 4
    end
  end
end
