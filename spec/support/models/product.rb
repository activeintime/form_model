class Product
  attr_accessor :id, :price, :name, :description, :start_at
  
  include ActiveModel::AttributeMethods
  include ActiveModel::Dirty
  
  define_attribute_methods [:title]
  
  def title
    @title
  end

  def title=(val)
    title_will_change! unless val == @title
    @title = val
  end

  def price
    @price ||= {}
  end

  def attributes
    {"id" => id, "price" => price, "description" => description, "title" => title, start_at: start_at}
  end

  def write_attributes(attributes)
    attributes.each do |attr, value|
      self.send("#{attr}=", value)
    end
  end

  def valid?(context = nil)
    true
  end

  def errors
    {}
  end
  
  def fields
    { id: id, price: price, name: name, description: description, start_at: start_at }
  end
  
  def relations
    Relation.new
  end

end
