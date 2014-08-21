require 'feature_helper'

describe "StaticPagesSpecs", type: :request do

	context"signin page"
	before(:each) do
		visit signin_path
	end

end
