class UserMailer < ApplicationMailer

	def contact_email(email, name, message)
		mail(to: 'contact@watch.coop', from: email , subject: '<watch> CONTACT SITE', body: message)
	end


end
