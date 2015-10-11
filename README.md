#fugazi

A simple gem providing a dsl for defining and initializing class fields

## example

```ruby
class Box
  include Fugazi

  fields :content
  defaults x: 0, y: 0
  keywords z: 0
end

# <=>
class Box
  attr_reader :content, :x, :y, :z

  def initialize(content, x = 0, y = 0, z: 0)
    @content = content
    @x = x
    @y = y
    @z = z
  end
end
```

##implementation
`fugazi` saves the arg labels and default values in class inst variables and combines them with args in `#initialize`

##todo

block support
error handling
