class Configuration
  def inititialize(*)
    @config = {}

    attributes.each do |attributes|
      define_singleton_method attribute do
        @config[attributes]
      end

      define_singleton_method ":#{attribute}=" do |value|
        @config[attributes] = value
      end
    end
  end
end
