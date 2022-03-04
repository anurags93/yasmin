class ReportController < ApplicationController
	authorize_resource :class => false
	layout 'dashboard'
	def index
		@report = TaxLine.all
		# authorize! :index, @report
	end
end
