class BillMailer < ApplicationMailer
	def new_bill_email
	    @bill = params[:bill]

	    mail(to: "sharmaanurag356@gmail.com", subject: "Invoice!")
	end
end
