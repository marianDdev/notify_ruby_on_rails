class ManufacturerMailer < ApplicationMailer
    def campaign_email
        @manufacturer = params[:manufacturer]
        mail(
            to: @manufacturer.email,
            subject: "welcome to CezAgora",
            template_name: 'campaign_email'
        )
    end
end
