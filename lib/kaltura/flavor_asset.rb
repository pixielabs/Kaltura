module Kaltura
  class FlavorAsset < DelegateClass(Hashie::Mash)
    extend ClientResource

    def self.get_by_entry_id(id)
      fetch('flavorAsset', 'getByEntryId', {entryId: id}).first.item.map{ |item| Kaltura::FlavorAsset.new(item) }
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


