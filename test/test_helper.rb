require 'rubygems'
require 'test/unit'

test_dir = File.dirname(__FILE__)

# Install the non-Rails shoulda gem with 'gem install Shoulda'
# Notice the capitalization in the name.
require 'shoulda'
require 'mocha'

# Just load redgreen if not running tests from TextMate
IN_TM = !ENV['TM_DIRECTORY'].nil?
require 'redgreen' unless IN_TM

require 'ruby-debug'

require File.join(test_dir, 'git_helper')
require File.join( [test_dir] + %w{ .. lib git_remote_branch} )

class Test::Unit::TestCase
  attr_reader :grb
  def setup
    @grb = Object.new
    @grb.send :extend, GitRemoteBranch
  end
  
  def assert_false(condition, message = nil)
    message = "assert_false failed" unless message
    assert condition == false, message
  end
end
