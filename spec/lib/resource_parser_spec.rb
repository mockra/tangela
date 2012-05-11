require 'spec_helper'
require 'resource_parser'

describe ResourceParser do

  describe 'link' do

    it 'should return nil for invalid url' do
      url = ResourceParser.link 'http://github.com'
      url.should be_nil
    end

    it 'should return a link for valid url' do
      url = ResourceParser.link 'google.com'
      url.should_not be_nil
    end

  end

  describe 'format_link' do

    it 'should reformat a bad url' do
      url = ResourceParser.format_link 'google.com'
      url.should == 'http://google.com'
    end

    it 'should not reformat good url' do
      url = ResourceParser.format_link 'http://google.com'
      url.should == 'http://google.com'
    end

  end

  describe 'get_image' do

    it 'should return nil for invalid URL' do
      image = ResourceParser.get_image 'http://github.com'
      image.should be_nil
    end

    it 'should return an image' do
      image = ResourceParser.get_image 'http://google.com'
      image.should_not be_nil
    end

  end

  describe 'format_image' do

    before do
      @url = 'http://google.com'
      @img = 'test.png'
    end

    it 'should return nil for invalid format' do
      @img = 'test'
      temp = ResourceParser.format_image( @img, @url )
      temp.should be_nil
    end

    it 'should add / to relative img path' do
      temp = ResourceParser.format_image( @img, @url )
      temp.should == "#{@url}/#{@img}"
    end

    it 'should not add / to absolute img path' do
      @img = '/test.png'
      temp = ResourceParser.format_image( @img, @url )
      temp.should == "#{@url}#{@img}"
    end

    it 'should not alter complete img link' do
      @img = 'http://google.com/test.png'
      temp = ResourceParser.format_image( @img, @url )
      temp.should == @img
    end

  end

end
