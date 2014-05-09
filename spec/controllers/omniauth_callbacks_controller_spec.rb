require 'spec_helper'

describe OmniauthCallbacksController do
  it { should respond_to :github }
  it { should respond_to :twitter }
  it { should respond_to :linked_in }
end
