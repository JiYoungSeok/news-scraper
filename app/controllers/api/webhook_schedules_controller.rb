module Api
    class WebhookSchedulesController < ApiController
        def create
            webhook_schedule = WebhookSchedule.new(webhook_schedule_params)

            if webhook_schedule.save
                head :ok
            else
                head :unprocessable_entity
            end
        end

        private

        def webhook_schedule_params
            params.require(:webhook_schedule).permit(:webhook_url, :time)
        end
    end
end
