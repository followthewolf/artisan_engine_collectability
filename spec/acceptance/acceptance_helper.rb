require 'spec_helper'
require 'steak'

# ---------------------- Load Support Files ---------------------- #

include ArtisanEngine::Core::TestHelpers::Integration
include ArtisanEngine::Collectability::TestHelpers::Integration

Dir[ "#{ File.dirname( __FILE__ ) }/support/**/*.rb" ].each { |f| require f }