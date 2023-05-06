class CompanyMailer < ApplicationMailer
    def campaign_email
        @company = params[:company]
        mail(
            to: @company.email,
            subject: "welcome to CezAgora",
            template_name: 'campaign_email'
        )
    end
end
