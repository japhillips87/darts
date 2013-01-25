require './darts.rb'

describe Darts do
  describe '.get_theta' do
    it 'should return the correct theta for 1, 3' do
      Darts.new(1,3).get_theta.should be_within(0.01).of 71.57
    end

    it 'should return the correct theta for 1, 4' do
      Darts.new(1,4).get_theta.should be_within(0.01).of 75.96
    end

    it 'should return the correct theta for 0, 4' do
      Darts.new(0,4).get_theta.should == 90
    end

    it 'should return the correct theta for 0, -4' do
      Darts.new(0,-4).get_theta.should == 270
    end

    it 'should return the correct theta for 4, 0' do
      Darts.new(4,0).get_theta.should == 0
    end

    it 'should return the correct theta for -4, 0' do
      Darts.new(-4,0).get_theta.should == 180
    end

    it 'should return the correct theta for 0, 0' do
      lambda {
        Darts.new(0,0).get_theta
      }.should raise_error
    end
  end

  describe '.distance_from_bullseye' do
    it 'should give the correct distance to the bullseye for 1, 3' do
      Darts.new(1,3).distance_from_bullseye.should be_within(0.01).of 3.16
    end

    it 'should give the correct distance to the bullseye for 3, 4' do
      Darts.new(3,4).distance_from_bullseye.should be_within(0).of 5
    end

    it 'should give the correct distance to the bullseye for 0, 0' do
      Darts.new(0,0).distance_from_bullseye.should be_within(0).of 0
    end

    it 'should give the correct distance to the bullseye for -3, -4' do
      Darts.new(-3,-4).distance_from_bullseye.should be_within(0).of 5
    end
  end

  describe '.slice' do
    it 'should return 6 for a theta of 1' do
      Darts.slice(1).should == 6
    end

    it 'should return 13 for a theta of 11' do
      Darts.slice(11).should == 13
    end

    it 'should return 4 for a theta of 28' do
      Darts.slice(28).should == 4
    end

    it 'should return 20 for a theta of 90' do
      Darts.slice(90).should == 20
    end

    it 'should return 11 for a theta of 180' do
      Darts.slice(180).should == 11
    end

    it 'should return 3 for a theta of 270' do
      Darts.slice(270).should == 3
    end

    it 'should return 6 for a theta of 359' do
      Darts.slice(359).should == 6
    end

    it 'should return 6 for a theta of 360' do
      Darts.slice(360).should == 6
    end

    it 'should return 6 for a theta of 720' do
      Darts.slice(720).should == 6
    end
  end

  describe '.ring' do
    it 'should return ring 1 for 0.4' do
      Darts.ring(0.4).should == 1
    end

    it 'should return ring 2 for 1.25' do
      Darts.ring(1.25).should == 2
    end

    it 'should return ring 3 for 4.025' do
      Darts.ring(4.025).should == 3
    end

    it 'should return ring 4 for 4.2' do
      Darts.ring(4.2).should == 4
    end

    it 'should return ring 5 for 6.525' do
      Darts.ring(6.525).should == 5
    end

    it 'should return ring 6 for 6.7' do
      Darts.ring(6.7).should == 6
    end
  end
end
