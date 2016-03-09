class ApplicationController < ActionController::Base
	$charities = [["CJ Foundation for SIDS", "CJ Foundation for SIDS"], ["Charlie's Kids", "Charlie's Kids"], 
	["First Candle", "First Candle"], ["Butler High School DECA Philanthropy", "Butler High School DECA Philanthropy"],
	["Cure Finders for Cystic Fibrosis", "Cure Finders for Cystic Fibrosis"],["Duke Delta Gamma: Service for Sight","Duke Delta Gamma: Service for Sight"],
	["Cribs for Kids","Cribs for Kids"]]
	protect_from_forgery
end
