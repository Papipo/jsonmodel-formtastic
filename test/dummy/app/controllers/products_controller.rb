class ProductsController < ApplicationController
  def new
    @product = JSONModel.from_hash(schema).new(params[:product])
  end
  
  protected
  def schema
    {
      "name" => "Product",
      "properties" => {
        "id" => {
          "type" => "number",
          "description" => "Product identifier",
          "required" => true
        },
        "name" => {
          "description" => "Name of the product",
          "type" => "string",
          "required" => true
        },
        "price" => {
          "required" => true,
          "type" =>  "number",
          "minimum" => 0
        },
        "tags" => {
          "type" => "array",
          "items" => {
            "type" => "string"
          }
        }
      },
      "links" => [
        {
          "rel" => "full",
          "href" => "{id}"
        },
        {
          "rel" => "comments",
          "href" => "comments/?id={id}"
        }
      ]
    }
  end
end