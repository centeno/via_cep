# encoding: utf-8
# frozen_string_literal: true
require 'httparty'
require 'via_cep/version'

# Core
require 'via_cep/address'
require 'via_cep/methods'
require 'via_cep/search_by_address'

# Validators
require 'via_cep/validators/zipcode'
require 'via_cep/validators/state'

# Errors
require 'via_cep/errors/invalid_zipcode_format'
require 'via_cep/errors/invalid_state_format'
require 'via_cep/errors/zipcode_not_found'
require 'via_cep/errors/address_not_found'

# Utils
require 'via_cep/utils/utils'
