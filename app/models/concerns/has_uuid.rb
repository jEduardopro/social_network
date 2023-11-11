module HasUuid
	extend ActiveSupport::Concern

	included do
		before_validation :generate_uuid, on: :create
	end

	private

	def generate_uuid
		self.uuid = model_uuid unless uuid.present?
	end

	def model_uuid
		"#{SecureRandom.uuid.gsub('-', '')}"
	end

end