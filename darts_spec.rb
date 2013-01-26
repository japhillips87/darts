require './darts.rb'

describe Darts do
  describe 'score' do
    it 'should return a score of 6 for 3, 0' do
      Darts.new(3,0).score.should == 6
    end

    it 'should return a score of 20 for 0, 3' do
      Darts.new(0,3).score.should == 20
    end

    it 'should return a score of 60 for 0, 4.026' do
      Darts.new(0,4.026).score.should == 60
    end

    it 'should return a score of 40 for 0, 6.6' do
      Darts.new(0,6.6).score.should == 40
    end

    it 'should return a score of 50 for 0, 0.3' do
      Darts.new(0,0.3).score.should == 50
    end

    it 'should return a score of 25 for 0, 0.6' do
      Darts.new(0,0.6).score.should == 25
    end

    it 'should return a score of 50 for 0, 0' do
      Darts.new(0,0).score.should == 50
    end
  end

  describe 'get_theta' do
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

    it 'should return a theta of bullseye for 0, 0' do
      Darts.new(0,0).get_theta.should == 'bullseye'
    end
  end

  describe 'distance_from_bullseye' do
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

  describe 'slice' do
    before do
      @darts = Darts.new(1,1)
    end

    it 'should return 6 for a theta of 1' do
      @darts.theta = 1
      @darts.slice.should == 6
    end

    it 'should return 13 for a theta of 11' do
      @darts.theta = 11
      @darts.slice.should == 13
    end

    it 'should return 4 for a theta of 28' do
      @darts.theta = 28
      @darts.slice.should == 4
    end

    it 'should return 20 for a theta of 90' do
      @darts.theta = 90
      @darts.slice.should == 20
    end

    it 'should return 11 for a theta of 180' do
      @darts.theta = 180
      @darts.slice.should == 11
    end

    it 'should return 3 for a theta of 270' do
      @darts.theta = 270
      @darts.slice.should == 3
    end

    it 'should return 6 for a theta of 359' do
      @darts.theta = 359
      @darts.slice.should == 6
    end

    it 'should return 6 for a theta of 360' do
      @darts.theta = 360
      @darts.slice.should == 6
    end

    it 'should return 6 for a theta of 720' do
      @darts.theta = 720
      @darts.slice.should == 6
    end
  end

  describe 'ring' do
    before do
      @darts = Darts.new(1,1)
    end

    it 'should return ring 1 for 0.4' do
      @darts.distance = 0.4 
      @darts.ring.should == 1
    end

    it 'should return ring 2 for 1.25' do
      @darts.distance = 1.25 
      @darts.ring.should == 2
    end

    it 'should return ring 3 for 4.025' do
      @darts.distance = 4.025 
      @darts.ring.should == 3
    end

    it 'should return ring 4 for 4.2' do
      @darts.distance = 4.2 
      @darts.ring.should == 4
    end

    it 'should return ring 5 for 6.525' do
      @darts.distance = 6.525 
      @darts.ring.should == 5
    end

    it 'should return ring 6 for 6.7' do
      @darts.distance = 6.7 
      @darts.ring.should == 6
    end
  end
end
