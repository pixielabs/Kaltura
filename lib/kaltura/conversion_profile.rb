module Kaltura
  class ConversionProfile < DelegateClass(Hashie::Mash)
    extend ClientResource

    def self.list(options={})
      fetch('conversionProfile', 'list', options).first.objects.item.map{ |item| Kaltura::ConversionProfile.new(item) }
    end

    def self.get(id)
      fetch('conversionProfile', 'get', {:id => id}).first
    end

    def flavorParamsIds
      self['flavorParamsIds'].split ','
    end

    private

    def self._ks_required?
      true
    end
  end
end

