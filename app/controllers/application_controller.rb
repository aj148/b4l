class ApplicationController < ActionController::Base
	$charities = [["First Candle", "First Candle"], ["Susan G. Komen", "Susan G. Komen"], ["WHO", "WHO"], ["Red Cross", "Red Cross"]]
	protect_from_forgery
end
