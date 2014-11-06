require 'test/unit'
require 'test/unit/ui/console/testrunner'
require './polynomial.rb'

class PolynomialTest < Test::Unit::TestCase

end

Test::Unit::UI::Console::TestRunner.run(PolynomialTest)
