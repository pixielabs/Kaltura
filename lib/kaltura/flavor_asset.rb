module Kaltura
  class FlavorAsset < DelegateClass(Hashie::Mash)
    extend ClientResource

    def self.get_by_entry_id(id)
      result = fetch('flavorAsset', 'getByEntryId', {entryId: id}).first.item
      
      if result.is_a? Array
        result.map{ |item| Kaltura::FlavorAsset.new(item) }
      else
        [Kaltura::FlavorAsset.new(result)]
      end
    end

    def flavorParamsId
      self['flavorParamsId'].to_i
    end

    private

    def self._ks_required?
      true
    end
  end
end


