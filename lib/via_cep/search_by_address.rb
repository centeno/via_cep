# frozen_string_literal: true

module ViaCep
  # Search an address
  class SearchByAddress < Instance
    attr_reader :state, :city, :street

    def initialize(state:, city:, street:)
      @state = state
      @city = city
      @street = street

      is_valid?
      call_service
    rescue JSON::ParserError, Net::HTTPBadRequest
      raise ViaCep::Errors::AddressNotFound
    end

    private

    def is_valid?
      raise ViaCep::Errors::InvalidStateFormat unless ViaCep::Validators::State.valid?(state)
      raise ViaCep::Errors::InvalidAddressFormat unless city || state
    end

    def call_service
      request = HTTP.get(path: "#{state}/#{city}/#{street}")
      raise ViaCep::Errors::AddressNotFound if request.code != '200'

      response = JSON.parse(request.body)
      raise ViaCep::Errors::AddressNotFound if response.length === 0

      define_attributes(response[0])
    end
  end
end
