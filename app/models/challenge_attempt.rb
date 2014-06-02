require 'socket'
class ChallengeAttempt < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user
  scope :solved, -> { where(passed: true)}
  before_save :run
  before_create :init
  
  #validates_existence_of :user, :challenge
  
  DOCKER_SERVER_HOST = ENV["DOCKER_SERVER_HOST"]
  DOCKER_SERVER_PORT = ENV["DOCKER_SERVER_PORT"]
  
  def init
    self.attempts = 1
  end
  
  def run
    socket = TCPSocket.new(DOCKER_SERVER_HOST,DOCKER_SERVER_PORT)
    if self.test == "1"
      socket.write("#{self.code}\000#{self.test_code}\000#{self.user.id}\000")
    else
      socket.write("#{self.code}\000#{self.challenge.tests}\000#{self.user.id}\000")
    end
    response = socket.read
    if response.empty?
      self.result = "Code failed to compile, please try again"
    else
      self.result = response
    end
    #if response is empty, code didn't compile
    #extract the responses here   
  end
end
