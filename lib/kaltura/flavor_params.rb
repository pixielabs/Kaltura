module Kaltura
  class FlavorParams < DelegateClass(Hashie::Mash)
    extend ClientResource

    def self.list(options={})
      fetch('flavorParams', 'list', options).first.objects.item.map{ |item| Kaltura::FlavorParams.new(item) }
    end

    def self.get_by_conversion_profile_id(conversion_profile_id)
      fetch('flavorParams', 'getByConversionProfileId', {conversionProfileId: conversion_profile_id}).first.item
    end

    private

    def self._ks_required?
      true
    end
  end
end
