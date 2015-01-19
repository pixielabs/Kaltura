module Kaltura
  class MediaEntry < DelegateClass(Hashie::Mash)
    extend ClientResource

    def update(options={})
      update_options = { :entryId => self.id , :mediaEntry => options }
      Kaltura::MediaEntry.fetch('media', 'update', update_options).first
      self.merge!(options)

      self
    end

    def self.delete(id)
      Kaltura::MediaEntry.fetch('media', 'delete', {entryId: id})
    end

    def self.get(id,version=nil)
      fetch('media', 'get', {:entryId => id, :version => version}).first
    end

    def self.list(options={})
      result = fetch('media', 'list', options).first.objects.item
      
      if result.is_a? Array
        result.map { |item| Kaltura::MediaEntry.new(item) }
      else
        [Kaltura::MediaEntry.new(result)]
      end
    end

    def self.convert(id, conversion_profile_id)
      fetch('media', 'convert', {entryId: id, conversionProfileId: conversion_profile_id})
    end

    private

    def self._ks_required?
      true
    end
  end
end
